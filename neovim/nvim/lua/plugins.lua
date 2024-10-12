local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "folke/noice.nvim",
        --event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },
    {
        'Pocco81/auto-save.nvim', 
        event = "InsertEnter",
        config =function() 
            vim.api.nvim_set_keymap("n", "<leader>n", ":ASToggle<CR>", {})
        end,
    },
    {'mhinz/vim-startify', lazy = false},
    {
        'glidenote/memolist.vim', 
        keys = {
            { "<leader>mn", ":MemoNew<CR>" },
            { "<leader>ml", ":MemoList<CR>" },
            { "<leader>mg", ":MemoGrep<CR>" },
        },
        config = function() 
            vim.g.memolist_path = "~/.memolist/memo"
            vim.g.memolist_memo_suffix = "md"
            vim.g.memolist_fzf = 0
            vim.g.memolist_template_dir_path = "~/.memolist/memotemplates"
            --vim.api.nvim_set_keymap("n", "<leader>mn", ":MemoNew<CR>", {})
            --vim.api.nvim_set_keymap("n", "<leader>ml", ":MemoList<CR>", {})
            --vim.api.nvim_set_keymap("n", "<leader>mg", ":MemoGrep<CR>", {})
        end, 
    },
    {
        'shaunsingh/nord.nvim',
        lazy = false,
        -- priority = 1000,
        config = function()
            vim.cmd[[colorscheme nord]]
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        config = true,
        dependencies = {
            'nvim-tree/nvim-web-devicons' 
        },
    }

})

