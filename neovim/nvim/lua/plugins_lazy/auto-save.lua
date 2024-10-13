return {
    'Pocco81/auto-save.nvim', 
    event = "VeryLazy",
    config =function() 
        vim.api.nvim_set_keymap("n", "<leader>n", ":ASToggle<CR>", {})
    end,
}
