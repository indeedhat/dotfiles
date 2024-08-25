--
-- Vim script that still needs to be converted to lua
--

vim.cmd [[
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
" Abbreviations                                                                  sec-abbreviation "
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" "
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> Qa ((getcmdtype() is# ':' && getcmdline() is# 'Qa')?('qa'):('Qa'))


" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" "
" Auto Command                                                                    sec-autocommand "
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" "
" Php cs fixer
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

" Emmet
autocmd FileType html,css,php,js EmmetInstall

autocmd FileType make setlocal noexpandtab
autocmd FileType php set iskeyword+=$
]]
