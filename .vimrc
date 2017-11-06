" Don't try to be vi compatible
set nocompatible

" Permanently show filename at bottom of display
set laststatus=2

" Configure statusline
set statusline=%l\:%c\ %L%=\ %M\ %F

" statusline colours
hi StatusLine ctermbg=244 ctermfg=16

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

" ycm with additional installation function adding js support
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    " !./install.py --tern-completer
    !./install.py 
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

" initialise plugin system
call plug#end()

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Set colour mode to 8 colours - removes bold.
set t_Co=8 t_md=
hi Normal ctermfg=253 ctermbg=16
hi Constant ctermfg=253 ctermbg=16
hi Special ctermfg=253 ctermbg=16
hi Identifier ctermfg=253 ctermbg=16
hi Statement ctermfg=253 ctermbg=16
hi PreProc ctermfg=253 ctermbg=16
hi Type ctermfg=253 ctermbg=16
hi Underlined ctermfg=253 ctermbg=16

hi Comment ctermfg=244 ctermbg=16
hi Todo ctermfg=244 ctermbg=16

hi Error ctermfg=253

hi Pmenu ctermfg=16 ctermbg=244
hi PmenuSel ctermfg=253 ctermbg=238
" gitgutter update time 
set updatetime=250

" gitgutter colours
highlight link GitGutterChange Normal
highlight link GitGutterAdd Normal
highlight link GitGutterDelete Normal
highlight link GitGutterChangeDelete Normal

" permanent gitgutter
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif
