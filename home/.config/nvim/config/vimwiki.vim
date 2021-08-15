" Make sure you have these settings in your vimrc file:
set nocompatible
filetype plugin on
syntax on

let wiki_1 = {}
let wiki_1.path = '~/Dropbox/Vimwiki'

let g:vimwiki_list = [wiki_1]

" Do not affect all markdown files
let g:vimwiki_global_ext = 0

" Prettier checked Lists
" Kat's
" let g:vimwiki_listsyms = '◯◔◐◕●✓'
" Example
" let g:vimwiki_listsyms = '✗○◐●✓'
let g:vimwiki_listsyms = ' ✗✓'

" Idk what this does but go away, folding
let g:vimwiki_folding = ''
