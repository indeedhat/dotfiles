return {
    {
        'mattn/emmet-vim',
        config = function()
            vim.g.user_emmet_leader_key=','
            vim.g.user_emmet_mode='n'
        end
    },
    {
        'aeke/vim-php-cs-fixer'
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    {
        'vrischmann/tree-sitter-templ'
    },
}
