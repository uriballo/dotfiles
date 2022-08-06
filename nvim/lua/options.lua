local o = vim.o
local g = vim.g
local fn = vim.fn

o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50" -- block in normal and beam cursor in insert mode
o.updatetime = 300 -- faster completion

o.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
o.termguicolors = true
o.scrolloff = 8

o.number = true
o.numberwidth = 2
o.relativenumber = true

o.expandtab = true
o.smarttab = true
o.cindent = true
o.autoindent = true
o.wrap = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = -1
o.list = true
o.clipboard = 'unnamedplus'
o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'

g.mapleader = ' '
g.maplocalleader = ' '

vim.cmd("colorscheme onedarkpro")
