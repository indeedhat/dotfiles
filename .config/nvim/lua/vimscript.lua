--
-- Vim script that still needs to be converted to lua
--

vim.cmd [[
nnoremap <leader>tx <cmd>NeotermToggle<CR>
tnoremap <leader>tx <cmd>NeotermToggle<CR>
tnoremap <leader>tX <cmd>NeotermExit<CR>

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" "
" Pligin Configuration                                                            sec-plugin-conf "
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" "

" Traces
let g:traces_num_range_preview = 1


" Json
let g:vim_json_syntax_conceal = 0

" Submode
let g:submode_always_show_submode = 1
call submode#enter_with('window', 'n', '', '<C-w>')
call submode#leave_with('window', 'n', '', '<ESC>')

for key in ['a','b','c','d','e','f','g','h','i','j','k','l','m', 'n','o','p','q','r','s','t','u','v','w','x','y','z']
  call submode#map('window', 'n', '', key, '<C-w>' . key)
  call submode#map('window', 'n', '', toupper(key), '<C-w>' . toupper(key))
  call submode#map('window', 'n', '', '<C-' . key . '>', '<C-w>' . '<C-'.key . '>')
endfor

for key in ['=','_','+','-','<','>']
  call submode#map('window', 'n', '', key, '<C-w>' . key)
endfor


" CtrlP
let g:ctrlp_show_hidden = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.git/*,*/vendor/*,*/node_modules/*

" Emmet
let g:user_emmet_leader_key=','
let g:user_emmet_mode='n'
let g:user_emmet_install_global = 0


" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" "
" Functions                                                                          sec-function "
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" "
function ShowSpace() 
    :IndentLinesEnable
    :LeadingSpaceEnable
endfunction

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

" Phpactor

" autocmd FileType php nmap <buffer> <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>
" autocmd FileType php vmap <buffer> <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>
" autocmd FileType php vmap <buffer> <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>
" autocmd FileType php nmap <buffer> <Leader>mm :call phpactor#ContextMenu()<CR>
" autocmd FileType php nmap <buffer> <Leader>tt :call phpactor#Transform()<CR>
" autocmd FileType php nmap <buffer> <Leader>cc :call phpactor#ClassNew()<CR>
" autocmd FileType php nmap <buffer> <Leader>nn :call phpactor#Navigate()<CR>
" autocmd FileType php nmap <buffer> <Leader>u :call phpactor#UseAdd()<CR>
" autocmd FileType php nmap <buffer> <Leader>U :call phpactor#ImportMissingClasses()<CR>

" NvimTree
nmap <Leader>nt :NvimTreeToggle<CR>

" Quick Fix
noremap <Leader>cn :cn<CR>
noremap <Leader>cp :cp<CR>
noremap <Leader>cop :copen<CR>

" Kraggle
noremap <Leader>ka :call kragle#AdoptBuffer()<CR>
noremap <Leader>ko :call kragle#OrphanBuffer()<CR>
noremap <Leader>kq :call kragle#Quit(v:false, v:false)<CR>
noremap <Leader>kQ :call kragle#Quit(v:true, v:true)<CR>
noremap <Leader>kf :call kragle#FocusRemote()<CR>
noremap <Leader>kl :call kragle#SwitchToBuffer()<CR>


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

" PHP things
nnoremap <Leader>cu :!composer update<cr>

" Search things
nnoremap <Leader>gg :Ggrep ''<Left>

" remove whitespace lines
nnoremap <Leader>flw :%s/^\s\+$//<cr>:w<cr>

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
autocmd InsertLeave * write

" Emmet
autocmd FileType html,css,php EmmetInstall

" Fix for nerdtree indent when using indentLine leading space
autocmd BufEnter NERD_tree* :LeadingSpaceDisable

autocmd FileType make setlocal noexpandtab
autocmd FileType php set iskeyword+=$
]]
