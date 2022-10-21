local cmd = vim.cmd
local dmap = require('utils').dmap


cmd [[ au VimLeave,VimSuspend * set guicursor=a:ver25 ]]
cmd 'colorscheme material'

require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "node_modules" },
    mappings = {
      i = {
        ["<C-u>"] = false
      },
    },
  },
}


require('material').setup({
   contrast = {
        sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        floating_windows = true, -- Enable contrast for floating windows
        cursor_line = true, -- Enable darker background for the cursor line
        non_current_windows = true, -- Enable darker background for non-current windows
        popup_menu = true, -- Enable lighter background for the popup menu
    },

    italics = {
        comments = true, -- Enable italic comments
        keywords = true, -- Enable italic keywords
        functions = true, -- Enable italic functions
        strings = true, -- Enable italic strings
        variables = true -- Enable italic variables
    },
})

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  open_on_setup = true,
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
})

-- LSP
local opts = { noremap=true, silent=true }
dmap('<space>e', vim.diagnostic.open_float, opts)
dmap('[d', vim.diagnostic.goto_prev, opts)
dmap(']d', vim.diagnostic.goto_next, opts)
dmap('<space>sl', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }

  dmap('gh', ':Lspsaga hover_doc<CR>', bufopts)
  dmap('gd', vim.lsp.buf.implementation, bufopts)
  dmap('<space>rn', ':Lspsaga rename<CR>', bufopts)
  dmap('<space>ca', ':Lspsaga code_action<CR>', bufopts)
  dmap('<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- Autocompletion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')
local configs = require'lspconfig.configs'

if not configs.ls_emmet then
    configs.ls_emmet = {
    default_config = {
      cmd = { 'ls_emmet', '--stdio' };
      filetypes = {
        'html',
        'javascriptreact',
        'typescriptreact',
        'xml',
      };
      root_dir = function(fname)
        return vim.loop.cwd()
      end;
      settings = {};
    };
  }
end

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 
  'pyright',
  'tsserver',
  'angularls',
  'html',
  'tailwindcss',
  'ls_emmet',
  'eslint',
  'cssls',
  'jsonls',
  'sqlls'
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<C-j>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-k>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()
require('gitsigns').setup{}

local lspkind = require('lspkind')
cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
    })
  }
}


require'nvim-treesitter.configs'.setup {
    ensure_installed = { "typescript", "javascript", "python", "css", "html", "tsx", "scss", "sql" },
    auto_install = true,
    highlight = {
      enable = true,
    },
    autotag = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
    },
    indent = {
      enable = true,
    },
}


require'mason'.setup {}
require'hop'.setup {}
require'mason-lspconfig'.setup {
  ensure_installed = { "tailwindcss" }
}

require'eslint'.setup({
  bin = 'eslint', -- or `eslint_d`
  code_actions = {
    enable = true,
    apply_on_save = {
      enable = true,
      types = { "problem" }, -- "directive", "problem", "suggestion", "layout"
    },
    disable_rule_comment = {
      enable = true,
      location = "separate_line", -- or `same_line`
    },
  },
  diagnostics = {
    enable = true,
    report_unused_disable_directives = false,
    run_on = "type", -- or `save`
  },
})

