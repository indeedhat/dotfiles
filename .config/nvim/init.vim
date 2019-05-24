
call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'fatih/vim-go', { 'tag': '*' }
    Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
    Plug 'Shougo/deoplete.nvim'
    Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
    " Plug 'ncm2/ncm2'
    " Plug 'roxma/nvim-yarp'
    " Plug 'phpactor/ncm2-phpactor'
    Plug 'Shougo/deoplete.nvim'
    Plug 'kristijanhusak/deoplete-phpactor'
    Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
    Plug 'carlitux/deoplete-ternjs'
    Plug 'mxw/vim-jsx'
    Plug 'pangloss/vim-javascript'
    Plug 'ctrlpvim/ctrlp.vim', {'on': ['CtrlP', 'CtrlPMixed', 'CtrlPMRU']}
    Plug 'mkitt/tabline.vim'
    Plug 'iCyMind/NeoSolarized'
    Plug 'mattn/emmet-vim'
    Plug 'KohPoll/vim-less'
call plug#end()

colorscheme NeoSolarized
set background=dark

set number
set rnu
set clipboard=unnamedplus

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.git/*,*/vendor/*,*/node_modules/*

" emmet
let g:user_emmet_leader_key=','

" ctrl p mapping
map <C-p> :CtrlP<CR>
let g:ctrlp_prompt_mappings={
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" the long leader key
let mapleader = "\<Space>"

" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
set shortmess+=c
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:deoplete#enable_at_startup = 1
let g:deoplete#on_insert_enter = 1

let g:phpactorOmniError = v:true
let g:phpactorOmniAutoClassImport = v:true

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
