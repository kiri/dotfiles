return {
    'shaunsingh/nord.nvim',
    lazy = false,
    -- event = "VimEnter",
    -- priority = 1000,
    config = function()
        vim.cmd[[colorscheme nord]]
    end,
}
