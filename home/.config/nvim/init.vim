call plug#begin('~/.local/share/vim-plug')
" install with :PlugInstall i forget all the time
" also :PlugUpdate to update plugins or :PlugUpgrade to update itself
" and ofc :PlugStatus works, and :PlugClean to remove

" Vim nord theme
" Plug 'arcticicestudio/nord-vim', { 'dir': '~/.config/nvim/colors/nord' }

" Shameless clone of nord
Plug '/home/laula/.config/nvim/colors/wheat' 

" Another Shameless clone of nord
Plug '/home/laula/.config/nvim/colors/spring' 

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

" Obse Syntax Highlighting
Plug 'katawful/obse.vim'
" Old one for syntax & cse integration
" Plug 'katawful/Obli-Vim', {'for': 'obse'}
" Add if you want OBSE docs integrated into your Vim session
Plug 'katawful/Obli-Vim-Docs', {'for': 'obse'}

" Another try at getting color in here
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Autocomplete
Plug 'maxboisvert/vim-simple-complete'
"
" Vimwiki
Plug 'vimwiki/vimwiki'

" Goyo (Distraction free writing)
Plug 'junegunn/goyo.vim'

" vim-surround
" Plug 'tpope/vim-surround'

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

" disable CSE connection because I am a peasant with normal CS
" let g:ov_disable_cse = 1

" Make it so there is only autocomplete when i press the key
" (Or on a really, really long word)
let g:vsc_type_complete_length = 500

" I don't even know anymore, conceallevel is hell with some of my plugins, but
" it currently works so I'm not touching it
set conceallevel=0


