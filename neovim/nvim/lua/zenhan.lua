local function file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then io.close(f) return true else return false end
end

local zenhan = os.getenv("LOCALAPPDATA") .. '\\zenhan\\bin64\\zenhan.exe'
if not file_exists(zenhan) then
    error("Zenhan executable not found at " .. zenhan)
end

local M = {}
M.IM = 0

vim.api.nvim_create_augroup('zenhan',{})
vim.api.nvim_create_autocmd({ 'InsertEnter' }, 
{
    group = 'zenhan',
    pattern = { "*" },
    callback = function()
        --vim.fn.system(zenhan .. ' ' .. M.IM)
        vim.system({zenhan, M.IM},{text=true},function(job)
        end)
    end
})

vim.api.nvim_create_autocmd({ 'InsertLeave' }, 
{
    group = 'zenhan',
    pattern = { "*" },
    callback = function()
        --M.IM = vim.fn.system(zenhan .. ' 0')
        vim.system({zenhan, 0},{text=true},function(job)
            M.IM=job.stdout
        end)
    end
})

vim.api.nvim_create_autocmd({ 'CmdlineEnter' }, 
{
    group = 'zenhan',
    pattern = { "*" },
    callback = function()
        --vim.fn.system(zenhan .. ' 0')
        vim.system({zenhan, 0},{text=true},function(job)
        end)
    end
})
vim.api.nvim_create_autocmd({ 'CmdlineLeave' }, 
{
    group = 'zenhan',
    pattern = { "*" },
    callback = function()
        --vim.fn.system(zenhan .. ' 0')
        vim.system({zenhan, 0},{text=true},function(job)
        end)
    end
})

return M
