-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--

vim.api.nvim_create_autocmd("User", {
    pattern = "ThemeFlavourUpdated",
    callback = function()
        local flavour = "mocha"
        local path = vim.fn.stdpath("config") .. "/theme-flavour"
        local file = io.open(path, "r")
        if file then
            flavour = file:read("*l") or flavour
            file:close()
        end
        require("catppuccin").setup({ flavour = flavour })
        vim.cmd.colorscheme("catppuccin")
        vim.notify("Theme updated to: " .. flavour, vim.log.levels.INFO)
    end,
})
