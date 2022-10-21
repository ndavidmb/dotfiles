local map = require('utils').map

map('', 'ñ', '^')
map('n', 'Y', 'yyp')
map('n', 'J', ':tabprevious<CR>')
map('n', 'K', ':tabnext<CR>')
map('i', '<Esc>', '<C-c>', { noremap = true })

map('n', '<Leader>sm', 'zf%')
map('n', '<Leader>sn', 'za')
map('n', '<Leader>v', '^v$ge')
map('n', '<Leader>+', '10<C-w>>', { noremap = true })
map('n', '<Leader>-', '10<C-w><', { noremap = true })
map('n', '<Leader>v', '^v$ge')
map('n', '<Leader>al', ':tabonly<CR>')
map('n', '<Leader>si', ':Prettier<CR>')
map('n', '<Leader>h', ':HopChar2<CR>')

-- Telescope
map('n', 'gr', ':LspSaga lsp_finder<CR>')
map('n', '<Leader>p', ':Telescope find_files hidden=true<CR>')
map('n', '<Leader>ag', ':Telescope live_grep<CR>')
map('n', '<Leader>gc', ':Telescope git_commits<CR>')
map('n', '<Leader>gb', ':Telescope git_branches<CR>')
map('n', '<Leader>gs', ':Telescope git_status<CR>')

-- Tree
map('n', '<Leader>nt', ':NvimTreeFindFile<CR>')
