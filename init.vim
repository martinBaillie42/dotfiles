" Don't try to be vi compatible
set nocompatible

" Permanently show filename at bottom of display
set laststatus=2

" Configure statusline
set statusline=%l\:%c\ %L%=\ %M\ %<%F

" statusline colours
hi StatusLineNC ctermbg=244 ctermfg=235
hi StatusLine ctermbg=253 ctermfg=235

" filetype detection and indentation
filetype plugin indent on

" turn syntax on
syntax on

" Remove the scratch preview window from completion hints.
set completeopt-=preview

" Tabs are 4 spaces
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab

" Allow hidden buffers
set hidden

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase
" specify a directory for plugins
call plug#begin('~/.vim/plugged')

" list of plugins
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'pangloss/vim-javascript'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-rooter'

" initialise plugin system
call plug#end()

" Add node_modules then .git then .git/ to the root detection for vim-rooter
let g:rooter_patterns = ['node_modules/', '.git', '.git/']

" Remap open/close Nerdtree
map <C-n> :NERDTreeToggle<CR>

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" gitgutter update time
set updatetime=250

" permanent gitgutter
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

" Set leader to space
let mapleader=" "

" Set : commands history
set history=500

" Fast saving
nmap <leader>w :w!<cr>

" Start scrolling 7 lines before top/bottom of screen
set so=7

" turn on WiLdmenu. This enables vim command completion
set wildmenu
set wildignore=*~,*/.git/*,*/.DS_Store,*/IM2X-Shell/www/*,*/IM2X-Shell/www-temp/*

" Completion mode that is used for the character specified with 'wildchar'
" As far as I can tell used for filename tab completion. May be used in other
" places
set wildmode=longest:full

" Configure backspace so it behaves nicely
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Set magic for regular expressions
set magic

" No noises for errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Don't use ~ backup files
set nobackup

" Disable highlight when leader and return are pressed
map <silent> <leader><cr> :noh<cr>

" Remap 0 to ^
map 0 ^

" Move a line of text using CMD+[jk]
nmap <D-j> <M-j>
nmap <D-k> <M-k>
vmap <D-j> <M-j>
vmap <D-k> <M-k>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

" Remap entering normal mode in terminal to escape
tnoremap <Esc> <C-\><C-n>
