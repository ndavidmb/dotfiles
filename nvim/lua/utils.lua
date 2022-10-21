local M = {}

function M.map(mode, lhs, rhs, opts)
    local options = { silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.dmap(shortcut, command, bufopts)
  vim.keymap.set('n', shortcut, command, bufopts)
end

return M
