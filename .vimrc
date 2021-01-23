"
"        VVVVVVVV           VVVVVVVVIIIIIIIIIIMMMMMMMM               MMMMMMMMRRRRRRRRRRRRRRRRR           CCCCCCCCCCCCC
"        V::::::V           V::::::VI::::::::IM:::::::M             M:::::::MR::::::::::::::::R       CCC::::::::::::C
"        V::::::V           V::::::VI::::::::IM::::::::M           M::::::::MR::::::RRRRRR:::::R    CC:::::::::::::::C
"        V::::::V           V::::::VII::::::IIM:::::::::M         M:::::::::MRR:::::R     R:::::R  C:::::CCCCCCCC::::C
"         V:::::V           V:::::V   I::::I  M::::::::::M       M::::::::::M  R::::R     R:::::R C:::::C       CCCCCC
"          V:::::V         V:::::V    I::::I  M:::::::::::M     M:::::::::::M  R::::R     R:::::RC:::::C
"           V:::::V       V:::::V     I::::I  M:::::::M::::M   M::::M:::::::M  R::::RRRRRR:::::R C:::::C
"            V:::::V     V:::::V      I::::I  M::::::M M::::M M::::M M::::::M  R:::::::::::::RR  C:::::C
"             V:::::V   V:::::V       I::::I  M::::::M  M::::M::::M  M::::::M  R::::RRRRRR:::::R C:::::C
"              V:::::V V:::::V        I::::I  M::::::M   M:::::::M   M::::::M  R::::R     R:::::RC:::::C
"               V:::::V:::::V         I::::I  M::::::M    M:::::M    M::::::M  R::::R     R:::::RC:::::C
"                V:::::::::V          I::::I  M::::::M     MMMMM     M::::::M  R::::R     R:::::R C:::::C       CCCCCC
"                 V:::::::V         II::::::IIM::::::M               M::::::MRR:::::R     R:::::R  C:::::CCCCCCCC::::C
" ......           V:::::V          I::::::::IM::::::M               M::::::MR::::::R     R:::::R   CC:::::::::::::::C
" .::::.            V:::V           I::::::::IM::::::M               M::::::MR::::::R     R:::::R     CCC::::::::::::C
" ......             VVV            IIIIIIIIIIMMMMMMMM               MMMMMMMMRRRRRRRR     RRRRRRR        CCCCCCCCCCCCC

" ==================== CORE SETTINGS ====================

set encoding=UTF-8      " standard unicode utf-8
filetype plugin indent on

set splitright splitbelow

set nocompatible
set hidden
set undofile    " persistent undos
set nobackup    " don't create backup files
set noswapfile  " don't create swap files
set novisualbell
set noerrorbells
set history=500
set backspace=indent,eol,start

set wildmode=list:longest

" Ignore certain files and folders when globbing
set wildignore+=*.o,*.obj,*.bin,*.dll,*.exe
set wildignore+=*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**
set wildignore+=*.jpg,*.png,*.jpeg,*.bmp,*.gif,*.tiff,*.svg,*.ico
set wildignore+=*.pyc
set wildignore+=*.DS_Store
set wildignore+=*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz
set wildignorecase  " ignore file and dir name cases in cmd-completion

set ts=4 sw=4 sts=4 et ai   " default, use 4 spaces on tabs

set scrolloff=5
"set signcolumn=yes

set completeopt+=menuone
set completeopt+=noselect

set incsearch
set shortmess+=c
set updatetime=100
set clipboard=unnamed   " use system clipboard

" ==================== UI SETTINGS ====================

syntax on

"set cursorline
set rnu nu
set ruler

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set background=dark

let g:ayucolor='mirage'
colorscheme mountain

let g:asmsyntax='nasm'  " syntax highlighting specifically NASM

" ==================== AUTOCMDS ====================

autocmd FileType asm    setlocal ts=8 sw=8 sts=8 noexpandtab    " For assembly, use tabs

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Optionally reset the cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

autocmd CompleteDone * if !pumvisible() | pclose | endif

" ==================== MAPPINGS ====================

"" Remap leader key
let mapleader=','

"" Quicker saving
nmap <silent> <C-s> :w<CR>
imap <silent> <C-s> <ESC>:w<CR>
vmap <silent> <C-s> <ESC>:w<CR>

"" Fast ESC in insert
imap <silent> jk <ESC>

"" Better movement to beginning and end of line
nnoremap <silent> H ^
nnoremap <silent> L g_

"" Move b/w splits with ease
map <silent> <M-Up> <C-w>k_
map <silent> <M-Down> <C-w>j_
map <silent> <M-Left> <C-w>h_
map <silent> <M-Right> <C-w>l_
imap <silent> <M-Up> <ESC><C-w>k_
imap <silent> <M-Down> <ESC><C-w>j_
imap <silent> <M-Left> <ESC><C-w>h_
imap <silent> <M-Right> <ESC><C-w>l_

"" Remove trailing whitespace
map <silent> <leader><SPACE> :%s/\s\+$//e<CR>

"" Clear search highlighting
nnoremap <silent> // :noh<CR>

"" Select all
nmap <C-a> ggvGG$

"" Copy and pasting powers
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

"" Move between tabs
nmap <C-h> :tabp<CR>
nmap <C-l> :tabn<CR>
imap <C-h> <ESC>:tabp<CR>
imap <C-l> <ESC>:tabn<CR>

"" Create new tabs
nnoremap <silent> tt :tabnew<CR>

"" Fast reload source .vimrc file
map <silent> <leader>vr :source $MYVIMRC<CR>

"==================== PLUGINS ====================

call plug#begin()

Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'ervandew/supertab'
Plug 'junegunn/goyo.vim'
Plug 'sbdchd/neoformat', { 'on': 'Neoformat' }
Plug 'mhinz/vim-startify'
Plug 'puremourning/vimspector'
Plug 'sheerun/vim-polyglot'
Plug 'pineapplegiant/spaceduck'
Plug 'vimwiki/vimwiki'

call plug#end()

" ==================== PLUGIN SETTINGS/REMAPS ====================

"" SuperTab
let g:SuperTabDefaultCompletionType="<c-n>"
let g:SuperTabContextDefaultCompletionType="<c-n>"

"" COC
let g:coc_disable_startup_warning=1

"" Goyo
let g:goyo_width=80
let g:goyo_height='100%'
let g:goyo_linenr=1
nnoremap <silent> <leader>g :Goyo<CR>
inoremap <silent> <leader>g <ESC>:Goyo<CR>

"" Ale
let g:ale_linters = {
  \ 'vim': ['vint'],
  \ 'cpp': ['clangd'],
  \ 'c': ['clangd'],
  \ 'python': ['black']
  \}

" Only run linters in the g:ale_linters dictionary
let g:ale_linters_explicit = 1

" Linter signs
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '!'

let g:ale_sign_column_always=1

"" Neoformat
let g:neoformat_enabled_python = ['black', 'yapf']
let g:neoformat_cpp_clangformat = {
      \ 'exe': 'clang-format',
      \ 'args': ['--style="{IndentWidth: 4}"']
      \ }
let g:neoformat_c_clangformat = {
      \ 'exe': 'clang-format',
      \ 'args': ['--style="{IndentWidth: 4}"']
      \ }

let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']

" Vimspector
let g:vimspector_base_dir=expand( '$HOME/.vim/vimspector-config' )
let g:vimspector_enable_mappings='HUMAN'
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput
