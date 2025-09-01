return {
    {
        "folke/noice.nvim",
        opts = function(_, opts)
            opts.presets = {
                command_palette = {
                    views = {
                        cmdline_popup = {
                            position = {
                                row = "50%",
                                col = "50%",
                            },
                            size = {
                                min_width = 60,
                                width = "auto",
                                height = "auto",
                            },
                        },
                        popupmenu = {
                            relative = "editor",
                            position = {
                                row = 23,
                                col = "50%",
                            },
                            size = {
                                width = 60,
                                height = "auto",
                                max_height = 60,
                            },
                            border = {
                                style = "rounded",
                                padding = { 0, 1 },
                            },
                            win_options = {
                                winhighlight = { Normal = "Normal", FloatBorder = "NoiceCmdlinePopupBorder" },
                            },
                        },
                    },
                },
            }
            opts.lsp.signature = {
                opts = { size = { max_height = 15 } },
            }
        end,
    },
    {
        "folke/flash.nvim",
        keys = {
            { "s", mode = { "n", "x", "o" }, false },
        },
    },
    {
        "akinsho/bufferline.nvim",
        init = function()
            local bufline = require("catppuccin.groups.integrations.bufferline")
            bufline.get = bufline.get_theme
        end,
        event = "VeryLazy",
        opts = {
            options = {
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "",
                        highlight = "Directory",
                        text_align = "left",
                    },
                    {
                        filetype = "snacks_layout_box",
                    },
                },
            },
        },
        config = function(_, opts)
            vim.cmd.colorscheme("catppuccin-mocha")

            require("bufferline").setup(opts)
            -- Fix bufferline when restoring a session
            vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
                callback = function()
                    vim.schedule(function()
                        pcall(nvim_bufferline)
                    end)
                end,
            })
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = false,
        config = function()
            local flavour = "auto" -- fallback default
            local path = vim.fn.stdpath("config") .. "/theme-flavour"

            -- Baca atau buat file flavour
            local file = io.open(path, "r")
            if file then
                flavour = file:read("*l") or flavour
                file:close()
            else
                -- File tidak ada, buat dengan default flavour
                local new_file = io.open(path, "w")
                if new_file then
                    new_file:write(flavour)
                    new_file:close()
                end
            end

            require("catppuccin").setup({
                float = {
                    transparent = true,
                    solid = false,
                },
                flavour = flavour,
                transparent_background = true,
                integrations = {
                    lualine = false,
                    cmp = true,
                    gitsigns = true,
                    mason = true,
                    noice = true,
                    notify = true,
                    nvimtree = true,
                    treesitter = true,
                    telescope = {
                        enabled = true,
                    },
                    which_key = true,
                },
            })
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        opts = function()
            -- PERF: we don't need this lualine require madness 🤷
            local lualine_require = require("lualine_require")
            lualine_require.require = require

            local icons = LazyVim.config.icons

            vim.o.laststatus = vim.g.lualine_laststatus

            local opts = {
                options = {
                    theme = "auto",
                    globalstatus = vim.o.laststatus == 3,
                    disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
                    component_separators = "",
                    section_separators = { left = "", right = "" },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch" },

                    lualine_c = {
                        Snacks.profiler.status(),
                        {
                            "diff",
                            symbols = {
                                added = icons.git.added,
                                modified = icons.git.modified,
                                removed = icons.git.removed,
                            },
                            source = function()
                                local gitsigns = vim.b.gitsigns_status_dict
                                if gitsigns then
                                    return {
                                        added = gitsigns.added,
                                        modified = gitsigns.changed,
                                        removed = gitsigns.removed,
                                    }
                                end
                            end,
                        },
                    },
                    lualine_x = {},
                    lualine_y = {
                        LazyVim.lualine.root_dir(),
                        {
                            "diagnostics",
                            symbols = {
                                error = icons.diagnostics.Error,
                                warn = icons.diagnostics.Warn,
                                info = icons.diagnostics.Info,
                                hint = icons.diagnostics.Hint,
                            },
                        },
                        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                        { LazyVim.lualine.pretty_path() },
                    },
                    lualine_z = {
                        function()
                            return "  " .. os.date("%R")
                        end,
                    },
                },
                extensions = { "neo-tree", "lazy", "fzf" },
            }

            return opts
        end,
    },
}
