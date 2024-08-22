return {

    {
        'airblade/vim-gitgutter'
    },
    {
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set('n', '<Leader>G', ':G ', { noremap = true })
        end
    },
    {
        'christoomey/vim-tmux-navigator',
    }
}
