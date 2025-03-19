" manually set leader, must be before Lazy is loaded
let g:mapleader = '\'
lua <<EOF
require("config.lazy")
EOF
syntax on
filetype plugin indent on

set modelines=1
set number
set fillchars+=stl:\ ,stlnc:\
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
set clipboard=unnamedplus
set hlsearch
set incsearch
set title
set titleold=
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o
set nofoldenable " Turn off folding
set scrolloff=3 " keep n lines visible above and below the cursor
set spelllang=en_us
" make wrapped lines easier to spot
let &showbreak=repeat('>', 3)
" let /-style searches case-sensitive only if there is a capital letter
set ignorecase
set smartcase
set noswapfile
" prevent "Hit ENTER to continue" prompt
"set cmdheight=2
set nomore
set ttyfast
" backup disable
set nobackup
set nowritebackup

set autoindent
set smartindent
set cindent
"set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=4
set expandtab

" settings for true color and tmux escapes for true color
" don't run any of this in a vimdiff session
if has('termguicolors') && $USER != 'root' "&& !&diff
  if !empty($TMUX)
    " yes thats an escape code "^[" is done via Ctrl+V then ESC
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum
  endif
  set termguicolors
endif

" Provider setup
" Python
let g:python3_host_prog = '/home/vaelen/.local/pyenv/versions/py3nvim/bin/python'


if &diff
  set diffopt=internal,filler,algorithm:patience
  let g:html_dynamic_folds = 1
  let g:html_no_progress = 1
  let g:html_whole_filler = 1
endif

"if $TERM == 'xterm-kitty'
"  let &t_ut=''
"  " vim devicons won't work in kitty term without this
"  set t_RV=
"endif

" large files turn off syntax
autocmd BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syntax clear | endif

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

" Disable EX mode key
map Q <Nop>

" EXIT ALL THE THINGS
command Q qa!

" load extra functions and their mappings
if filereadable(expand("~/.config/nvim/functions.vim"))
  source ~/.config/nvim/functions.vim
endif

" unnest JSON with jq utility
nmap <leader>fj :%!jq '.'<CR>

" vim-signify
highlight SignifySignAdd    guifg=#009900 ctermfg=2
highlight SignifySignChange guifg=#bbbb00 ctermfg=3
highlight SignifySignDelete guifg=#ff2222 ctermfg=1
if &diff
  let g:signify_disable_by_default = 1
endif
let g:signify_skip = { 'vcs': { 'allow': ['git'] } }

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

" tagbar
nmap <silent> <leader>t :TagbarToggle<CR>
" CHADtree
nnoremap <leader>v <cmd>CHADopen<cr>

" highlight changes
let g:python_highlight_all = 1

" vim-mark
let g:mwDefaultHighlightingPalette = 'maximum'

" tidalcycles
let g:tidal_target = "terminal"

" look and feel settings
let g:onedark_terminal_italics=1
let g:embark_terminal_italics = 1
