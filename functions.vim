" Delete ALL trailing whitespace on every line
command! ClearWhiteSpace :let _s=@/|:%s/\s\+$//e|:let @/=_s|:nohl

" Show syntax highlighting groups for word under cursor
nmap <F4> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Generate html without body tags
function! MyToHtml(line1, line2)
  " make sure to generate in the correct format
  let l:old_css = 1
  if exists('g:html_use_css')
    let l:old_css = g:html_use_css
  endif
  let g:html_use_css = 0

  " generate and delete unneeded lines
  exec a:line1.','.a:line2.'TOhtml'
  %g/<body/normal k$dgg

  " convert body to a table
  %s/<body\s*\(bgcolor="[^"]*"\)\s*text=\("[^"]*"\)\s*>/<table \1 cellPadding=0><tr><td><font color=\2>/
  %s#</body>\(.\|\n\)*</html>#\='</font></td></tr></table>'#i

  " restore old setting
  let g:html_use_css = l:old_css
endfunction
command! -range=% MyToHtml :call MyToHtml(<line1>,<line2>)

" mkdir on save if path does not exist
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let l:dir=fnamemodify(a:file, ':h')
        if !isdirectory(l:dir)
            call mkdir(l:dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" ranger as file explorer
function RangerExplorer()
    exec "silent !ranger --choosefile=/tmp/vim_ranger_current_file " . expand("%:p:h")
    if filereadable('/tmp/vim_ranger_current_file')
        exec 'edit ' . system('cat /tmp/vim_ranger_current_file')
        call system('rm /tmp/vim_ranger_current_file')
    endif
    redraw!
endfun
map <Leader>x :call RangerExplorer()<CR>

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(' vim: set ts=%d sw=%d tw=%d %set :',
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, '%s', l:modeline, '')
  call append(line('$'), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

function! GPGinfo() range
  let bytecode = system('echo '.shellescape(join(getline(a:firstline, a:lastline), "\n")).'| sed -e "s/^[ \t]*//" -e "s/\\\//g" | gpg --list-packets')
  vsplit __GPG_INFO__
  normal! ggdG
  setlocal filetype=text
  setlocal buftype=nofile
  call append(0, split(bytecode, '\v\n'))
endfun
command! -range GPGinfo <line1>,<line2>call GPGinfo()

function! Certdump() range
  let bytecode = system('echo '.shellescape(join(getline(a:firstline, a:lastline), "\n")).'| sed -e "s/^[ \t]*//" -e "s/\\\//g" | certdump')
  vsplit __CERTDUMP__
  normal! ggdG
  setlocal filetype=text
  setlocal buftype=nofile
  call append(0, split(bytecode, '\v\n'))
endfun
command! -range Certdump <line1>,<line2>call Certdump()

function! CFPaste() range
  let url = system('echo -n '.shellescape(join(getline(a:firstline, a:lastline), "\r")).'| cf-paste')
  echon split(url, '\n')[0]
endfun
" range=% tells it to send whole buffer if no lines selected
command! -range=% CFPaste <line1>,<line2>call CFPaste()

au BufEnter * call MyLastWindow()
function! MyLastWindow()
  " if the window is quickfix go on
  if &buftype=="quickfix"
    " if this window is last on screen quit without warning
    if winnr('$') < 2
      quit!
    endif
  endif
endfunction

function! CompareLines(...)

    " Check the number of arguments
    " And get lines numbers
    if len(a:000) == 0
        let l1=line(".")
        let l2=line(".")+1
    elseif len(a:000) == 1
        let l1 =line(".")
        let l2 =a:1
    elseif len(a:000) == 2
        let l1 = a:1
        let l2 = a:2
    else
        echom "bad number of arguments"
        return;
    endif

    " Get the content of the lines
    let line1 = getline(l1)
    let line2 = getline(l2)

    let pattern = ""

    " Compare lines and create pattern of diff
    for i in range(strlen(line1))
        if strpart(line1, i, 1) != strpart(line2, i, 1)
            if pattern != ""
                let pattern = pattern . "\\|"
            endif
            let pattern = pattern . "\\%" . l1 . "l" . "\\%" . ( i+1 ) . "c"
            let pattern = pattern . "\\|" . "\\%" . l2 . "l" . "\\%" . ( i+1 ) . "c"
        endif
    endfor

    " Search and highlight the diff
    execute "let @/='" . pattern . "'"
    set hlsearch
    normal n
endfunction
command! -nargs=* CL call CompareLines(<f-args>)
