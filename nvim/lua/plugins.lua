return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'ryanoasis/vim-devicons'
    use 'marko-cerovac/material.nvim'
    use 'tpope/vim-surround'
    use 'sheerun/vim-polyglot'
    use 'mg979/vim-visual-multi'
    use 'alvan/vim-closetag'
    use 'norcalli/nvim-colorizer.lua'
    use 'jiangmiao/auto-pairs'
    use 'editorconfig/editorconfig-vim'
    use 'MunifTanjim/eslint.nvim'
    use 'pedro757/emmet'

    use {
      'phaazon/hop.nvim',
      branch = 'v2', -- optional but strongly recommended
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      end
    }
    use 'scrooloose/nerdcommenter'
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind.nvim'
    use 'joshdick/onedark.vim'

    use 'jose-elias-alvarez/null-ls.nvim'
    use 'MunifTanjim/prettier.nvim'

    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use 'lewis6991/gitsigns.nvim'

    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
    })

    use "rafamadriz/friendly-snippets"
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin

    -- Syntax
    use 'PotatoesMaster/i3-vim-syntax'
    use 'kovetskiy/sxhkd-vim'
    use 'vim-python/python-syntax'
    use 'ap/vim-css-color'
    use 'yggdroot/indentline'
    use 'frazrepo/vim-rainbow'

    -- Keys mapping to move like tmux
    use 'benmills/vimux'
    use 'christoomey/vim-tmux-navigator'

    use { 'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    require('lualine').setup()

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
end)
