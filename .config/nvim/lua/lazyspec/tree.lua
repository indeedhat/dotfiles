return {
    {
        'stevearc/oil.nvim',
        opts = {},
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
