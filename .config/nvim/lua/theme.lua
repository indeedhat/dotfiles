--
-- Theme settings
--

vim.o.termguicolors = true
vim.cmd [[
    colorscheme dracula
]]
vim.o.conceallevel = 0

-- Set statusbar
vim.g.lightline = {
    colorscheme = 'dracula',
    active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
    component_function = { gitbranch = 'fugitive#head' },
}

-- smart search
vim.o.ignorecase = true
vim.o.smartcase = true

-- 
vim.cmd [[
    hi! Normal ctermbg=NONE guibg=NONE
    set guifont=Fira\ Code\ Regular\ 12

    set list
    set listchars=trail:~,tab:┊>,extends:-

    set cursorline
    set colorcolumn=120,100

    filetype plugin indent on
    set tabstop=4 
    set shiftwidth=4
    set expandtab

    set clipboard+=unnamedplus
]]

vim.opt.listchars = { space = ".", tab = "┊>", trail = "~" }
vim.o.inccommand = 'nosplit'

--Set highlight on search
vim.o.hlsearch = true

--Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

--Enable break indent
vim.o.breakindent = true
