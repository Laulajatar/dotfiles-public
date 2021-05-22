" enable conceallevel only for markdown files, and disable the conceal of
" indentline because both don't seem to work together
augroup ft_markdown
	autocmd!
	autocmd FileType markdown set conceallevel=2
    autocmd FileType markdown let g:indentLine_setConceal=0
augroup END
let g:vim_markdown_strikethrough = 1
