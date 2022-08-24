" ================ General Config ===================
set modelines=1
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
set noswapfile

" prevent "Hit ENTER to continue" prompt
set cmdheight=2

set ttyfast
"let g:loaded_matchparen=1

" backup disable
set nobackup
set nowritebackup

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
if has('termguicolors') && $USER != 'root' "&& !&diff
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
set completeopt=menuone,noinsert,noselect


" ================ Indentation ======================

set autoindent
set smartindent
set cindent
"set smarttab
set shiftwidth=2
set softtabstop=2
"set tabstop=2
set expandtab

" =================== vim-plug ========================

call plug#begin('~/.vim/plugged')

" Plugin bundles
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-signify'
Plug 'easymotion/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'mattn/vim-gist'
Plug 'mattn/webapi-vim'
Plug 'rhysd/committia.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
if empty($VIRTUAL_ENV)
  Plug 'jupyter-vim/jupyter-vim'
endif
Plug 'tidalcycles/vim-tidal'
Plug 'bfrg/vim-jq'
Plug 'bfrg/vim-jqplay'
Plug 'markonm/traces.vim'
Plug 'mhinz/vim-rfc'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mbbill/undotree'

" Language bundles
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'cespare/vim-toml'
Plug 'fatih/vim-nginx'
Plug 'eiginn/iptables-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'google/vim-jsonnet'
Plug 'nfnty/vim-nftables'
Plug 'saltstack/salt-vim'
Plug 'stephpy/vim-yaml'
Plug 'tmux-plugins/vim-tmux'
Plug 'wgwoods/vim-systemd-syntax'
Plug 'vmchale/dhall-vim'
Plug 'stsewd/sphinx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'daveyarwood/vim-alda'
Plug 'fladson/vim-kitty'
Plug 'alaviss/nim.nvim'
Plug 'yschu7/junos.vim'
Plug 'm-pilia/vim-pkgbuild'

" vim-mark needs this other repo
Plug 'inkarkat/vim-ingo-library', { 'branch': 'stable' }
Plug 'inkarkat/vim-mark', { 'branch': 'stable' }

" NERDTree related
"Plug 'preservim/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'ryanoasis/vim-devicons'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

" Look and Feel bundles
Plug 'KKPMW/sacredforest-vim'
Plug 'KabbAmine/yowish.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'jacoborus/tender.vim'
Plug 'eiginn/termschool-vim-theme'
Plug 'nanotech/jellybeans.vim'
Plug 'scwood/vim-hybrid'
Plug 'aonemd/kuroi.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'arcticicestudio/nord-vim'
Plug 'ajh17/Spacegray.vim'
Plug 'joshdick/onedark.vim'
Plug 'NTBBloodbath/doom-one.nvim'
Plug 'wuelnerdotexe/vim-enfocado'
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }

" NVIM
if has('nvim')
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'folke/trouble.nvim'
  Plug 'lambdalisue/suda.vim'
  Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
  Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/playground'
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'
  Plug 'rafamadriz/friendly-snippets'
  Plug 'dccsillag/magma-nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'liuchengxu/vista.vim'
  Plug 'elihunter173/dirbuf.nvim'
endif

call plug#end()
" MUST be run after pluggins loaded
syntax on
filetype plugin indent on

" manually set leader
let g:mapleader = '\'

" look and feel settings
let g:airline_powerline_fonts = 1
let g:airline_theme='embark'
let g:onedark_terminal_italics=1
let g:embark_terminal_italics = 1

if has('gui_running')
  set background=dark
  colorscheme jellybeans
elseif &diff
  set background=dark
  colorscheme kuroi
  set termguicolors
else
  set termguicolors
"  let g:jellybeans_overrides = {
"  \    'background': { 'ctermbg': 'none', '256ctermbg': 'none', 'guibg': 'none'},
"  \}
"  let g:PaperColor_Theme_Options = {
"    \   'theme': {
"    \     'default': {
"    \       'transparent_background': 1,
"    \       'allow_bold': 1,
"    \       'allow_italic': 1
"    \     }
"    \   }
"    \ }
  set background=dark
  colorscheme kuroi
endif

" =============== Everything else ===================

" indentlines
"let g:indentLine_setColors = 0
"let g:indentLine_char = '┆'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_fileTypeExclude = ['text', 'help', 'nerdtree', 'note', 'json', 'notes', 'gitcommit', 'diff']
"let g:indentLine_color_tty_light = 7 " (default: 4)
"let g:indentLine_color_dark = 1 " (default: 2)
"let g:indentLine_bgcolor_term = 202
"let g:indentLine_bgcolor_gui = '#FF5F00'

" Gist stuff
let g:gist_show_privates = 1
let g:gist_post_private = 1
let g:gist_clip_command = 'xsel -ib'
let g:gist_get_multiplefile = 1
let g:gist_update_on_write = 2
let g:gist_list_vsplit = 1

if !has('nvim')
  " allow writes with sudo
  " does not work in neovim, see:
  " https://github.com/neovim/neovim/issues/1496
  " https://github.com/lambdalisue/suda.vim
  cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
endif

" large files
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

" load extra functions and their mappings
if filereadable(expand("~/.vim/functions.vim"))
  source ~/.vim/functions.vim
endif

" unnest JSON with jq utility
nmap <leader>fj :%!jq '.'<CR>

" NERDtree
"let g:NERDTreeWinSize = 40
"let g:NERDTreeHighlightCursorline = 0
"let g:NERDTreeShowBookmarks = 1
"" autocmd vimenter * if !argc() | NERDTree | endif
"" causes nerdtree to open if vim is opened without a file or on a directory
"" also closes vim if nerdtree buffer is last buffer open
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <leader>v <cmd>CHADopen<cr>

" Gitgutter or vim-signify
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
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

" graphviz
let g:graphviz_output_format = 'png'

" vim-mark
let g:mwDefaultHighlightingPalette = 'maximum'

" context.vim
let g:context_enabled = 1

" tidalcycles
let g:tidal_target = "terminal"

" undotree
nnoremap <F5> :UndotreeToggle<CR>

if has('nvim') && !&diff
let g:coq_settings = { 'auto_start': v:true }
let g:coq_settings.xdg = v:true
let g:coq_settings.clients = { 'lsp': { 'weight_adjust': 1.4 } }
lua << EOF
-- local lsp = require "lspconfig"
local coq = require "coq"

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  sync_install = false,
  highlight = {
    enable = true
  }
}

require'lspconfig'.gopls.setup{coq.lsp_ensure_capabilities{}}
require'lspconfig'.vimls.setup{coq.lsp_ensure_capabilities{}}
require'lspconfig'.bashls.setup{coq.lsp_ensure_capabilities{}}
require'lspconfig'.pylsp.setup{coq.lsp_ensure_capabilities{}}
require'lspconfig'.dhall_lsp_server.setup{coq.lsp_ensure_capabilities{}}
require'lspconfig'.terraformls.setup{coq.lsp_ensure_capabilities{}}
require'lspconfig'.tflint.setup{coq.lsp_ensure_capabilities{}}

require "lspconfig".yamlls.setup {
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["https://json.schemastore.org/taskfile.json"] = "Taskfile.yml"
      },
    }
  },
  coq.lsp_ensure_capabilities{}
}

require "lspconfig".efm.setup {
  init_options = {documentFormatting = true},
  filetypes = {"sh", "bash"},
  settings = {
    rootMarkers = {".git/"},
    languages = {
      lua = {
        {formatCommand = "lua-format -i", formatStdin = true}
      },
      sh = {
        {
          lintCommand = "shellcheck -f gcc -x",
          lintSource = 'shellcheck',
          lintFormats = {
            '%f:%l:%c: %trror: %m',
            '%f:%l:%c: %tarning: %m',
            '%f:%l:%c: %tote: %m'
          }
        }
      }
    }
  }
}

local sumneko_root_path = '/home/vaelen/repos/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/Linux/lua-language-server"
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
  coq.lsp_ensure_capabilities{}
}

EOF
nnoremap <leader>xx <cmd>TroubleToggle<cr>

"augroup CompletionEnableAll
"  autocmd!
"  autocmd BufEnter * lua require'completion'.on_attach()
"augroup end
endif " end if has('nvim') && !&diff

" highlight yanked text
augroup LuaHighlight
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END
