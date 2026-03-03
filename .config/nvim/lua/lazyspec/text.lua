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
--    {
--        'inkarkat/vim-ReplaceWithRegister'
--    },
    {
        'echasnovski/mini.operators',
        version = '*',
        config = function()
            require('mini.operators').setup()
        end
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
