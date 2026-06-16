return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    config = function()
        require('telescope').setup {
            defaults = {
                file_ignore_patterns = { 'node_modules', '.git/.*' }
            }
        }

        require("telescope.builtin").treesitter({
            ignore_symbols = {"var", "import"}
        })

        local builtin = require('telescope.builtin')
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")

        vim.keymap.set('n', '<C-t>', function()
            builtin.find_files({ hidden = true })
        end, { noremap = true })
        vim.keymap.set('n', '<C-Space>', function()
            builtin.buffers({
                ignure_current_buffer = true,
                sort_lastused = true,
                sort_mru = true
            })
        end, { noremap = true })
        vim.keymap.set('n', '<Leader><C-Space>', builtin.lsp_workspace_symbols, { noremap = true })
        vim.keymap.set('n', '<Leader>qq', builtin.quickfix, { noremap = true })
        vim.keymap.set('n', '<Leader>qh', builtin.quickfixhistory, { noremap = true })
        vim.keymap.set('n', '<Leader>gf', builtin.live_grep, { noremap = true })
        vim.keymap.set('n', '<Leader>gg', builtin.live_grep, { noremap = true })
        vim.keymap.set('n', '<Leader>ts', builtin.treesitter, { noremap = true })


        vim.keymap.set("n", "<leader>od", function()
            require("telescope.builtin").find_files({
                prompt_title = "Directories",
                find_command = { "sh", "-c", "rg --files | xargs dirname | sort | uniq" },
                previewer = false,
                attach_mappings = function(prompt_bufnr, map)
                    map("i", "<CR>", function()
                        local entry = action_state.get_selected_entry()
                        actions.close(prompt_bufnr)
                        vim.cmd("Oil --float " .. entry.path)
                    end)
                    map("n", "<CR>", function()
                        local entry = action_state.get_selected_entry()
                        actions.close(prompt_bufnr)
                        vim.cmd("Oil --float " .. entry.path)
                    end)
                    return true
                end,
            })
        end)
    end
}
