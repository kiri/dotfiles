-- init.lua
require('options')
require('keymaps')
require('plugins')

vim.o.guifont="HackGen35 Console NF:h14"

--FontFamily = "HackGen35 Console NF, HackGen35, BIZ UDゴシック, Windows"
-- Terminal
vim.o.shell = "powershell.exe"
vim.api.nvim_create_autocmd({"TermOpen"}, { pattern = {"*"}, command = ":startinsert", })
vim.api.nvim_create_autocmd({"TermOpen"}, { pattern = {"*"}, command = "setlocal norelativenumber", })
vim.api.nvim_create_autocmd({"TermOpen"}, { pattern = {"*"}, command = "setlocal nonumber", })

--vim.cmd('GonvimResize "1000x1000"')

local zenhan_manager = require('zenhan')
--print(zenhan_manager.IM)  -- 現在のIMの状態を表示
--vim.notify('initialization complated')
