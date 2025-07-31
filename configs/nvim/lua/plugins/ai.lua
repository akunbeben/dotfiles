return {
    {
        "supermaven-inc/supermaven-nvim",
        opts = {
            condition = function()
                return string.match(vim.fn.expand("%:t"), "todo.md")
            end,
        },
    },
}
