" spellcheck md files
if has('autocmd')
    if has('spell')
        autocmd BufRead,BufNewFile *.md setlocal spell
    endif
endif

