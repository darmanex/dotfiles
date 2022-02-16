call plug#begin('~/.config/nvim/plugged')

"-------------------=== Code/Project navigation ===-------------
Plug 'ncm2/ncm2'
Plug 'preservim/nerdtree' " A file explorer
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin' 
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'preservim/nerdcommenter' " An easy way for commenting out lines
Plug 'dense-analysis/ale'

"-------------------=== Languages support ===-------------------
Plug 'davidhalter/jedi-vim' "Python autocompletion
Plug 'jiangmiao/auto-pairs' "Automatic quote and bracket completion
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Code completion engine
Plug 'SirVer/ultisnips' " Snippets engine
Plug 'honza/vim-snippets' " A collection of snippets
"Plug 'fladson/vim-kitty' " kitty config syntax highlighting
Plug 'maximbaz/lightline-ale' " Lighline status for errors

"-------------------=== Color Themes ===---------------------
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'joshdick/onedark.vim'
Plug 'chriskempson/base16-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'connorholyday/vim-snazzy'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'projekt0n/github-nvim-theme'
Plug 'mhinz/vim-startify'

"-------------------=== Utility ===-------------------------------
Plug 'mengelbrecht/lightline-bufferline'
Plug 'tpope/vim-fugitive' " Git status

call plug#end()

" Filetype settings
filetype on
filetype plugin on

" Deoplete settings
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

"-------------------=== Lighline config ===-----------------------
" lightline color scheme config
"let &t_ut='' "kitty recommendation for background issues

if (has("termguicolors"))
 set termguicolors
endif
set background=dark
colorscheme gruvbox

let g:lightline = {
  \     'colorscheme': 'PaperColor',
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['filetype', 'fileformat', 'fileencoding']]
  \     },
  \   	'component': {
  \         'lineinfo': ' %3l:%-2v',
  \   	},
  \   	'component_function': {
  \         'fugitive': 'fugitive#head',
  \   	}
  \ }

let g:lightline.separator = {
  \   'left': '', 'right': '',
  \ }
let g:lightline.subseparator = {
  \   'left': '', 'right': '',
  \ }
let g:lightline.tabline = {
  \   'left': [['buffers']],
  \   'right': [['close']]
  \ }
let g:lightline.component_expand = {
  \   'buffers': 'lightline#bufferline#buffers',
  \  'linter_checking': 'lightline#ale#checking',
  \  'linter_infos': 'lightline#ale#infos',
  \  'linter_warnings': 'lightline#ale#warnings',
  \  'linter_errors': 'lightline#ale#errors',
  \  'linter_ok': 'lightline#ale#ok',
  \ }
let g:lightline.component_type = {
  \  'linter_checking': 'right',
  \  'linter_infos': 'right',
  \  'linter_warnings': 'warning',
  \  'linter_errors': 'error',
  \  'linter_ok': 'right',
  \   'buffers': 'tabsel',
  \ }
let g:lightline.active = {
  \ 'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
  \            [ 'lineinfo' ],
  \            [ 'percent' ],
  \            [ 'fileformat', 'fileencoding', 'filetype'] ] 
  \}
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

set showtabline=2   " Show tabline
set guioptions-=e   " Don't use GUI tabline
set laststatus=2
set noshowmode
set number  " Show line numer
syntax on   " Syntax highlighting
set mouse=a " the 'a' means all vim modes: visual, normal, insert, command line
set encoding=utf-8
set cursorline " highlight current cursorline
set ttyfast " Speed up scrolling in Vim
set nocompatible    " disable compatibility to old-time vi
" open new split panes to right and below
set splitright
set splitbelow

if !has('gui_running')
  set t_Co=256
endif

" lightline buffer
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

" ALE settings
let g:ale_fixers = {
  \   'javascript': ['eslint'],
  \   'css': ['eslint'],
  \   'python': ['eslint'],
  \   'yaml': ['eslint']
  \ }
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

" Commentarry settings
autocmd FileType apache setlocal commentstring=#\ %s

set guifont=JuliaMono\ 10

" Cursor settings
set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50
                  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
                  \,sm:block-blinkwait175-blinkoff150-blinkon175

" Indentation
set autoindent                      " Automatically indent new lines
set expandtab                       " Use spaces instead of tabs
set shiftwidth=4                    " Number of auto-indent spaces
filetype plugin indent on           " Allow auto-indenting depending on file type
set smarttab                        " Enable smart tab
set smartindent                     " Enable smart indent
set softtabstop=4                   " Number of spaces per tab
" Indent style
let g:indentLine_char = '┊'
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" NERDTree settings
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$'] " Ignore files in NERDTree
let NERDTreeWinSize=20 " Set size window
nnoremap <C-t> :NERDTreeToggle<CR>

" Ultisnips settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Key bindings settings
"
"    inoremap: maps the key in insert mode
"    nnoremap: maps the key in normal mode
"    vnoremap: maps the key in visual mode
"    <C> : represents Control key
"    <A> : Alt key
"
" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" move split panes to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L
" move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Press i to enter insert mode, and ii to exit insert mode.
:inoremap ii <Esc>
:inoremap jk <Esc>
:inoremap kj <Esc>
:vnoremap jk <Esc>
:vnoremap kj <Esc>

" reload nvim
nnoremap <silent>sv :source $MYVIMRC<CR>

" clear the highlighting search
nnoremap <silent> ,<space> :nohlsearch<CR>

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c,cpp,java,scala': { 'left': '/** ','right': '*/ ' } }
let g:NERDCustomDelimiters = { 'sh,ruby,python': { 'left': '# ' } }
let g:NERDCustomDelimiters = { 'conf,fstab,rc': { 'left': '# ' } }
let g:NERDCustomDelimiters = { 'vim': { 'left': '" ' } }
