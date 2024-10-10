-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "C:\\Users\\tohru\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1713484068\\share\\lua\\5.1\\?.lua;C:\\Users\\tohru\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1713484068\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\tohru\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1713484068\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\tohru\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1713484068\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\tohru\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1713484068\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["auto-save.nvim"] = {
    config = { "\27LJ\2\n]\0\0\6\0\6\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0004\5\0\0B\0\5\1K\0\1\0\18:ASToggle<CR>\14<leader>n\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "C:\\Users\\tohru\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\auto-save.nvim",
    url = "https://github.com/Pocco81/auto-save.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "C:\\Users\\tohru\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["memolist.vim"] = {
    config = { "\27LJ\2\nä\3\0\0\6\0\18\0)6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0)\1\0\0=\1\6\0006\0\0\0009\0\1\0'\1\b\0=\1\a\0006\0\0\0009\0\t\0009\0\n\0'\2\v\0'\3\f\0'\4\r\0004\5\0\0B\0\5\0016\0\0\0009\0\t\0009\0\n\0'\2\v\0'\3\14\0'\4\15\0004\5\0\0B\0\5\0016\0\0\0009\0\t\0009\0\n\0'\2\v\0'\3\16\0'\4\17\0004\5\0\0B\0\5\1K\0\1\0\18:MemoGrep<CR>\15<leader>mg\18:MemoList<CR>\15<leader>ml\17:MemoNew<CR>\15<leader>mn\6n\20nvim_set_keymap\bapi\30~/.memolist/memotemplates\31memolist_template_dir_path\17memolist_fzf\amd\25memolist_memo_suffix\21~/.memolist/memo\18memolist_path\6g\bvim\0" },
    loaded = true,
    path = "C:\\Users\\tohru\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\memolist.vim",
    url = "https://github.com/glidenote/memolist.vim"
  },
  ["nord.nvim"] = {
    loaded = true,
    path = "C:\\Users\\tohru\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nord.nvim",
    url = "https://github.com/shaunsingh/nord.nvim"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\tohru\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\tohru\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "C:\\Users\\tohru\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: auto-save.nvim
time([[Config for auto-save.nvim]], true)
try_loadstring("\27LJ\2\n]\0\0\6\0\6\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0004\5\0\0B\0\5\1K\0\1\0\18:ASToggle<CR>\14<leader>n\6n\20nvim_set_keymap\bapi\bvim\0", "config", "auto-save.nvim")
time([[Config for auto-save.nvim]], false)
-- Config for: memolist.vim
time([[Config for memolist.vim]], true)
try_loadstring("\27LJ\2\nä\3\0\0\6\0\18\0)6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0)\1\0\0=\1\6\0006\0\0\0009\0\1\0'\1\b\0=\1\a\0006\0\0\0009\0\t\0009\0\n\0'\2\v\0'\3\f\0'\4\r\0004\5\0\0B\0\5\0016\0\0\0009\0\t\0009\0\n\0'\2\v\0'\3\14\0'\4\15\0004\5\0\0B\0\5\0016\0\0\0009\0\t\0009\0\n\0'\2\v\0'\3\16\0'\4\17\0004\5\0\0B\0\5\1K\0\1\0\18:MemoGrep<CR>\15<leader>mg\18:MemoList<CR>\15<leader>ml\17:MemoNew<CR>\15<leader>mn\6n\20nvim_set_keymap\bapi\30~/.memolist/memotemplates\31memolist_template_dir_path\17memolist_fzf\amd\25memolist_memo_suffix\21~/.memolist/memo\18memolist_path\6g\bvim\0", "config", "memolist.vim")
time([[Config for memolist.vim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
