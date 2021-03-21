"let g:bufferline_echo = 0
"  autocmd VimEnter *
"      \ let &statusline='%{bufferline#refresh_status()}'
"        \ .bufferline#get_status_string()

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#nerdtree_status = 1
let g:airline_powerline_fonts = 1
let g:airline_inactive_collapse = 1
let g:airline_stl_path_style = 'short'


if !exists('g:airline_symbols')
            let g:airline_symbols = {}
    endif

let g:airline_symbols.linenr = '☰'
let g:airline_symbols.readonly = ''

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''

let g:airline_section_z = airline#section#create(['☰ %l/%L  %c'])
let g:airline_section_warning = airline#section#create(['%{ObsessionStatus('''', '''')} '])

