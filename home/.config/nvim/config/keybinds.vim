" Nerdtree toggle
noremap <C-t> :NERDTreeToggle<CR>

" Switch buffer
nnoremap S :SwitchBuffer <CR>
" What's this even for?
" set switchbuf=usetab

" Make a new buffer with startify
nnoremap M :Startify<CR>

" plz I cant type
nnoremap ; : 

" Next buffer, previous buffer
" Disable for now that I have mouse controls
" nnoremap <C-N> :w <CR> :bn <CR>
" nnoremap <C-B> :w <CR> :bp <CR>

" 0 is too far away
nnoremap @ 0

" but now I stole the macro key so I need to put it somewhere else
" F2 is kinda temporary
nnoremap <F2> @

" Put previous word on E
nnoremap e b
nnoremap E B

" Should I really get used to pressing Ctrl W? That's such a bad idea.
nnoremap <C-S> <C-W>

" Don't put single deleted letters in register
nnoremap x "_x

" Ok now the fun begins, map a copy all and a delete all, paste register
nnoremap <F5> :%y<CR>
nnoremap <F8> gg"_dGP

" I fucking give up, let me save already 
cnoremap W w
