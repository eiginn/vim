" ================ General Config ===================
set modelines=0
set number
set nocompatible
set fillchars+=stl:\ ,stlnc:\
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
"set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
filetype off     " required!
set guifont=Hack\ Nerd\ Font\ Mono\ 12
set hlsearch
set incsearch
set updatetime=250
set title
set titleold=
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o
set clipboard=unnamedplus
set nofoldenable " Turn off folding
set scrolloff=3 " keep n lines visible above and below the cursor
set spelllang=en_us
set noshowmode
" make wrapped lines easier to spot
let &showbreak=repeat('>', 3)
" let /-style searches case-sensitive only if there is a capital letter
set ignorecase
set smartcase

" swap files
if isdirectory($HOME . '/.vim/swap')
  set directory^=$HOME/.vim/swap//
else
  set noswapfile
endif

" backup disable
set nobackup
set nowritebackup

" undo files location
if isdirectory($HOME . '/.vim/undofiles')
    set undodir=~/.vim/undofiles
    set undofile
endif


if $TERM == 'xterm-kitty'
  let &t_ut=''
  " vim devicons won't work in kitty term without this
  set t_RV=
endif

if &diff
  set diffopt=internal,filler,algorithm:patience
  let g:html_dynamic_folds = 1
  let g:html_no_progress = 1
  let g:html_whole_filler = 1
endif

" attempts to speed up terminal vim
" https://github.com/vim/vim/issues/2712
"set regexpengine=1

" fix up escape to normal mode speed
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
  "set lazyredraw

  " Cursor shape in terminal
  " vertical line for insert mode
  let &t_SI = "\<Esc>[6 q"
  " underline for replace mode
  let &t_SR = "\<Esc>[4 q"
  " block for normal mode
  let &t_EI = "\<Esc>[2 q"
endif

" settings for true color and tmux escapes for true color
" don't run any of this in a vimdiff session
if has('termguicolors') && $USER != 'root' && !&diff
  if !empty($TMUX)
    " yes thats an escape code "^[" is done via Ctrl+V then ESC
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum
  endif
  set termguicolors
endif

" Enbale tab complete for commands
set wildmenu
set wildmode=list:longest,full
" Tab cycle through complete options
set completeopt=menu,preview,noinsert


" ================ Indentation ======================

set autoindent
"set smartindent
"set smarttab
set shiftwidth=2
set softtabstop=2
"set tabstop=2
set expandtab

" =================== vim-plug ========================

call plug#begin('~/.vim/plugged')

" Plugin bundles
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'
Plug 'chr4/nginx.vim'
Plug 'easymotion/vim-easymotion'
Plug 'eiginn/iptables-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
"Plug 'jamessan/vim-gnupg'
Plug 'majutsushi/tagbar'
Plug 'mattn/vim-gist'
Plug 'mattn/webapi-vim'
Plug 'maralla/completor.vim'
Plug 'mileszs/ack.vim'
"Plug 'python-mode/python-mode', { 'branch': 'develop', 'for': 'python' }
Plug 'rhysd/committia.vim'
Plug 'saltstack/salt-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'stephpy/vim-yaml'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/YankRing.vim'
Plug 'dense-analysis/ale'
"Plug 'wellle/targets.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'robbles/logstash.vim'
Plug 'wgwoods/vim-systemd-syntax'
Plug 'google/vim-jsonnet'
Plug 'liuchengxu/graphviz.vim'
if empty($VIRTUAL_ENV)
  Plug 'jupyter-vim/jupyter-vim'
endif
Plug 'tidalcycles/vim-tidal'
Plug 'nfnty/vim-nftables'
"Plug 'AndrewRadev/linediff.vim'

" both of these are for bazel
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'

" vim-mark needs this other repo
Plug 'inkarkat/vim-ingo-library', { 'branch': 'stable' }
Plug 'inkarkat/vim-mark', { 'branch': 'stable' }

" NERDTree related
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'ryanoasis/vim-devicons'

" Look and Feel bundles
Plug 'KKPMW/sacredforest-vim'
Plug 'KabbAmine/yowish.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'jacoborus/tender.vim'
Plug 'eiginn/termschool-vim-theme'
Plug 'nanotech/jellybeans.vim'
Plug 'nightsense/snow'
Plug 'scwood/vim-hybrid'
Plug 'aonemd/kuroi.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'arcticicestudio/nord-vim'
Plug 'ajh17/Spacegray.vim'
Plug 'joshdick/onedark.vim'

call plug#end()
" MUST be run after pluggins loaded
syntax on
filetype plugin indent on

" manually set leader
let g:mapleader = '\'

" look and feel settings
let g:airline_powerline_fonts = 1
let g:airline_theme='jellybeans'
let g:onedark_terminal_italics=1

if has('gui_running')
  set background=dark
  colorscheme jellybeans
elseif &diff
  set background=dark
  colorscheme kuroi
else
  let g:jellybeans_overrides = {
  \    'background': { 'ctermbg': 'none', '256ctermbg': 'none', 'guibg': 'none'},
  \}
  let g:PaperColor_Theme_Options = {
    \   'theme': {
    \     'default': {
    \       'transparent_background': 1,
    \       'allow_bold': 1,
    \       'allow_italic': 1
    \     }
    \   }
    \ }
  set background=dark
  colorscheme kuroi
endif

" =============== Everything else ===================

" indentlines
let g:indentLine_setColors = 0
let g:indentLine_char = '┆'
let g:indentLine_fileTypeExclude = ['text', 'help', 'nerdtree', 'note', 'json', 'notes', 'gitcommit', 'diff']

" Gist stuff
let g:gist_show_privates = 1
let g:gist_post_private = 1
let g:gist_clip_command = 'xsel -ib'
let g:gist_get_multiplefile = 1
let g:gist_update_on_write = 2
let g:gist_list_vsplit = 1

" allow writes with sudo
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" show trailing whitespace with <leader>s
set listchars=tab:>-,trail:·,eol:$
nmap <leader>s :set nolist!<CR>
set listchars=tab:»-,trail:•,eol:¶,nbsp:⎵,precedes:«,extends:» sbr=↪

" toggle line numbering
nmap <C-N><C-N> :set invnumber<CR>

" paste mode toggle
set pastetoggle=<F2>

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

" EXIT ALL THE THINGS
command Q qa!

" easymotion
map <Leader> <Plug>(easymotion-prefix)

" pymode
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
" helps reduce lag when moving cursor fast
let g:ale_echo_delay = 50
"let g:ale_set_loclist = 0
"let g:ale_set_quickfix = 1
if &diff
  let g:ale_lint_on_enter = 0
else
  let g:ale_open_list = 0
endif
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

" load extra functions and their mappings
if filereadable(expand("~/.vim/functions.vim"))
  source ~/.vim/functions.vim
endif

" Yankring
" show yankring in new buffer
nnoremap <silent> <F3> :YRShow<CR>
" yankring hist file
let g:yankring_history_file = '.yankring_history'

" unnest JSON with jq utility
nmap <leader>fj :%!jq '.'<CR>

" NERDtree
let g:NERDTreeWinSize = 40
let g:NERDTreeHighlightCursorline = 0
let g:NERDTreeShowBookmarks = 1
" autocmd vimenter * if !argc() | NERDTree | endif
" causes nerdtree to open if vim is opened without a file or on a directory
" also closes vim if nerdtree buffer is last buffer open
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Gitgutter
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" committia
let g:committia_hooks = {}
let g:committia_open_only_vim_starting = 0
function! g:committia_hooks.edit_open(info)
  setlocal spell
  "if a:info.vcs ==# 'git' && getline(1) ==# ''
    startinsert
  "endif
  " See ftplugin/gitcommit.vim
  au BufWinEnter COMMIT_EDITMSG call g:InsertModeEOL()
endfunction

" gnupg options
let g:GPGPreferArmor = 1
let g:GPGPreferSign = 1

" tagbar
nmap <silent> <leader>t :TagbarToggle<CR>

" highlight changes
let g:python_highlight_all = 1

" vim-notes
let g:notes_directories = ['~/Notes', '~/Dropbox/Shared Notes']
let g:notes_conceal_url = 0

" completor
"let g:completor_auto_trigger = 1
let g:completor_gocode_binary = '/home/vaelen/projects/go/bin/gocode-gomod'
"let g:completor_refresh_always = 0
"inoremap <expr> <Tab> pumvisible() ? "<C-N>" : "<C-R>=completor#do('complete')<CR>"
"let g:completor_min_chars = 4
let g:completor_blacklist = ['tagbar', 'netrw', 'unite', 'vimwiki', 'gitcommit', 'notes']
let g:completor_complete_options = 'menuone,noselect,preview,noinsert'
let g:completor_auto_close_doc = 0

" Force using the Django template syntax file
let g:sls_use_jinja_syntax = 1

" NERD Commenter
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" wiki
let g:wiki_root = '~/.wiki'

" fugitive
" open quickfix list after any :Glog or :Ggrep
autocmd QuickFixCmdPost *grep* cwindow

" large files
autocmd BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syntax clear | endif

" graphviz
let g:graphviz_output_format = 'png'

" vim-mark
let g:mwDefaultHighlightingPalette = 'maximum'
