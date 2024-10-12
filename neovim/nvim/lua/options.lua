--
vim.o.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'

--
vim.o.fileencoding = 'utf-8'
vim.o.fileencodings = 'utf-8,cp932'
--vim.o.ambiwidth = 'double'
vim.o.number = true
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.autochdir = true
vim.o.clipboard = 'unnamedplus'
vim.o.wildmode = 'full'
vim.o.visualbell = true
vim.o.showmatch = true
vim.o.matchtime = 1
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohl<CR>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.opt.clipboard:append { 'unnamedplus' }
vim.o.ttimeout = true
vim.o.ttimeoutlen = 50
