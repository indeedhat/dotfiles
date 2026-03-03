return {
    {
        'stevearc/oil.nvim',
        opts = {},
        config = function()
            local detail = false
            require('oil').setup({
                view_options = {
                    -- Show files and directories that start with "."
                    show_hidden = true,
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
            {
                "echasnovski/mini.icons",
                config = function()
                    require('oil').setup({
                        view_options = {
                            -- Show files and directories that start with "."
                            show_hidden = false,
                            -- This function defines what is considered a "hidden" file
                            is_hidden_file = function(name, bufnr)
                                return vim.startswith(name, ".")
                            end,
                            -- This function defines what will never be shown, even when `show_hidden` is set
                            is_always_hidden = function(name, bufnr)
                                return false
                            end,
                        },
                    })

                    vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
                end
            }
        },
    },
    {
        "benomahony/oil-git.nvim",
        dependencies = { "stevearc/oil.nvim" },
        -- No opts or config needed! Works automatically
    },
    {
        'kyazdani42/nvim-tree.lua',
        dependencies = {
            'kyazdani42/nvim-web-devicons'
        },
        opts = {
            git = {
                enable = true,
                ignore = false,
            }
        }
    }
}
