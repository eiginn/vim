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
set guifont=Hack\ 12

" =============== Mouse Support =====================

" set mouse=nvr
" set mousem=popup

" ================ Indentation ======================

set autoindent
set smartindent
"set smarttab
set shiftwidth=4
set softtabstop=4
"set tabstop=2
set expandtab

" =================== Vundle ========================

call plug#begin('~/.vim/plugged')

" Plugin bundles
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'Lokaltog/powerline'
Plug 'hallison/vim-markdown'
Plug 'eiginn/iptables-vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/YankRing.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'saltstack/salt-vim'
Plug 'Glench/Vim-Jinja2-Syntax'
"Plug 'kien/ctrlp.vim'
Plug 'honza/dockerfile.vim'
Plug 'sjl/gundo.vim'
Plug 'elzr/vim-json'
Plug 'jamessan/vim-gnupg'
Plug 'Yggdroot/indentLine'
"Plug 'nicwest/QQ.vim'
Plug 'idanarye/vim-merginal'
Plug 'majutsushi/tagbar'
Plug 'fatih/vim-go'
Plug 'fmoralesc/vim-pad'
Plug 'tmux-plugins/vim-tmux'
"Plug 'junegunn/vim-peekaboo'
"Plug 'junegunn/vim-github-dashboard'
Plug 'cespare/vim-toml'
"Plug 'maralla/completor.vim'
Plug 'mileszs/ack.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'klen/python-mode'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'aklt/plantuml-syntax'
Plug 'scrooloose/vim-slumlord'

" Colorscheme bundles
Plug 'gregsexton/Muon'
Plug 'nanotech/jellybeans.vim'
Plug 'scwood/vim-hybrid'
Plug 'marcopaganini/termschool-vim-theme'

call plug#end()

" ================ VIM Powerline ====================
set rtp+=~/.vim/plugged/powerline/powerline/bindings/vim

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
let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}

"if has('termguicolors')
"    set termguicolors
"endif

let g:Powerline_symbols = 'fancy'
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
set background=dark
if has('gui_running')
    color hybrid
else
    "autocmd ColorScheme * so $HOME/.vim/rmbackground.vim
    colorscheme jellybeans
endif

" indentlines
let g:indentLine_setColors = 0
let g:indentLine_char = '┆'
let g:indentLine_fileTypeExclude = ['text', 'help', 'nerdtree', 'note', 'json', 'notes']

if v:version >= 703
    "undo settings
    set undodir=~/.vim/undofiles
    set undofile
"    set colorcolumn=+1 "mark the ideal max text width
endif

" manually set leader
let mapleader = '\'

" Enbale tab complete for commands
set wildmenu
set wildmode=list:longest,full

" Gist stuff
let g:gist_show_privates = 1
let g:gist_post_private = 1
let g:gist_clip_command = 'xsel -ib'
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
nmap <leader>s :set nolist!<CR>
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

" spellchack md files
if has('autocmd')
    if has('spell')
        autocmd BufRead,BufNewFile *.md setlocal spell
        autocmd BufRead,BufNewFile *.rst setlocal spell
    endif
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

" Disable EX mode key
map Q <Nop>

" =============== Python ===================
" Execute file being edited with <Shift> + e:
"map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>

let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0
"let g:pymode_python = 'python'
let g:pymode_indent = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'pylint', 'mccabe']
let g:pymode_syntax = 1
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_unmodified = 0

" ALE
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
"let g:ale_open_list = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

"au FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = "context"

" Tab cycle through complete options
set completeopt=menuone,longest,preview

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

" Yankring
" show yankring in new buffer
nnoremap <silent> <F3> :YRShow<CR>
" yankring hist file
let g:yankring_history_file = '.yankring_history'

" unnest JSON with jq utility
nmap <leader>fj :%!jq '.'<CR>

" NERDtree
let g:NERDTreeWinSize = 40
" autocmd vimenter * if !argc() | NERDTree | endif
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
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

" Arduino
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

" gundo
nnoremap <F5> :GundoToggle<CR>

" gnupg options
let g:GPGPreferArmor = 1
let g:GPGPreferSign = 1

" geeknote
noremap <F8> :Geeknote<cr>
autocmd FileType geeknote setlocal nonumber

" tagbar
nmap <silent> <leader>t :TagbarToggle<CR>

" vim-pad
let g:pad#dir = "~/.vim-pad/"

" highlight changes
let python_highlight_all = 1

" githup dashboard
source ~/.vim-ghd.vim
let g:github_dashboard = { 'username': GITHUB_USER, 'password': GITHUB_TOKEN }

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
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" EXIT ALL THE THINGS
command Q qa!

" need something for rst/md/plain to enable spellchecking
" set spell spelllang=en_us

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_python_checkers = ['pylint', 'pyflakes']

" ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" vim-notes
let g:notes_directories = ['~/Notes', '~/Dropbox/Shared Notes']

" completor
"let g:completor_auto_trigger = 0
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
