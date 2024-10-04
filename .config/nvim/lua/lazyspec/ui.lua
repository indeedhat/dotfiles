-- vim.o.termguicolors = true
-- vim.cmd.colorscheme("default")

vim.o.conceallevel = 0

-- smart search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.gvim_json_syntax_conceal = 0

-- 
vim.cmd [[
    set mouse=

    set list

    highlight ColorLine ctermbg=16
    highlight ColorColumn ctermbg=16
    "set cursorline
    set colorcolumn=120,100

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
            vim.cmd.colorscheme("dim")
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
    }
}
