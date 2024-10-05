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
local nord=require('nord.named_colors')
local feline_nord = {
	fg = nord.white,
	bg = nord.black,
	black = nord.black,
	skyblue = nord.off_blue,
	cyan = "#a89984",
	green = nord.green,
	oceanblue = nord.blue,
	magenta = "#fb4934",
	orange = nord.orange,
	red = nord.red,
	violet = nord.purple,
	white = nord.white,
	yellow = nord.yellow,
}
--local feline = require("feline")
--feline.setup({
require("feline").setup({
	preset = "noicon",
        theme = feline_nord
})
--feline.use_theme(feline_nord)

--local feline_gruvbox = {
--	fg = "#ebdbb2",
--	bg = "#32302f",
--	black = "#32302f",
--	skyblue = "#83a598",
--	cyan = "#a89984",
--	green = "#98971a",
--	oceanblue = "#458588",
--	magenta = "#fb4934",
--	orange = "#d65d0e",
--	red = "#fb4934",
--	violet = "#b16286",
--	white = "#ebdbb2",
--	yellow = "#d79921",
--}
--feline.use_theme(feline_gruvbox)
--require('nord').set()
--require('feline').setup()
--require('feline').use_theme('nord')

--local zenhan_manager = require('zenhan')
--print(zenhan_manager.IM)  -- 現在のIMの状態を表示

--vim.notify('initialization complated')
