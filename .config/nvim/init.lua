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
vim.api.nvim_set_keymap('n', '<c-j>', ':m .+1<CR>==', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-k>', ':m .-2<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'J', ':m \'>+1<CR>gv=gv', { noremap = true })
vim.api.nvim_set_keymap('v', 'J', ':m \'<-2<CR>gv=gv', { noremap = true })


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

--Map blankline
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = false

