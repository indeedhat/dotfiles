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

        vim.keymap.set('n', '<C-t>', builtin.find_files, { noremap = true })
        vim.keymap.set('n', '<C-Space>', builtin.buffers, { noremap = true })
        vim.keymap.set('n', '<Leader><C-Space>', builtin.lsp_workspace_symbols, { noremap = true })
        vim.keymap.set('n', '<Leader>qq', builtin.quickfix, { noremap = true })
        vim.keymap.set('n', '<Leader>qh', builtin.quickfixhistory, { noremap = true })
    end
}
