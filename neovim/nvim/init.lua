-- init.lua
require('options')
require('keymaps')

-- Nvy 
vim.o.guifont="HackGen35 Console NF:h14"

-- Terminal
vim.o.shell = "powershell.exe"
vim.api.nvim_create_autocmd({"TermOpen"}, { pattern = {"*"}, command = ":startinsert", })
vim.api.nvim_create_autocmd({"TermOpen"}, { pattern = {"*"}, command = "setlocal norelativenumber", })
vim.api.nvim_create_autocmd({"TermOpen"}, { pattern = {"*"}, command = "setlocal nonumber", })

--vim.cmd('GonvimResize "1000x1000"')

local zenhan_manager = require('zenhan')
--print(zenhan_manager.IM)  -- 現在のIMの状態を表示
--vim.notify('initialization complated')
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec ={
        import = "plugins",
    },
    checker = {
        enabled = true,
        notify = false,
    },
})

