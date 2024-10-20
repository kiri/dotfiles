-- plugins/telescope.lua:
return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                              , branch = '0.1.x',
    dependencies = { 
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
        'delphinus/telescope-memo.nvim', 
    },
    opts = {},
    config = function(_, opts)
        require('telescope').setup(opts)
        require('telescope').load_extension('memo')
    end,
}
