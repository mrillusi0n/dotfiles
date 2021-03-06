"     .   oooo                      .                                 oooo                 
"   .o8   `888                    .o8                                 `888                 
" .o888oo  888 .oo.    .ooooo.  .o888oo  .ooooo.   .oooo.    .ooooo.   888 .oo.   oooo d8b 
"   888    888P"Y88b  d88' `88b   888   d88' `88b `P  )88b  d88' `"Y8  888P"Y88b  `888""8P 
"   888    888   888  888ooo888   888   888ooo888  .oP"888  888        888   888   888     
"   888 .  888   888  888    .o   888 . 888    .o d8(  888  888   .o8  888   888   888     
"   "888" o888o o888o `Y8bod8P'   "888" `Y8bod8P' `Y888""8o `Y8bod8P' o888o o888o d888b    



" initialize plugins
call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/NERDTree'

" syntax
Plug 'sheerun/vim-polyglot'
Plug 'hail2u/vim-css3-syntax'
Plug 'StanAngeloff/php.vim'

" lang specific
Plug 'vim-python/python-syntax'
Plug 'rust-lang/rust.vim'

" colorschemes
Plug 'ajh17/spacegray.vim'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim'
Plug 'nanotech/jellybeans.vim'
Plug 'branwright1/salvation-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/forest-night'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

Plug 'chrisbra/Colorizer'

call plug#end()

runtime macros/matchit.vim

" display what's being pressed
set showcmd

set autochdir

" searching
set incsearch
set ignorecase


set ruler
set tabstop=4 shiftwidth=4 smarttab

set nohlsearch
set relativenumber
set autoindent
set autoread

filetype plugin indent on
syntax on

set shortmess+=IFT

" setting colorscheme specifics
set termguicolors

" ayu
let ayucolor="mirage"

set splitright
set splitbelow

set scrolloff=2

set noswapfile
set nobackup
set nowritebackup

" restore cursor position when opening a file
autocmd BufReadPost *
			\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
			\ |   exe "normal! g`\""
			\ | endif

map <silent> <C-n> :NERDTreeToggle<CR>

let g:python_highlight_all = 1
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0

" rust
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'pbcopy'

" source config on write (causing slowness)
" autocmd BufWritePost init.vim :silent! source %

nnoremap <silent> <leader>s :set hlsearch!<CR>
nnoremap <silent> <leader>n :set relativenumber!<CR>

" split window
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

inoremap <C-z> <Esc>zta

" buffer navigation
nnoremap <silent> <leader>. :bn<CR>
nnoremap <silent> <leader>, :bp<CR>

" enable mouse in all modes
set mouse=a

" enable project specific vimrc
set exrc secure

map K k
map Y y$

set inccommand=split

set laststatus=0 ruler

colorscheme forest-night

" no bg for current line number
" highlight CursorLineNr guibg=none

map <Space> :

vnoremap <silent> <leader>c "+y<CR>

" transparency
" highlight Normal ctermbg=none guibg=none
" highlight CursorLineNr ctermbg=none guibg=none

" weird snippets
" autocmd FileType c nnoremap <C-c> :r !cat ~/.config/nvim/boiler_c.c<CR>3-vg_<C-g>

" e => everything
omap ae :<C-U>silent! normal! ggVG<CR>
vnoremap ae :<C-U>silent! normal! ggVG<CR>

" parens
onoremap inb :<C-u>normal! f(vib<Cr>

let s:scheme_index = 0

function! NextColorScheme()
	echo "Switching Colors"
	let s:schemes = getcompletion('', 'color')
	execute "colorscheme" s:schemes[s:scheme_index]
	let s:scheme_index = (s:scheme_index + 1) % len(s:schemes)
endfunction

nnoremap <leader>cc :call NextColorScheme()<CR>

" normal escape in terminal
tnoremap <Esc> <C-\><C-n>
