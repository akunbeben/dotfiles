return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        config = function()
            require("neo-tree").setup({
                default_component_configs = {
                    modified = {
                        symbol = " ",
                        highlight = "NeoTreeModified",
                    },
                    icon = {
                        default = "",
                        folder_closed = "",
                        folder_open = "",
                        folder_empty = "",
                        folder_empty_open = "",
                    },
                    git_status = {
                        symbols = {
                            added = "",
                            deleted = "",
                            modified = "",
                            renamed = "",
                            untracked = "",
                            ignored = "",
                            unstaged = "",
                            staged = "",
                            conflict = "",
                        },
                    },
                },
                filesystem = {
                    follow_current_file = { enabled = true },
                    hijack_netrw = true,
                    use_libuv_file_watcher = true,
                },
                window = {
                    position = "float",
                    mappings = {
                        ["l"] = "open",
                        ["h"] = "close_node",
                        ["<space>"] = "none",
                        ["Y"] = {
                            function(state)
                                local node = state.tree:get_node()
                                local path = node:get_id()
                                vim.fn.setreg("+", path, "c")
                            end,
                            desc = "Copy Path to Clipboard",
                        },
                        ["O"] = {
                            function(state)
                                require("lazy.util").open(state.tree:get_node().path, { system = true })
                            end,
                            desc = "Open with System Application",
                        },
                        ["P"] = { "toggle_preview", config = { use_float = false } },
                        ["<BS>"] = function(state)
                            local cwd = vim.fn.getcwd()
                            if state.path == cwd then
                                print("Cannot go up, already at root directory.")
                            else
                                require("neo-tree.sources.filesystem").navigate_up(state)
                            end
                        end,
                    },
                },
            })
        end,
    },
}
