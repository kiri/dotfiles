-- 改善点と推奨される修正

-- 1. エラーハンドリングの追加
local zenhan = os.getenv("LOCALAPPDATA") .. '/zenhan/bin64/zenhan.exe'
if not zenhan then
    error("LOCALAPPDATA environment variable not set")
end

-- 2. ファイル存在チェックの追加
local function file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then io.close(f) return true else return false end
end

if not file_exists(zenhan) then
    error("Zenhan executable not found at " .. zenhan)
end

-- 3. グローバル変数の使用を避ける
local M = {}
M.IM = 0

-- 4. os.execute の代わりに vim.fn.system を使用
vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
    pattern = { "*" },
    callback = function() vim.fn.system(zenhan .. ' ' .. M.IM) end
})

-- 5. io.popen の代わりに vim.fn.system を使用
vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
    pattern = { "*" },
    callback = function()
        M.IM = vim.fn.system(zenhan .. ' 0')
    end
})

vim.api.nvim_create_autocmd({ 'CmdlineLeave' }, {
    pattern = { "*" },
    callback = function() vim.fn.system(zenhan .. ' 0') end
})

-- 6. モジュールとして使用できるように返り値を設定
return M
