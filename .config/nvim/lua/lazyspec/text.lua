return {
    {
        'tpope/vim-repeat'
    },
    {
        'tpope/vim-commentary'
    },
    {
        'tpope/vim-surround'
    },
    {
        'coderifous/textobj-word-column.vim'
    },
    {
        'wellle/targets.vim'
    },
    {
        'inkarkat/vim-ReplaceWithRegister'
    },
    {
        'windwp/nvim-autopairs',
        opts = {}
    },
    {
        'junegunn/vim-easy-align',
        config = function()
            vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', { noremap = false })
        end
    },
    {
        "johmsalas/text-case.nvim",
        opts = {}
    },
}
