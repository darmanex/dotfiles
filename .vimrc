call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'nordtheme/vim'
Plug 'dense-analysis/ale'
Plug 'maralla/completor.vim'
Plug 'maralla/completor-neosnippet'

call plug#end()

" https://stackoverflow.com/questions/62354810/error-detected-while-processing-function-vundleinstallernew
set shell=/usr/bin/zsh

set nocompatible          " Disable vi compatibility to reduce unexpected behavior
set number                " Show line numbers
set shiftwidth=2          " How many spaces to indent code blocks
set tabstop=2             " How many spaces to enter for each tab
set expandtab             " Convert tabs to spaces
set incsearch             " Search as you type
set hlsearch              " Highlight matches while searching
set background=dark       " Turn dark mode on
set autoindent            " indent when moving to the next line while writing code
set enc=utf-8
set guifont=VictorMono\ 14

filetype on               " Enable filetype detection
filetype plugin on        " Enable filetype-specific plugins
filetype indent on        " Adjust indentation rules based on filetype

syntax on                 " Turn syntax highlighting on

set termguicolors "issue: https://stackoverflow.com/a/64763678/3237020

colorscheme catppuccin_mocha

set t_Co=256
set enc=utf-8

set incsearch	            " incremental search
set hlsearch	            " highlight search results
set mouse=a               " mouse scrolling

" issue color scheme: https://github.com/kovidgoyal/kitty/issues/108#issuecomment-320492663
let &t_ut=''

" AirLine settings
let g:airline_theme='catppuccin'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail_improved'
let g:airline_powerline_fonts=1

if !has('gui_running') && &term =~ '\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" Start NERDTree
autocmd VimEnter * NERDTree | wincmd p

"====== yamllint start
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

set foldlevelstart=20

" Indent style
let g:indentLine_char = '┊'

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'
"====== yamllint end

" paste mode
"function! WrapForTmux(s)
"  if !exists('$TMUX')
"    return a:s
"  endif

"  let tmux_start = "\<Esc>Ptmux;"
"  let tmux_end = "\<Esc>\\"

"  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
"endfunction

"let &t_SI .= WrapForTmux("\<Esc>[?2004h")
"let &t_EI .= WrapForTmux("\<Esc>[?2004l")

"function! XTermPasteBegin()
"  set pastetoggle=<Esc>[201~
"  set paste
"  return ""
"endfunction

"inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
" end paste mode
