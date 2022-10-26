vim.cmd [[
    let g:kragle_use_tabs = v:false
]]


--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("packerconf")
require("theme")
require("vimscript")
require("treesitter")
require("lsp")
require("vimspector")
-- require("symbols-outline")

require('neoterm').setup({
	mode = 'horizontal', -- vertical/horizontal/fullscreen
	noinsert = false   -- disable entering insert mode when opening the neoterm window
})


--Do not save when switching buffers (note: this is now a default on master)
vim.o.hidden = true


--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

--Set colorscheme (order is important here)

-- qol normal mode
vim.api.nvim_set_keymap('i', ';;', '<esc>$i;<esc>', { noremap = true })

-- when making jumps move the active line to the middle
vim.api.nvim_set_keymap('n', 'n', 'nzz', { noremap = true })
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', { noremap = true })

-- set more undo points as you type special characters
vim.api.nvim_set_keymap('i', ',', ',<c-g>u', { noremap = true })
vim.api.nvim_set_keymap('i', '.', '.<c-g>u', { noremap = true })
vim.api.nvim_set_keymap('i', '[', '[<c-g>u', { noremap = true })
vim.api.nvim_set_keymap('i', '(', '(<c-g>u', { noremap = true })
vim.api.nvim_set_keymap('i', '{', '{<c-g>u', { noremap = true })

-- move lines about without adding them to a register
vim.api.nvim_set_keymap('n', '<c-J>', ':m .+1<CR>==', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-K>', ':m .-2<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<c-J>', ':m \'>+1<CR>gv=gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<c-J>', ':m \'<-2<CR>gv=gv', { noremap = true })

-- split navigation
vim.api.nvim_set_keymap('n', '<c-j>', '<c-w><c-j>', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-k>', '<c-w><c-k>', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-h>', '<c-w><c-h>', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-l>', '<c-w><c-l>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader>cn', ':cn<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>cp', ':cp<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>cop', ':copen<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>cN', ':cnf<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>cP', ':cpf<cr>', { noremap = true })


-- create a jump list entry when moving multiple lines 
vim.cmd [[
    nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
    nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
]]

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Y yank until the end of line  (note: this is now a default on master)
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

-- Restart the language server
vim.api.nvim_set_keymap('n', '<Leader>lR', ':LspRestart<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>li', ':LspInfo<CR>', { noremap = true })

-- toggle teh symbols display
vim.api.nvim_set_keymap('n', '<Leader>so', ':SymbolsOutline<CR>', { noremap = true })

-- Highlight on yank
vim.api.nvim_exec(
    [[
        augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank()
        augroup end
    ]],
    false
)

-- align things
vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', { noremap = false })

--Map blankline
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = false

