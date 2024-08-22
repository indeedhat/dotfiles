return {
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = {
            {
                "echasnovski/mini.icons",
                config = function()
                    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
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
