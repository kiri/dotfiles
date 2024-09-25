-- init.lua
if vim.g.vscode then
  local vscode = require('vscode-neovim')

else
    vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
    vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
    vim.api.nvim_set_keymap('n', '<Down>', 'gj', { noremap = true })
    vim.api.nvim_set_keymap('n', '<Up>', 'gk', { noremap = true })
    vim.api.nvim_set_keymap('n', 'gj', 'j', { noremap = true })
    vim.api.nvim_set_keymap('n', 'gk', 'k', { noremap = true })
end

vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.o.fileencodings = 'utf-8,cp932'
vim.o.ambiwidth = 'double'
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

require('plugins')
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "plugins.lua" },
  command = "PackerCompile",
})

vim.api.nvim_set_keymap("n", "<leader>n", ":ASToggle<CR>", {})

local zenhan_manager = require('zenhan')
print(zenhan_manager.IM)  -- 現在のIMの状態を表示

vim.notify('initialization complated')

