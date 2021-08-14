let g:startify_lists = [
  \ { 'type': 'files',     'header': ['   Recent Global Files']            },
  \ { 'type': 'dir',       'header': ['   Recent Files in: '. getcwd()] },
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'commands',  'header': ['   Commands']       },
  \ ]
let g:startify_files_number = 10
let g:startify_bookmarks = [ 
  \ { 'i': '~/.config/nvim/init.vim' }, 
  \ { 'z': '~/.zshaliasrc'},
  \ { 's': '~/.config/nvim/config/startify.vim'},
  \ { 'c': '~/.apps/sh/WindowScreenShot.sh'},
  \ { 't': '~/Dropbox/Freigaben/Arbeit/TES.md'},
  \ { 'r': '~/Dropbox/Notepad/dummy.txt'},
    \ ]
let g:startify_commands = [
  \ { 'a': 'source ~/Dropbox/Notepad/Session.vim' },
  \ { 'n': 'source ~/.config/nvim/colors/wheat/colors/Session.vim' },
  \ { 'p': 'source ~/.config/polybar/Session.vim' },
  \ { 'o': 'source ~/Documents/ObseScript/Session.vim'},
  \ { 'v': 'VimwikiIndex' },
  \ ]
let g:startify_padding_left = 8
let g:startify_custom_header = [
                             \'   Welcome Back!',
                             \]
" let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
let g:startify_change_to_dir = 1
