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
                            show_hidden = true
                        },
                        is_hidden_file = function()
                            return false
                        end
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
