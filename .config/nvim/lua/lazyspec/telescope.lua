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

        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<C-t>', function() builtin.find_files({ hidden = true }) end, { noremap = true })
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
    end
}
