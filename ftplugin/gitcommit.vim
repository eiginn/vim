"setlocal spell
"au BufWinEnter COMMIT_EDITMSG call g:InsertModeEOL()
""au BufReadPost COMMIT_EDITMSG call feedkeys('ggA', 't')
"
function! g:InsertModeEOL()
  if !exists('b:imeDoOnce')
    "call feedkeys('ggA', 't')
    silent normal! ggA
    let b:imeDoOnce = 1
  endif
endfunction
