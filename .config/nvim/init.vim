
" """"""""""""
call plug#begin('~/.vim/plugged')
    " Util
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"    Plug 'Shougo/deoplete.nvim'
    Plug 'ctrlpvim/ctrlp.vim', {'on': ['CtrlP', 'CtrlPMixed', 'CtrlPMRU']}
    Plug 'mkitt/tabline.vim'
    Plug 'vim-syntastic/syntastic'
    Plug 'tpope/vim-surround'
    Plug 'neomake/neomake', { 'on': 'Neomake' }

    " Auto complete
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'
    Plug 'ncm2/ncm2-path'

    " theme
    Plug 'iCyMind/NeoSolarized'

    " Golang
    Plug 'fatih/vim-go', { 'tag': '*' }
    Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
    Plug 'ncm2/ncm2-go'

    " PHP
    Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
    Plug 'phpactor/ncm2-phpactor'
"    Plug 'kristijanhusak/deoplete-phpactor'
    Plug 'stephpy/vim-php-cs-fixer'
    Plug 'captbaritone/better-indent-support-for-php-with-html'

    " JavaScript
    Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
    Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
"    Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
    Plug 'mxw/vim-jsx'
    Plug 'pangloss/vim-javascript'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'ruanyl/vim-fixmyjs'

    " HTML
    Plug 'mattn/emmet-vim'

    " CSS
    Plug 'KohPoll/vim-less'
    Plug 'ncm2/ncm2-cssomni'
call plug#end()

" Hooks
" """""
" save on leaving insert mode
autocmd InsertLeave * write
autocmd InsertLeave,BufWritePost *.php SyntasticCheck php
autocmd InsertLeave,BufWritePost *.js SyntasticCheck javascript
autocmd InsertLeave,BufWritePost *.jsx SyntasticCheck javascript


" Misc vim settings
" """""""""""""""""
"  theme
colorscheme NeoSolarized
set background=dark

set cursorline
set colorcolumn=120,100
highlight ColorColumn ctermbg=0 guibg=lightgrey

" numbers
set number
set rnu
set scrolloff=999

" share the system clipboard
set clipboard=unnamedplus

" spaces > tabs
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" the long leader key
let mapleader = "\<Space>"

" Syntax Linting
" """"""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_checkers = ['php']

let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" CtrlP Settings
" """"""""""""""
" ignore some dirs
let g:ctrlp_show_hidden = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.git/*,*/vendor/*,*/node_modules/*

map <C-p> :CtrlP<CR>
let g:ctrlp_prompt_mappings={
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }


" Javascript Settings
" """""""""""""""""""
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:neomake_javascript_enabled_makers = ['eslint']

"Add extra filetypes
" let g:deoplete#sources#ternjs#filetypes = [
"                \ 'jsx',
"                \ 'javascript.jsx',
"                \ ]

autocmd! BufWritePost * Neomake
let g:neomake_warning_sign = {
  \ 'text': '?',
  \ 'texthl': 'WarningMsg',
  \ }

let g:neomake_error_sign = {
  \ 'text': 'X',
  \ 'texthl': 'ErrorMsg',
  \ }


" HTML Settings
" """""""""""""
" emmet
let g:user_emmet_leader_key=','


" PHP Settings
" """"""""""""
" indent
let g:PHP_vintage_case_default_indent = 1
let g:PHP_noArrowMatching = 1

" phpactor
let g:phpactorOmniError = v:true
let g:phpactorOmniAutoClassImport = v:true

" auto format php files on save
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
nmap <Leader>nn :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
nmap <Leader>o :call phpactor#GotoDefinition()<CR>

" Show brief information about the symbol under the cursor
nmap <Leader>K :call phpactor#Hover()<CR>

" Transform the classes in the current file
nmap <Leader>tt :call phpactor#Transform()<CR>

" Generate a new class (replacing the current file)
nmap <Leader>cc :call phpactor#ClassNew()<CR>

" Extract expression (normal mode)
nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>

" Extract expression from selection
vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>


" Ctags
" """""
"let g:auto_ctags = 1
"let g:auto_ctags_directory_list = ['.git', '.idea', ".tags"]
"let g:auto_ctags_filetype_mode = 1

" Auto complete
"" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

set completeopt=noinsert,menuone,noselect
set shortmess+=c
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" deoplete
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#on_insert_enter = 1


" NERDTree Settings
" """""""""""""""""
nmap <Leader>nt :NERDTreeMirror<CR>
autocmd VimEnter * NERDTree
