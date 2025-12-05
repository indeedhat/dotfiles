-- vim.o.termguicolors = true
-- vim.cmd.colorscheme("default")

vim.o.conceallevel = 0

-- smart search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.winborder = 'rounded'

vim.gvim_json_syntax_conceal = 0

-- 
vim.cmd [[
    set termguicolors
    set mouse=

    set list

    highlight ColorLine ctermbg=16
    highlight ColorColumn ctermbg=16
    set cursorline
    set colorcolumn=100,80

    filetype plugin indent on
    set tabstop=4
    set shiftwidth=4
    set expandtab

    set clipboard+=unnamedplus

    set scrolloff=6
]]

vim.opt.listchars = { tab = "|  ", trail = "~" }
vim.o.inccommand = 'nosplit'

--Set highlight on search
vim.o.hlsearch = true

--Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

--Enable break indent
vim.o.breakindent = true

local highlight = {
    "CursorLine",
    -- "Whitespace",
}

return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = 'ibl',
        opts = {
            scope = { enabled = false },
        }
    },
    {
        "vague2k/vague.nvim",
        config = function()
            -- vim.cmd.colorscheme("vague")
            -- require("vague").setup({})
        end
    },
    {
        'itchyny/lightline.vim'
    },
    {
        'jeffkreeftmeijer/vim-dim',
        config = function()
            -- vim.cmd.colorscheme("dim")
        end
    },
    {
        'RRethy/base16-nvim',
        config = function()
            vim.cmd.colorscheme("base16-default-dark")
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            -- vim.cmd([[
            --     highlight PmenuSele guibg=NvimDarkGrey4
            -- ]])
        end
    },
    {
        'machakann/vim-highlightedyank',
        config = function()
            vim.api.nvim_exec(
                [[
                    augroup YankHighlight
                    autocmd!
                    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
                    augroup end
                ]],
                false
            )
        end
    },
    {
        'markonm/traces.vim',
        config = function()
            vim.g.traces_num_range_preview = 1
        end
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
            require'treesitter-context'.setup{
                enable = true,
                multiline_threshold = 3,
            }

            vim.keymap.set("n", "[c", function()
                require("treesitter-context").go_to_context(vim.v.count1)
            end, { silent = true })
        end
    }
}
