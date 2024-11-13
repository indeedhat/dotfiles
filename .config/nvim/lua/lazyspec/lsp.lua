local on_attach = function(_, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true }
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', '<leader>o', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<Leader>K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<Leader>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<Leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<Leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<Leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<Leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- buf_set_keymap('n', '<Leader>ca', require("actions-preview").code_actions, opts)
    -- buf_set_keymap('v', '<Leader>ca', require("actions-preview").code_actions, opts)
    buf_set_keymap('n', 'gR', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<Leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<Leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<Leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

vim.api.nvim_command[[autocmd BufWritePre *.go lua vim.lsp.buf.format()]]
vim.api.nvim_command[[autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll]]

return {
    {
        "aznhe21/actions-preview.nvim",
        config = function()
            vim.keymap.set({ "v", "n" }, "<Leader>ca", require("actions-preview").code_actions)
        end,
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
            'sago35/tinygo.vim',
        },
        config = function()
            vim.o.completeopt = 'menu,menuone,noselect'

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

            local nvim_lsp = require 'lspconfig'
            local servers = {
                'clangd',
                --'eslint',
                'gopls',
                'html',
                -- 'julials',
                -- 'lua_ls',
                -- 'ocamllsp',
                -- 'intelephense',
                'phpactor',
                -- 'pyright',
                -- 'rust_analyzer',
                -- 'solargraph',
                'svelte',
                -- 'templ',
                -- 'terraform_lsp',
                -- 'terraformls',
                'ts_ls',
                'volar',
            }
            for _, lsp in ipairs(servers) do
                nvim_lsp[lsp].setup {
                    on_attach = on_attach,
                    capabilities = capabilities,
                }
            end

            local cmp = require('cmp')
            cmp.setup {
                snippet = {
                    expand = function(args)
                        vim.fn['vsnip#anonymous'](args.body)
                    end,
                },
                mapping = {
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.close(),
                    ['<CR>'] = cmp.mapping.confirm {
                        select = true,
                    },
                },
                sources = cmp.config.sources {
                    { name = 'nvim_lsp' },
                    { name = "vsnip" },
                    { name = "buffer" },
                    { name = "path" },
                },
                experimental = {
                    ghost_text = true,
                },

                preselect = cmp.PreselectMode.None,
            }
        end
    }
}
