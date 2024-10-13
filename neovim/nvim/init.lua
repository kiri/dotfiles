-- init.lua
require('options')
require('keymaps')
require('plugins')

--
--vim.cmd[[colorscheme nord]]
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- Terminal
vim.api.nvim_create_autocmd({"TermOpen"}, { pattern = {"*"}, command = ":startinsert", })
vim.api.nvim_create_autocmd({"TermOpen"}, { pattern = {"*"}, command = "setlocal norelativenumber", })
vim.api.nvim_create_autocmd({"TermOpen"}, { pattern = {"*"}, command = "setlocal nonumber", })

--vim.cmd('GonvimResize "1000x1000"')

local zenhan_manager = require('zenhan')
--print(zenhan_manager.IM)  -- 現在のIMの状態を表示

--vim.notify('initialization complated')
