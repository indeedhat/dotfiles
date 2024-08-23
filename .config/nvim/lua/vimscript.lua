--
-- Vim script that still needs to be converted to lua
--

vim.cmd [[
set mouse=

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" "
" Pligin Configuration                                                            sec-plugin-conf "
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" "

" Traces
let g:traces_num_range_preview = 1

" Json
let g:vim_json_syntax_conceal = 0

" Emmet
let g:user_emmet_leader_key=','
let g:user_emmet_mode='n'

" CtrlP
let g:ctrlp_show_hidden = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.git/*,*/vendor/*,*/node_modules/*

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" "
" Functions                                                                          sec-function "
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" "
function! ArrangeArgs(start, end)
    let l:escaped = a:start
    if "[" == a:start
        let l:escaped = "\\["
    endif

    execute "normal f" . a:start 
    execute "normal F" . a:start
    normal mu
    execute "normal a\<cr>"
    execute "silent s/\\(,\\|" . l:escaped . "\\)/\\1\<cr>/g"
    execute "normal! `uvi" . a:start 
    if "]" == a:end
        :s/\(]\)/\r\1/g
    elseif "}" == a:end
        :s/\(}\)/\r\1/g
    elseif ")" == a:end
        :s/\()\)/\r\1/g
    endif
    execute "normal `u%="
endfunction


" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" "
" Macros/Shortcuts                                                                      sec-macro "
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" "
" CtrlP
map <C-p> :CtrlP<CR>
map <C-Space> :CtrlPBuffer<CR>

" Php cs fixer
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

" NvimTree
nmap <Leader>nt :NvimTreeToggle<CR>

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

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" "
" Abbreviations                                                                  sec-abbreviation "
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" "
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> Qa ((getcmdtype() is# ':' && getcmdline() is# 'Qa')?('qa'):('Qa'))


" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" "
" Auto Command                                                                    sec-autocommand "
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" "
" save on write
" autocmd InsertLeave * write

" Emmet
autocmd FileType html,css,php,js EmmetInstall

autocmd FileType make setlocal noexpandtab
autocmd FileType php set iskeyword+=$
]]
