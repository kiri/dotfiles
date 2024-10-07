-- init.lua
if vim.g.vscode then
  local vscode = require('vscode-neovim')
  require('options')
else
  require('options')
  require('keymaps')
end

require('plugins')
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "plugins.lua" },
  command = "PackerCompile",
})

vim.cmd[[colorscheme nord]]

--local zenhan_manager = require('zenhan')
--print(zenhan_manager.IM)  -- 現在のIMの状態を表示

--vim.notify('initialization complated')
