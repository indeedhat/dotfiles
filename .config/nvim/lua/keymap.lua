--Remap space as leader key
vim.keymap.set('', '<Space>', '<Nop>', { noremap = true, silent = true })

-- when making jumps move the active line to the middle
vim.keymap.set('n', 'n', 'nzz', { noremap = true })
vim.keymap.set('n', 'J', 'mzJ`z', { noremap = true })

-- set more undo points as you type special characters
vim.keymap.set('i', ',', ',<c-g>u', { noremap = true })
vim.keymap.set('i', '.', '.<c-g>u', { noremap = true })
vim.keymap.set('i', '[', '[<c-g>u', { noremap = true })
vim.keymap.set('i', '(', '(<c-g>u', { noremap = true })
vim.keymap.set('i', '{', '{<c-g>u', { noremap = true })

-- move lines about without adding them to a register
vim.keymap.set('n', '<c-J>', ':m .+1<CR>==', { noremap = true })
vim.keymap.set('n', '<c-K>', ':m .-2<CR>==', { noremap = true, silent = true })
vim.keymap.set('v', '<c-J>', ':m \'>+1<CR>gv=gv', { noremap = true })
vim.keymap.set('v', '<c-J>', ':m \'<-2<CR>gv=gv', { noremap = true })

-- split navigation
vim.keymap.set('n', '<c-j>', '<c-w><c-j>', { noremap = true })
vim.keymap.set('n', '<c-k>', '<c-w><c-k>', { noremap = true })
vim.keymap.set('n', '<c-h>', '<c-w><c-h>', { noremap = true })
vim.keymap.set('n', '<c-l>', '<c-w><c-l>', { noremap = true })

-- quick fix list
vim.keymap.set('n', '<Leader>cn', ':cn<cr>', { noremap = true })
vim.keymap.set('n', '<Leader>cp', ':cp<cr>', { noremap = true })
vim.keymap.set('n', '<Leader>cop', ':copen<cr>', { noremap = true })
vim.keymap.set('n', '<Leader>cN', ':cnf<cr>', { noremap = true })
vim.keymap.set('n', '<Leader>cP', ':cpf<cr>', { noremap = true })

--Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Restart the language server
vim.keymap.set('n', '<Leader>lR', ':LspRestart<CR>', { noremap = true })
vim.keymap.set('n', '<Leader>li', ':LspInfo<CR>', { noremap = true })

-- create a jump list entry when moving multiple lines 
vim.cmd [[
    nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
    nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

    " Line limit
    nnoremap <Leader>ll 120\|

    " Arrange args
    nnoremap <silent><Leader>ab :call ArrangeArgs('(', ')')<cr>
    nnoremap <silent><Leader>a( :call ArrangeArgs('(', ')')<cr>
    nnoremap <silent><Leader>a[ :call ArrangeArgs('[', ']')<cr>
    nnoremap <silent><Leader>a{ :call ArrangeArgs('{', '}')<cr>

    " Quick list aliases
    nnoremap <Leader>td :Ggrep TODO -- ':(exclude)vendor/'<cr>:copen<cr>
    nnoremap <Leader>fm :Ggrep FIXME -- ':(exclude)vendor/'<cr>:copen<cr>

    " Whitespace
    nnoremap <Leader><CR> i<cr><esc>
    nnoremap <Leader><BS> ^d0i<bs><esc>

    " Search things
    nnoremap <Leader>gg :Ggrep ''<Left>
]]

