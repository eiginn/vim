" git commit options
setlocal spell
"au BufNewFile,BufRead,BufReadPost COMMIT_EDITMSG setlocal spell
"au BufNewFile,BufRead,BufReadPost COMMIT_EDITMSG call feedkeys('ggA', 't')
" the above does not run from an ftplugin file since 'BufRead' has already
" been triggered, instead 'BufWinEnter' gets us what we want from here
au BufWinEnter COMMIT_EDITMSG call feedkeys('ggA', 't')
