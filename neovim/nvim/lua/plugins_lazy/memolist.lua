return {
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
}
