-- 
vim.cmd('set autochdir')

-- nvim-tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 「※」等の記号を打つと、半角文字と重なる問題がある。「※」などを全角文字の幅で表示するために設定する
vim.opt.ambiwidth = 'double'

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cursorline = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.number = true

vim.opt.relativenumber = false
vim.opt.termguicolors = true
vim.opt.virtualedit = 'block'

vim.opt.mouse = 'a'
vim.opt.title = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hidden = true
vim.opt.clipboard:append 'unnamedplus'
vim.opt.syntax = 'on'
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.smartcase = true
vim.opt.ruler = true
vim.opt.laststatus = 2
vim.opt.showcmd = true
vim.opt.wildmenu = true
vim.opt.filetype = "plugin", "indent","on"
vim.opt.visualbell = true
vim.opt.showmatch = true
-- vim.opt.list = true
-- vim.opt.listchars = {tab='>-', trail='*', nbsp='+'}
vim.opt.ignorecase = true
vim.opt.wrapscan = true
vim.opt.whichwrap = 'b', 's', 'h', 'l', '<', '>', '[', ']'
vim.opt.backspace = 'start', 'eol', 'indent'
vim.opt.fileformats = 'dos', 'unix', 'mac'
vim.opt.helplang = 'ja', 'en'
vim.opt.updatetime = 300
vim.opt.showtabline = 2
vim.opt.scrolloff = 3

vim.opt.guifont = 'HackGen Console NF:h13'

vim.g.mapleader=' '
vim.g.maplocalleader=' '

vim.api.nvim_create_user_command('Hoge', 'e $MYVIMRC', {})
vim.api.nvim_create_user_command('Gero', 'so $MYVIMRC', {})

-- Terminal Mode
vim.keymap.set('t','<Esc>',[[<C-\><C-n>]], {noremap=true})
vim.api.nvim_create_autocmd('TermOpen', { command = 'startinsert' })

-- Keymap
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', '<Esc><Esc>', ':nohlsearch<CR>')


--
--Neovim の環境構築方法
--https://zenn.dev/kenkenlysh/articles/6c93a4dbfeb2e2
--
vim.g.mapleader = ' ' -- 半角スペースを設定しています。
vim.keymap.set('i', 'jj', '<ESC>', {silent=true}) -- インサートモードを抜ける
vim.keymap.set('n', ';', ':', {silent=true}) -- シフトを押すことなく、;を入力する。割と便利

vim.keymap.set('n', '<leader>sv', '<C-w>v') -- ウィンドウを垂直方向に分割する
vim.keymap.set('n', '<leader>sh', '<C-w>s') -- ウィンドウを水平に分割する
vim.keymap.set('n', '<leader>se', '<C-w>=') -- ウィンドウの幅を等分にする
vim.keymap.set('n', '<leader>sx', ':close<CR>') -- 現在、カーソルがいるウィンドウを閉じる
vim.keymap.set('n', '<leader>sw', '<C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>>') -- ウィンドウの幅を少し広げる
vim.keymap.set('n', '<leader>sww', '<C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>><C-w>>') -- ウィンドウの幅を大きく広げる
vim.keymap.set('n', '<leader>st', '<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><') -- ウィンドウの幅を少し狭める
vim.keymap.set('n', '<leader>stt', '<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><') -- ウィンドウの幅を大きく狭める

-- タブを作成、削除
vim.keymap.set('n', '<leader>to', ':tabnew<CR>')
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>')
vim.keymap.set('n', '<leader>tn', ':tabn<CR>')
vim.keymap.set('n', '<leader>tp', ':tabp<CR>')
-- ウィンドウを移動する
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
-- 単語を' " どちらかで囲う
vim.keymap.set('n', '<leader>aw', 'ciw""<Esc>P')
vim.keymap.set('n', '<leader>aW', "ciw''<Esc>P")

--
--

-- 全角スペースとゼロ幅スペースをハイライト
vim.api.nvim_create_augroup('extra-whitespace', {})
vim.api.nvim_create_autocmd({'VimEnter', 'WinEnter'}, {
  group = 'extra-whitespace',
  pattern = {'*'},
  command = [[call matchadd('ExtraWhitespace', '[\u200B\u3000]')]]
})
vim.api.nvim_create_autocmd({'ColorScheme'}, {
  group = 'extra-whitespace',
  pattern = {'*'},
  command = [[highlight default ExtraWhitespace ctermbg=202 ctermfg=202 guibg=salmon]]
})

-- Markdownファイルにおいて一部の _ がハイライトするのを防止する
local cmhgroup = vim.api.nvim_create_augroup('clear_markdownError_highlight', { clear = true })
vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = 'markdown',
  group = cmhgroup,
  command = 'highlight link markdownError NONE'
})

-- Jetpack Plugin Maneger を自動でダウンロードする
local jetpackfile = vim.fn.stdpath('data') .. '/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
local jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
if vim.fn.filereadable(jetpackfile) == 0 then
  vim.fn.system(string.format('curl -fsSLo %s --create-dirs %s', jetpackfile, jetpackurl))
end
vim.cmd('packadd vim-jetpack')
require('jetpack.paq') {
  {'tani/vim-jetpack', opt = 1}, -- bootstrap
  {'rhysd/clever-f.vim'},
  {'tpope/vim-surround'},
  {'terryma/vim-expand-region'},
  {'pocco81/auto-save.nvim'}, -- toggle command: ASToggle
  -- {'vim-scripts/vim-auto-save'},
  {'EdenEast/nightfox.nvim'},

  {'freddiehaddad/feline.nvim'},
  {'nanozuki/tabby.nvim'},
  --{'itchyny/lightline.vim'},

  {'pepo-le/win-ime-con.nvim'},
  {'machakann/vim-highlightedyank'},
  {'vim-jp/vimdoc-ja'},
  {'nvim-tree/nvim-tree.lua'}, -- ファイルマネジャ
  {'nvim-tree/nvim-web-devicons'}, -- option nvim-tree 
  {'goolord/alpha-nvim'}, -- スタート画面設定
  {'windwp/nvim-autopairs'},

  {'glidenote/memolist.vim'},
}
-- fefine
-- https://github.com/freddiehaddad/feline.nvim
require('feline').setup()
--require('feline').statuscolumn.setup()

-- tabby.nvim
-- https://github.com/nanozuki/tabby.nvim
local theme = {
  fill = 'TabLineFill',
  -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
  head = 'TabLine',
  current_tab = 'TabLineSel',
  tab = 'TabLine',
  win = 'TabLine',
  tail = 'TabLine',
}
require('tabby.tabline').set(function(line)
  return {
    {
      { '  ', hl = theme.head },
      line.sep('', theme.head, theme.fill),
    },
    line.tabs().foreach(function(tab)
      local hl = tab.is_current() and theme.current_tab or theme.tab
      return {
        line.sep('', hl, theme.fill),
        tab.is_current() and '' or '󰆣',
        tab.number(),
        tab.name(),
        tab.close_btn(''),
        line.sep('', hl, theme.fill),
        hl = hl,
        margin = ' ',
      }
    end),
    line.spacer(),
    line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
      return {
        line.sep('', theme.win, theme.fill),
        win.is_current() and '' or '',
        win.buf_name(),
        line.sep('', theme.win, theme.fill),
        hl = theme.win,
        margin = ' ',
      }
    end),
    {
      line.sep('', theme.tail, theme.fill),
      { '  ', hl = theme.tail },
    },
    hl = theme.fill,
  }
end)

-- nightfox.nvim
-- vim.cmd('colorscheme nightfox')
-- vim.cmd('colorscheme dayfox')
-- vim.cmd('colorscheme dawnfox')
-- vim.cmd('colorscheme duskfox')
-- vim.cmd('colorscheme nordfox')
vim.cmd('colorscheme terafox')
-- vim.cmd('colorscheme carbonfox')

-- nvim-tree
-- disable netrw at the very start of your init.lua
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
-- empty setup using defaults
--require("nvim-tree").setup()
-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
require('nvim-web-devicons').setup {
  -- your personnal icons can go here (to override)
  -- you can specify color or cterm_color instead of specifying both of them
  -- DevIcon will be appended to `name`
  override = {
    zsh = {
      icon = "",
      color = "#428850",
      cterm_color = "65",
      name = "Zsh"
    }
  };
  -- globally enable different highlight colors per icon (default to true)
  -- if set to false all icons will have the default icon's color
  color_icons = true;
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true;
  -- globally enable "strict" selection of icons - icon will be looked up in
  -- different tables, first by filename, and if not found by extension; this
  -- prevents cases when file doesn't have any extension but still gets some icon
  -- because its name happened to match some extension (default to false)
  strict = true;
  -- same as `override` but specifically for overrides by filename
  -- takes effect when `strict` is true
  override_by_filename = {
    [".gitignore"] = {
      icon = "",
      color = "#f1502f",
      name = "Gitignore"
    }
  };
  -- same as `override` but specifically for overrides by extension
  -- takes effect when `strict` is true
  override_by_extension = {
    ["log"] = {
      icon = "",
      color = "#81e043",
      name = "Log"
    }
  };
}

-- alpha-nvim
--https://vim.blue/startify/
require'alpha'.setup(require'alpha.themes.startify'.config)

-- nvim-autopairs
require("nvim-autopairs").setup {}

-- memolist
vim.g.memolist_path="~/OneDrive/vim-memolist"
vim.g.memolist_memo_suffix = "md"
vim.g.memolist_template_dir_path="~/OneDrive/vim-memolist"
vim.keymap.set('','<Leader>mn',':MemoNew<CR>')
vim.keymap.set('','<Leader>ml',':MemoList<CR>')
vim.keymap.set('','<Leader>mg',':MemoGrep<CR>')

-- フォントの幅を調整
-- https://zenn.dev/laddge/articles/369ee2672b4424
local cellwidths = vim.fn.getcellwidths()
-- Unicode Standard Miscellaneous Symbols
table.insert(cellwidths, { 0x2600, 0x26ff, 1 })
-- Seti-UI + Custom
table.insert(cellwidths, { 0xe5fa, 0xe6ac, 1 })
-- Devicons
table.insert(cellwidths, { 0xe700, 0xe7c5, 1 })
-- Font Awesome
table.insert(cellwidths, { 0xf000, 0xf2e0, 1 })
-- Font Awesome Extension
table.insert(cellwidths, { 0xe200, 0xe2a9, 1 })
-- Material Design Icons
table.insert(cellwidths, { 0xf0001, 0xf1af0, 1 })
-- Weather
table.insert(cellwidths, { 0xe300, 0xe3e3, 1 })
-- Octicons
table.insert(cellwidths, { 0xf400, 0xf532, 1 })
-- Powerline Symbols
table.insert(cellwidths, { 0xe0a0, 0xe0a2, 1 })
table.insert(cellwidths, { 0xe0b0, 0xe0b3, 1 })
-- Powerline Extra Symbols
table.insert(cellwidths, { 0xe0a3, 0xe0a3, 1 })
table.insert(cellwidths, { 0xe0b4, 0xe0c8, 1 })
table.insert(cellwidths, { 0xe0ca, 0xe0ca, 1 })
table.insert(cellwidths, { 0xe0cc, 0xe0d4, 1 })
-- IEC Power Symbols
table.insert(cellwidths, { 0x23fb, 0x23fe, 1 })
table.insert(cellwidths, { 0x2b58, 0x2b58, 1 })
-- Font Logos
table.insert(cellwidths, { 0xf300, 0xf32f, 1 })
-- Pomicons
table.insert(cellwidths, { 0xe000, 0xe00a, 1 })
-- Codicons
table.insert(cellwidths, { 0xea60, 0xebeb, 1 })
-- Heavy Angle Brackets
table.insert(cellwidths, { 0x276c, 0x2771, 1 })
-- Box Drawing
table.insert(cellwidths, { 0x2500, 0x259f, 1 })
vim.fn.setcellwidths(cellwidths)
--
--

--
--
local jetpack = require('jetpack')
for _, name in ipairs(jetpack.names()) do
  if not jetpack.tap(name) then
    jetpack.sync()
    break
  end
end
--
--
