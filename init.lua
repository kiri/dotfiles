-- init.lua
-- dofile("D:/OneDrive/share/config/nvim/init.lua")
if vim.g.vscode then
  local vscode = require('vscode-neovim')

  vim.keymap.set('n', 'k', function()
    local count = vim.v.count > 0 and vim.v.count or 1
    vscode.action('cursorMove', {
      args = {
        to = 'up',
        by = 'wrappedLine',
        value = count
      },
    },{ expr = true })
  end)

  vim.keymap.set('n', 'j', function()
    local count = vim.v.count > 0 and vim.v.count or 1
    vscode.action('cursorMove', {
      args = {
        to = 'down',
        by = 'wrappedLine',
        value = count
      },
    },{ expr = true })
  end)

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

IM = 0
local zenhan = os.getenv("LOCALAPPDATA") .. '/zenhan/bin64/zenhan.exe'
print(zenhan)
vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
    pattern = { "*" },
    callback = function() os.execute(zenhan .. ' ' .. IM) end
})
vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
    pattern = { "*" },
    callback = function()
        local handle = io.popen(zenhan .. ' 0', "r")
        if (handle) then
            IM = handle:read("*all")
            handle:close()
        end
    end
})
vim.api.nvim_create_autocmd({ 'CmdlineLeave' }, {
    pattern = { "*" },
    callback = function() os.execute(zenhan .. ' 0') end
})

vim.notify('initialization complated')

