call plug#begin('~/.local/share/vim-plug')
" install with :PlugInstall i forget all the time
" also :PlugUpdate to update plugins or :PlugUpgrade to update itself
" and ofc :PlugStatus works, and :PlugClean to remove

" Vim nord theme
" Plug 'arcticicestudio/nord-vim', { 'dir': '~/.config/nvim/colors/nord' }

" Shameless clone of nord
Plug '/home/laula/.config/nvim/colors/wheat' 

" nerdtree file browser
Plug 'preservim/nerdtree'

" startify
Plug 'mhinz/vim-startify'

"Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Obsession, to track the current directory's session
" :Obsess to start, :Obsess! to stop
Plug 'tpope/vim-obsession'

" Switch Buffer
Plug 'Yohannfra/Nvim-Switch-Buffer'

" Dictionary
Plug 'szw/vim-dict'

" indentLine
Plug 'Yggdroot/indentLine'

" vim-markdown & dependency
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Obli Vim
Plug 'katawful/Obli-Vim', {'for': 'obse'}

" Another try at getting color in here
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Autocomplete
Plug 'maxboisvert/vim-simple-complete'
"
" Vimwiki
Plug 'vimwiki/vimwiki'

call plug#end()


" General Settings
source ~/.config/nvim/config/settings.vim

" Changed keybinds
source ~/.config/nvim/config/keybinds.vim

" Airline config
source ~/.config/nvim/config/airline.vim

" Startify config
source ~/.config/nvim/config/startify.vim

" Airline and Bufferline config
source ~/.config/nvim/config/airline.vim

" Dict config
source ~/.config/nvim/config/dict.vim

" Colorizer config
source ~/.config/nvim/config/colorizer.vim

" Indent Line config
source ~/.config/nvim/config/indentline.vim

" Color highlighting config
source ~/.config/nvim/config/hexokinase.vim

" Vim Markdown config
source ~/.config/nvim/config/vim-markdown.vim

" Vimwiki config
source ~/.config/nvim/config/vimwiki.vim

" Random settings that might actually one day get their own config. 
" Might.

let g:ov_disable_cse = 1

" set complete-=t
" set complete-=i
"
set dictionary+="~/Documents/ObseScript/AllOblivionFuncs.txt"
let g:vsc_type_complete_length = 500
