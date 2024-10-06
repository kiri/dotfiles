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

--
vim.g.memolist_path = "~/.memolist/memo"
vim.g.memolist_memo_suffix = "md"
vim.g.memolist_fzf = 0
vim.g.memolist_template_dir_path = "~/.memolist/memotemplates"

vim.cmd[[colorscheme nord]]
vim.g.lightline={colorscheme='nord'}

--local zenhan_manager = require('zenhan')
--print(zenhan_manager.IM)  -- 現在のIMの状態を表示

--vim.notify('initialization complated')
