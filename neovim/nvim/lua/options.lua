--
vim.o.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'

--
vim.opt.helplang = 'ja'
--
vim.g.loaded_gzip              = 1
vim.g.loaded_tar               = 1
vim.g.loaded_tarPlugin         = 1
vim.g.loaded_zip               = 1
vim.g.loaded_zipPlugin         = 1
vim.g.loaded_rrhelper          = 1
vim.g.loaded_2html_plugin      = 1
vim.g.loaded_vimball           = 1
vim.g.loaded_vimballPlugin     = 1
vim.g.loaded_getscript         = 1
vim.g.loaded_getscriptPlugin   = 1
vim.g.loaded_netrw             = 1
vim.g.loaded_netrwPlugin       = 1
vim.g.loaded_netrwSettings     = 1
vim.g.loaded_netrwFileHandlers = 1
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
