" GistID: 866aa2ef90816b965f4e
" ================ General Config ===================

set number
set nocompatible
set fillchars+=stl:\ ,stlnc:\
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
filetype off     " required!
set noswapfile
set nobackup
set nowb
set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline\ 10

" =============== Mouse Support =====================

set mouse=nvr
"set mousem=popup

" ================ Indentation ======================

set autoindent
set smartindent
"set smarttab
set shiftwidth=4
set softtabstop=4
"set tabstop=2
set expandtab

" =================== Vundle ========================

set rtp+=~/.vim/vundle/
call vundle#rc()
let g:vundle_default_git_proto = 'git'

" let Vundle manage Vundle
" Required
"Bundle 'gmarik/vundle'

" Plugin bundles
Bundle 'mattn/gist-vim'
Bundle 'Lokaltog/powerline.git'
Bundle 'mattn/webapi-vim'
Bundle 'hallison/vim-markdown'
Bundle 'suan/vim-instant-markdown.git'
Bundle 'vim-ruby/vim-ruby.git'
Bundle 'iptables'
Bundle 'scrooloose/syntastic.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'benmills/vimux.git'
"Bundle 'jmcantrell/vim-virtualenv.git'
Bundle 'vim-scripts/YankRing.vim.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'davidhalter/jedi-vim.git'
Bundle 'airblade/vim-gitgutter'
Bundle 'saltstack/salt-vim.git'
Bundle 'tclem/vim-arduino.git'
"Bundle 'jamessan/vim-gnupg.git'
Bundle 'kien/ctrlp.vim.git'
"Bundle 'mattn/vdbi-vim'
Bundle 'honza/dockerfile.vim.git'
"Bundle 'leshill/vim-json.git'
"Bundle 'jamessan/vim-gnupg.git'
"Bundle 'terryma/vim-multiple-cursors.git'
"Bundle 'gregsexton/gitv.git'
"Bundle 'junegunn/vim-github-dashboard'
"Bundle 'wting/rust.vim'
"Bundle 'severin-lemaignan/vim-minimap'
Bundle 'rking/ag.vim'

" Colorscheme bundles
Bundle 'gregsexton/Muon.git'
Bundle 'nanotech/jellybeans.vim'
Bundle 'sickill/vim-monokai.git'
Bundle 'tomasr/molokai.git'
Bundle 'junegunn/seoul256.vim'
Bundle 'w0ng/vim-hybrid.git'
"Bundle 'chriskempson/base16-vim'

" ================ VIM Powerline ====================
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif
set noshowmode

" =============== Everything else ===================

syntax on
filetype plugin indent on

" look and feel
let base16colorspace=256  " Access colors present in 256 colorspace
let g:Powerline_symbols = 'fancy'
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * so $HOME/.vim/rmbackground.vim
color jellybeans

if v:version >= 703
  "undo settings
  set undodir=~/.vim/undofiles
  set undofile

"  set colorcolumn=+1 "mark the ideal max text width
endif

" manually set leader
let mapleader = '\'

" Enbale tab complete for commands
set wildmenu
set wildmode=list:longest,full

" Gist stuff
let g:gist_show_privates = 1
let g:gist_post_private = 1
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_get_multiplefile = 1
let g:gist_update_on_write = 2
let g:gist_list_vsplit = 1

" keep n lines visible above and below the cursor
set scrolloff=4

" allow writes with sudo
cmap w!! w !sudo tee % >/dev/null

" clipboard settings and remappings
"set clipboard+=unnamed
set clipboard=unnamedplus

" highlight cursor line
"set cursorline

" make wrapped lines easier to spot
let &showbreak=repeat('>', 3)

" let /-style searches case-sensitive only if there is a capital letter
set ignorecase
set smartcase

" set terminal title
set title

" show trailing whitespace with <leader>s
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>
set listchars=tab:»-,trail:•,eol:¶,nbsp:⎵,precedes:«,extends:» sbr=↪

" Highlight dynamically as pattern is typed
set incsearch

" toggle line numbering
nmap <C-N><C-N> :set invnumber<CR>

" git commit options
if has('autocmd')
  if has('spell')
    au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell
  endif
  au BufNewFile,BufRead COMMIT_EDITMSG call feedkeys('ggi', 't')
endif

" paste mode toggle
set pastetoggle=<F2>

" Delete ALL trailing whitespace on every line
command! ClearWhiteSpace :let _s=@/|:%s/\s\+$//e|:let @/=_s|:nohl

" insert mode in new line at end of file
" REMEBER if you are in (my) tmux the prefix is also <C-A> duh
nmap <C-A> Go

" for some reason home and end keys are not mapping properly.
" Home key
imap <esc>OH <esc>0i
cmap <esc>OH <home>
nmap <esc>OH 0
" End key
nmap <esc>OF $
imap <esc>OF <esc>$a
cmap <esc>OF <end>

" set openssl backup for openssl.vim
let g:openssl_backup = 1

" Disable EX mode key
map Q <Nop>

" =============== Python ===================
" Execute file being edited with <Shift> + e:
"map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>

"au FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = "context"

" Tab cycle through complete options
set completeopt=menuone,longest,preview

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Generate html without body tags
function! MyToHtml(line1, line2)
  " make sure to generate in the correct format
  let old_css = 1
  if exists('g:html_use_css')
    let old_css = g:html_use_css
  endif
  let g:html_use_css = 0

  " generate and delete unneeded lines
  exec a:line1.','.a:line2.'TOhtml'
  %g/<body/normal k$dgg

  " convert body to a table
  %s/<body\s*\(bgcolor="[^"]*"\)\s*text=\("[^"]*"\)\s*>/<table \1 cellPadding=0><tr><td><font color=\2>/
  %s#</body>\(.\|\n\)*</html>#\='</font></td></tr></table>'#i

  " restore old setting
  let g:html_use_css = old_css
endfunction
command! -range=% MyToHtml :call MyToHtml(<line1>,<line2>)

" show yankring in new buffer
nnoremap <silent> <F3> :YRShow<CR>

" unnest JSON with jq utility
nmap <leader>fj :%!jq '.'<CR>

" jellybean settings
"hi Normal          ctermfg=252 ctermbg=none
"hi NonText         ctermfg=250 ctermbg=none
" hi Normal cterm=NONE ctermbg=NONE

" NERDtree
let g:NERDTreeWinSize = 40
"autocmd vimenter * if !argc() | NERDTree | endif
let g:NERDTreeShowBookmarks = 1

" mkdir on save if path does not exist
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" Arduino Filetypes
au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

" Gitgutter
let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0

" color lines over 80 columns
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/
" set colorcolumn=80

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Turn off folding
set nofoldenable

" vim instant markdown
let g:instant_markdown_autostart = 0
