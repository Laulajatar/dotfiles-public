" Copyright (C) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
" Copyright (C) 2016-present Sven Greb <development@svengreb.de>

" Project: Nord Vim
" Repository: https://github.com/arcticicestudio/nord-vim
" License: MIT

let s:nord_vim_version="0.15.0"
let g:airline#themes#nord#palette = {}

let s:nord0_gui = "#232732" " 232732
let s:nord1_gui = "#3F4551"
let s:nord2_gui = "#4B5368"
let s:nord3_gui = "#656E7F"
let s:nord4_gui = "#616E88"
let s:nord5_gui = "#EBEEF5"
let s:nord6_gui = "#99B3CC"
let s:nord7_gui = "#AABFD4"
let s:nord8_gui = "#99BFCC"
let s:nord9_gui = "#A9C9D4"
let s:nord10_gui = "#F3CA8A"
let s:nord11_gui = "#FF7066"
let s:nord12_gui = "#F6D5A2"
let s:nord13_gui = "#F6DEA2"
let s:nord14_gui = "#F4D48B"
let s:nord15_gui = "#BB9B90"

let s:nord0_term = "NONE"
let s:nord1_term = "0"
let s:nord2_term = "NONE"
let s:nord4_term = "NONE"
let s:nord11_term = "1"
let s:nord14_term = "2"
let s:nord13_term = "3"
let s:nord9_term = "4"
let s:nord15_term = "5"
let s:nord8_term = "6"
let s:nord5_term = "7"
let s:nord3_term = "8"
let s:nord12_term = "11"
let s:nord10_term = "12"
let s:nord7_term = "14"
let s:nord6_term = "15"

let s:NMain = [s:nord1_gui, s:nord8_gui, s:nord1_term, s:nord8_term]
let s:NRight = [s:nord1_gui, s:nord9_gui, s:nord1_term, s:nord9_term]
let s:NMiddle = [s:nord5_gui, s:nord3_gui, s:nord5_term, s:nord3_term]
let s:NWarn = [s:nord1_gui, s:nord13_gui, s:nord3_term, s:nord13_term]
let s:NError = [s:nord0_gui, s:nord11_gui, s:nord1_term, s:nord11_term]
let g:airline#themes#nord#palette.normal = airline#themes#generate_color_map(s:NMain, s:NRight, s:NMiddle)
let g:airline#themes#nord#palette.normal.airline_warning = s:NWarn
let g:airline#themes#nord#palette.normal.airline_error = s:NError

let s:IMain = [s:nord1_gui, s:nord14_gui, s:nord1_term, s:nord6_term]
let s:IRight = [s:nord1_gui, s:nord9_gui, s:nord1_term, s:nord9_term]
let s:IMiddle = [s:nord5_gui, s:nord3_gui, s:nord5_term, s:nord3_term]
let s:IWarn = [s:nord1_gui, s:nord13_gui, s:nord3_term, s:nord13_term]
let s:IError = [s:nord0_gui, s:nord11_gui, s:nord1_term, s:nord11_term]
let g:airline#themes#nord#palette.insert = airline#themes#generate_color_map(s:IMain, s:IRight, s:IMiddle)
let g:airline#themes#nord#palette.insert.airline_warning = s:IWarn
let g:airline#themes#nord#palette.insert.airline_error = s:IError

let s:RMain = [s:nord1_gui, s:nord14_gui, s:nord1_term, s:nord14_term]
let s:RRight = [s:nord1_gui, s:nord9_gui, s:nord1_term, s:nord9_term]
let s:RMiddle = [s:nord5_gui, s:nord3_gui, s:nord5_term, s:nord3_term]
let s:RWarn = [s:nord1_gui, s:nord13_gui, s:nord3_term, s:nord13_term]
let s:RError = [s:nord0_gui, s:nord11_gui, s:nord1_term, s:nord11_term]
let g:airline#themes#nord#palette.replace = airline#themes#generate_color_map(s:RMain, s:RRight, s:RMiddle)
let g:airline#themes#nord#palette.replace.airline_warning = s:RWarn
let g:airline#themes#nord#palette.replace.airline_error = s:RError

let s:VMain = [s:nord1_gui, s:nord7_gui, s:nord1_term, s:nord7_term]
let s:VRight = [s:nord1_gui, s:nord9_gui, s:nord1_term, s:nord9_term]
let s:VMiddle = [s:nord5_gui, s:nord3_gui, s:nord5_term, s:nord3_term]
let s:VWarn = [s:nord1_gui, s:nord13_gui, s:nord3_term, s:nord13_term]
let s:VError = [s:nord0_gui, s:nord11_gui, s:nord1_term, s:nord11_term]
let g:airline#themes#nord#palette.visual = airline#themes#generate_color_map(s:VMain, s:VRight, s:VMiddle)
let g:airline#themes#nord#palette.visual.airline_warning = s:VWarn
let g:airline#themes#nord#palette.visual.airline_error = s:VError

let s:IAMain = [s:nord5_gui, s:nord3_gui, s:nord5_term, s:nord3_term]
let s:IARight = [s:nord5_gui, s:nord3_gui, s:nord5_term, s:nord3_term]
if g:nord_uniform_status_lines == 0
  let s:IAMiddle = [s:nord5_gui, s:nord1_gui, s:nord5_term, s:nord1_term]
else
  let s:IAMiddle = [s:nord5_gui, s:nord3_gui, s:nord5_term, s:nord3_term]
endif
let s:IAWarn = [s:nord1_gui, s:nord13_gui, s:nord3_term, s:nord13_term]
let s:IAError = [s:nord0_gui, s:nord11_gui, s:nord1_term, s:nord11_term]
let g:airline#themes#nord#palette.inactive = airline#themes#generate_color_map(s:IAMain, s:IARight, s:IAMiddle)
let g:airline#themes#nord#palette.inactive.airline_warning = s:IAWarn
let g:airline#themes#nord#palette.inactive.airline_error = s:IAError

let g:airline#themes#nord#palette.normal.airline_term = s:NMiddle
let g:airline#themes#nord#palette.insert.airline_term = s:IMiddle
let g:airline#themes#nord#palette.replace.airline_term = s:RMiddle
let g:airline#themes#nord#palette.visual.airline_term = s:VMiddle
let g:airline#themes#nord#palette.inactive.airline_term = s:IAMiddle
