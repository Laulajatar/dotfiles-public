" Show matching brackets.
set showmatch          

" Show the line numbers on the left side.
set number             

" Insert spaces when TAB is pressed.
set expandtab           

" Search settings
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.

" Something something system clipboard
set clipboard+=unnamedplus

" Useful linebreak only at whitespace
set wrap                

" Break lines 
set linebreak
set textwidth=0
set wrapmargin=0

" 2 line height for command area
set cmdheight=2        

" Tab settings
set tabstop=4           " render tabs with this width
set shiftwidth=4        " pressing tab adds this many spaces

" Uhhhh idk
syntax on               

" Too lazy to make its own config file for now
let NERDTreeShowHidden=1

" It's in the wheat folder but still called nord rip me
colorscheme wheat
" idk why this didn't work, leave it here to figure out one day
" let g:nord_italic_comments=1

" Expand all folds on enter
augroup randomShit
    au BufWinEnter * normal zR
augroup END

" Allow mouse controls
set mouse=a

" File ignore case
set fic
