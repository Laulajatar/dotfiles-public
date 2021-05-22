" Copyright (C) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
" Copyright (C) 2016-present Sven Greb <development@svengreb.de>

" Project: Nord Vim
" Repository: https://github.com/arcticicestudio/nord-vim
" License: MIT

let s:wheat_vim_version="0.15.0"
let g:airline#themes#wheat#palette = {}

let s:wheat0_gui = "#232732" " 232732
let s:wheat1_gui = "#3F4551"
let s:wheat2_gui = "#4B5368"
let s:wheat3_gui = "#656E7F"
let s:wheat4_gui = "#616E88"
let s:wheat5_gui = "#EBEEF5"
let s:wheat6_gui = "#99B3CC"
let s:wheat7_gui = "#AABFD4"
let s:wheat8_gui = "#99BFCC"
let s:wheat9_gui = "#A9C9D4"
let s:wheat10_gui = "#F3CA8A"
let s:wheat11_gui = "#FF7066"
let s:wheat12_gui = "#F6D5A2"
let s:wheat13_gui = "#F6DEA2"
let s:wheat14_gui = "#F4D48B"
let s:wheat15_gui = "#BB9B90"

let s:wheat0_term = "NONE"
let s:wheat1_term = "0"
let s:wheat2_term = "NONE"
let s:wheat4_term = "NONE"
let s:wheat11_term = "1"
let s:wheat14_term = "2"
let s:wheat13_term = "3"
let s:wheat9_term = "4"
let s:wheat15_term = "5"
let s:wheat8_term = "6"
let s:wheat5_term = "7"
let s:wheat3_term = "8"
let s:wheat12_term = "11"
let s:wheat10_term = "12"
let s:wheat7_term = "14"
let s:wheat6_term = "15"

let s:NMain = [s:wheat1_gui, s:wheat8_gui, s:wheat1_term, s:wheat8_term]
let s:NRight = [s:wheat1_gui, s:wheat9_gui, s:wheat1_term, s:wheat9_term]
let s:NMiddle = [s:wheat5_gui, s:wheat3_gui, s:wheat5_term, s:wheat3_term]
let s:NWarn = [s:wheat1_gui, s:wheat13_gui, s:wheat3_term, s:wheat13_term]
let s:NError = [s:wheat0_gui, s:wheat11_gui, s:wheat1_term, s:wheat11_term]
let g:airline#themes#wheat#palette.normal = airline#themes#generate_color_map(s:NMain, s:NRight, s:NMiddle)
let g:airline#themes#wheat#palette.normal.airline_warning = s:NWarn
let g:airline#themes#wheat#palette.normal.airline_error = s:NError

let s:IMain = [s:wheat1_gui, s:wheat14_gui, s:wheat1_term, s:wheat6_term]
let s:IRight = [s:wheat1_gui, s:wheat9_gui, s:wheat1_term, s:wheat9_term]
let s:IMiddle = [s:wheat5_gui, s:wheat3_gui, s:wheat5_term, s:wheat3_term]
let s:IWarn = [s:wheat1_gui, s:wheat13_gui, s:wheat3_term, s:wheat13_term]
let s:IError = [s:wheat0_gui, s:wheat11_gui, s:wheat1_term, s:wheat11_term]
let g:airline#themes#wheat#palette.insert = airline#themes#generate_color_map(s:IMain, s:IRight, s:IMiddle)
let g:airline#themes#wheat#palette.insert.airline_warning = s:IWarn
let g:airline#themes#wheat#palette.insert.airline_error = s:IError

let s:RMain = [s:wheat1_gui, s:wheat14_gui, s:wheat1_term, s:wheat14_term]
let s:RRight = [s:wheat1_gui, s:wheat9_gui, s:wheat1_term, s:wheat9_term]
let s:RMiddle = [s:wheat5_gui, s:wheat3_gui, s:wheat5_term, s:wheat3_term]
let s:RWarn = [s:wheat1_gui, s:wheat13_gui, s:wheat3_term, s:wheat13_term]
let s:RError = [s:wheat0_gui, s:wheat11_gui, s:wheat1_term, s:wheat11_term]
let g:airline#themes#wheat#palette.replace = airline#themes#generate_color_map(s:RMain, s:RRight, s:RMiddle)
let g:airline#themes#wheat#palette.replace.airline_warning = s:RWarn
let g:airline#themes#wheat#palette.replace.airline_error = s:RError

let s:VMain = [s:wheat1_gui, s:wheat7_gui, s:wheat1_term, s:wheat7_term]
let s:VRight = [s:wheat1_gui, s:wheat9_gui, s:wheat1_term, s:wheat9_term]
let s:VMiddle = [s:wheat5_gui, s:wheat3_gui, s:wheat5_term, s:wheat3_term]
let s:VWarn = [s:wheat1_gui, s:wheat13_gui, s:wheat3_term, s:wheat13_term]
let s:VError = [s:wheat0_gui, s:wheat11_gui, s:wheat1_term, s:wheat11_term]
let g:airline#themes#wheat#palette.visual = airline#themes#generate_color_map(s:VMain, s:VRight, s:VMiddle)
let g:airline#themes#wheat#palette.visual.airline_warning = s:VWarn
let g:airline#themes#wheat#palette.visual.airline_error = s:VError

let s:IAMain = [s:wheat5_gui, s:wheat3_gui, s:wheat5_term, s:wheat3_term]
let s:IARight = [s:wheat5_gui, s:wheat3_gui, s:wheat5_term, s:wheat3_term]
if g:wheat_uniform_status_lines == 0
  let s:IAMiddle = [s:wheat5_gui, s:wheat1_gui, s:wheat5_term, s:wheat1_term]
else
  let s:IAMiddle = [s:wheat5_gui, s:wheat3_gui, s:wheat5_term, s:wheat3_term]
endif
let s:IAWarn = [s:wheat1_gui, s:wheat13_gui, s:wheat3_term, s:wheat13_term]
let s:IAError = [s:wheat0_gui, s:wheat11_gui, s:wheat1_term, s:wheat11_term]
let g:airline#themes#wheat#palette.inactive = airline#themes#generate_color_map(s:IAMain, s:IARight, s:IAMiddle)
let g:airline#themes#wheat#palette.inactive.airline_warning = s:IAWarn
let g:airline#themes#wheat#palette.inactive.airline_error = s:IAError

let g:airline#themes#wheat#palette.normal.airline_term = s:NMiddle
let g:airline#themes#wheat#palette.insert.airline_term = s:IMiddle
let g:airline#themes#wheat#palette.replace.airline_term = s:RMiddle
let g:airline#themes#wheat#palette.visual.airline_term = s:VMiddle
let g:airline#themes#wheat#palette.inactive.airline_term = s:IAMiddle
