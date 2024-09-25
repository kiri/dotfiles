local zenhan = os.getenv("LOCALAPPDATA") .. '/zenhan/bin64/zenhan.exe'
if not zenhan then
    error("LOCALAPPDATA environment variable not set")
end

local function file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then io.close(f) return true else return false end
end

if not file_exists(zenhan) then
    error("Zenhan executable not found at " .. zenhan)
end

local M = {}
M.IM = 0

vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
    pattern = { "*" },
    callback = function() vim.fn.system(zenhan .. ' ' .. M.IM) end
})

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

return M

