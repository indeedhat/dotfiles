return {
    {
        'stevearc/oil.nvim',
        cmd = "Oil",
        opts = {},
        config = function()
            local detail = false
            require('oil').setup({
                show_ignored_files = true,
                show_ignored_directories = true,
                view_options = {
                    -- Show files and directories that start with "."
                    show_hidden = true,
                    view_options = {
                        show_hidden = true
                    },
                    git = {
                        enable = false
                    },
                    -- This function defines what is considered a "hidden" file
                    is_hidden_file = function(name, bufnr)
                        local m = name:match("^%.")
                        return m ~= nil
                    end,
                    -- This function defines what will never be shown, even when `show_hidden` is set
                    is_always_hidden = function(name, bufnr)
                        return false
                    end
                },
                keymaps = {
                    ["gd"] = {
                        desc = "Toggle file detail view",
                        callback = function()
                            detail = not detail
                            if detail then
                                require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
                            else
                                require("oil").set_columns({ "icon" })
                            end
                        end,
                    },
                },
            })

            vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
        end,
        dependencies = {
            { "nvim-mini/mini.icons", opts = {} },
            {
                "malewicz1337/oil-git.nvim",
                dependencies = { "stevearc/oil.nvim" },
                opts = {
                    show_ignored_files = true,
                    show_ignored_directories = true,
                  symbol_position = "signcolumn",
                    symbols = {
                        file = { added = "+", modified = "~", renamed = "->", deleted = "-",
                            copied = "C", conflict = "#", untracked = "?", ignored = "!" },
                        directory = { added = "*", modified = "*", renamed = "*", deleted = "*",
                            copied = "*", conflict = "#", untracked = "*", ignored = "!" },
                    },
                },
            },
        },
        lazy = false
    },
}
