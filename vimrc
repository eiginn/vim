" GistID: 866aa2ef90816b965f4e
" ================ General Config ===================

set number
set nocompatible
set fillchars+=stl:\ ,stlnc:\
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
"set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
filetype off     " required!
set noswapfile
set nobackup
set nowritebackup
set guifont=Hack\ Nerd\ Font\ Mono\ 12
set hlsearch
set incsearch
set updatetime=250
set title
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set clipboard=unnamedplus
set nofoldenable " Turn off folding
set scrolloff=4 " keep n lines visible above and below the cursor
set spelllang=en_us
set noshowmode


" attempts to speed up terminal vim
" https://github.com/vim/vim/issues/2712
"set regexpengine=1

" make wrapped lines easier to spot
let &showbreak=repeat('>', 3)
" let /-style searches case-sensitive only if there is a capital letter
set ignorecase
set smartcase


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
  "let &t_SI = "\<Esc>[6 q"
  " underline for replace mode
  "let &t_SR = "\<Esc>[4 q"
  " block for normal mode
  "let &t_EI = "\<Esc>[2 q"
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

" undo files location
if v:version >= 703
    set undodir=~/.vim/undofiles
    set undofile
endif

" Enbale tab complete for commands
set wildmenu
set wildmode=list:longest,full
" Tab cycle through complete options
set completeopt=menuone,longest,preview


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
Plug 'eiginn/iptables-vim'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'fmoralesc/vim-pad', { 'branch': 'devel' }
Plug 'hallison/vim-markdown'
"Plug 'jamessan/vim-gnupg'
Plug 'junegunn/vim-emoji'
Plug 'majutsushi/tagbar'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'mileszs/ack.vim'
"Plug 'python-mode/python-mode', { 'branch': 'develop', 'for': 'python' }
Plug 'rhysd/committia.vim'
Plug 'saltstack/salt-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'stephpy/vim-yaml'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-fugitive'
Plug 'valloric/youcompleteme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/YankRing.vim'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

" NERDTree related
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" Look and Feel bundles
Plug 'KKPMW/sacredforest-vim'
Plug 'KabbAmine/yowish.vim'
Plug 'gregsexton/Muon'
Plug 'jacoborus/tender.vim'
Plug 'marcopaganini/termschool-vim-theme'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'scwood/vim-hybrid'
Plug 'trevordmiller/nova-vim'
Plug 'nightsense/snow'

call plug#end()
" MUST be run after pluggins loaded
syntax on
filetype plugin indent on

" manually set leader
let g:mapleader = '\'

let g:airline_powerline_fonts = 1

" =============== Everything else ===================

if has('gui_running')
    colorscheme jellybeans
else
    let g:jellybeans_overrides = {
    \    'background': { 'ctermbg': 'none', '256ctermbg': 'none', 'guibg': 'none' },
    \}
    colorscheme jellybeans
endif
let g:airline_theme='jellybeans'

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
cmap w!! w !sudo tee % >/dev/null

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
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
"let g:ale_open_list = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

"au FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = "context"

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
"let g:gitgutter_eager = 0
"let g:gitgutter_realtime = 0

let g:committia_open_only_vim_starting = 0

" gnupg options
let g:GPGPreferArmor = 1
let g:GPGPreferSign = 1

" tagbar
nmap <silent> <leader>t :TagbarToggle<CR>

" highlight changes
let g:python_highlight_all = 1

" vim-notes
let g:notes_directories = ['~/Notes', '~/Dropbox/Shared Notes']

" completor
let g:completor_auto_trigger = 0
inoremap <expr> <Tab> pumvisible() ? "<C-N>" : "<C-R>=completor#do('complete')<CR>"
let g:completor_min_chars = 4
let g:completor_blacklist = ['tagbar', 'qf', 'netrw', 'unite', 'vimwiki', 'gitcommit', 'notes']

" Force using the Django template syntax file
let g:sls_use_jinja_syntax = 1

" NERD Commenter
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" vim-pad
let g:pad#dir = '/home/vaelen/.vim-pad'
