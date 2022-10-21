local o = vim.o
local g = vim.g

g.mapleader=" "
g.material_style = "palenight"
g.loaded = 1
g.loaded_netrwPlugin = 1

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

o.hidden=true
o.cmdheight=1
o.updatetime=300
o.relativenumber=true
o.number=true
o.encoding="utf-8"
o.termguicolors=true
o.background="dark"
o.hlsearch=true
o.incsearch=true
o.ignorecase=true
o.smartcase=true
o.cursorline=true
o.showmatch=true
o.signcolumn='yes'
o.cindent=true
o.ruler=true
o.clipboard="unnamedplus"
o.mouse="a"
o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
o.wrap = false
o.tabstop=4 
o.softtabstop=-1
o.shiftwidth=2
o.expandtab=true
o.smarttab=true

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

require("maps")
require("plugins")
require("plugins-config")


-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

