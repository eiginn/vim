" spellcheck md files
if has('autocmd')
    if has('spell')
        autocmd BufRead,BufNewFile *.rst setlocal spell
    endif
endif

