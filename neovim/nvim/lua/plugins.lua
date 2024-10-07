-- This file can be loaded by calling `lua require('plugins')` from your init.vim
--
-- Automatically install packer
local install_path = vim.fn.stdpath ("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system ({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd( [[packadd packer.nvim]])
end


-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install your plugins here
return packer.startup(function(use)
    -- Packer can manage itself
    use({'wbthomason/packer.nvim'})
    use({
        'Pocco81/auto-save.nvim', 
        config=function() 
            vim.api.nvim_set_keymap("n", "<leader>n", ":ASToggle<CR>", {})
        end, })
    use({'mhinz/vim-startify'})
    use({
        'glidenote/memolist.vim', 
        config = function() 
            vim.g.memolist_path = "~/.memolist/memo"
            vim.g.memolist_memo_suffix = "md"
            vim.g.memolist_fzf = 0
            vim.g.memolist_template_dir_path = "~/.memolist/memotemplates"
        end, })

    use('shaunsingh/nord.nvim')
    use({
        'itchyny/lightline.vim',
        config = function()
            vim.g.lightline={colorscheme='nord'}
        end, })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
