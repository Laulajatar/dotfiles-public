" Copyright (C) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
" Copyright (C) 2016-present Sven Greb <development@svengreb.de>

" Project: Nord Vim
" Repository: https://github.com/arcticicestudio/nord-vim
" License: MIT

let g:airline#themes#spring#palette = {}

let s:spring0_gui = "#232732" " 232732
let s:spring1_gui = "#3F4551"
let s:spring2_gui = "#4B5368"
let s:spring3_gui = "#656E7F"
let s:spring4_gui = "#616E88"
let s:spring5_gui = "#EBEEF5"
let s:spring6_gui = "#99B3CC"
let s:spring7_gui = "#AABFD4"
let s:spring8_gui = "#99BFCC"
let s:spring9_gui = "#A9C9D4"
let s:spring10_gui = "#F3CA8A"
let s:spring11_gui = "#FF7066"
let s:spring12_gui = "#F6D5A2"
let s:spring13_gui = "#F6DEA2"
let s:spring14_gui = "#F4D48B"
let s:spring15_gui = "#BB9B90"

let s:spring0_term = "NONE"
let s:spring1_term = "0"
let s:spring2_term = "NONE"
let s:spring4_term = "NONE"
let s:spring11_term = "1"
let s:spring14_term = "2"
let s:spring13_term = "3"
let s:spring9_term = "4"
let s:spring15_term = "5"
let s:spring8_term = "6"
let s:spring5_term = "7"
let s:spring3_term = "8"
let s:spring12_term = "11"
let s:spring10_term = "12"
let s:spring7_term = "14"
let s:spring6_term = "15"

let s:NMain = [s:spring1_gui, s:spring8_gui, s:spring1_term, s:spring8_term]
let s:NRight = [s:spring1_gui, s:spring9_gui, s:spring1_term, s:spring9_term]
let s:NMiddle = [s:spring5_gui, s:spring3_gui, s:spring5_term, s:spring3_term]
let s:NWarn = [s:spring1_gui, s:spring13_gui, s:spring3_term, s:spring13_term]
let s:NError = [s:spring0_gui, s:spring11_gui, s:spring1_term, s:spring11_term]
let g:airline#themes#spring#palette.normal = airline#themes#generate_color_map(s:NMain, s:NRight, s:NMiddle)
let g:airline#themes#spring#palette.normal.airline_warning = s:NWarn
let g:airline#themes#spring#palette.normal.airline_error = s:NError

let s:IMain = [s:spring1_gui, s:spring14_gui, s:spring1_term, s:spring6_term]
let s:IRight = [s:spring1_gui, s:spring9_gui, s:spring1_term, s:spring9_term]
let s:IMiddle = [s:spring5_gui, s:spring3_gui, s:spring5_term, s:spring3_term]
let s:IWarn = [s:spring1_gui, s:spring13_gui, s:spring3_term, s:spring13_term]
let s:IError = [s:spring0_gui, s:spring11_gui, s:spring1_term, s:spring11_term]
let g:airline#themes#spring#palette.insert = airline#themes#generate_color_map(s:IMain, s:IRight, s:IMiddle)
let g:airline#themes#spring#palette.insert.airline_warning = s:IWarn
let g:airline#themes#spring#palette.insert.airline_error = s:IError

let s:RMain = [s:spring1_gui, s:spring14_gui, s:spring1_term, s:spring14_term]
let s:RRight = [s:spring1_gui, s:spring9_gui, s:spring1_term, s:spring9_term]
let s:RMiddle = [s:spring5_gui, s:spring3_gui, s:spring5_term, s:spring3_term]
let s:RWarn = [s:spring1_gui, s:spring13_gui, s:spring3_term, s:spring13_term]
let s:RError = [s:spring0_gui, s:spring11_gui, s:spring1_term, s:spring11_term]
let g:airline#themes#spring#palette.replace = airline#themes#generate_color_map(s:RMain, s:RRight, s:RMiddle)
let g:airline#themes#spring#palette.replace.airline_warning = s:RWarn
let g:airline#themes#spring#palette.replace.airline_error = s:RError

let s:VMain = [s:spring1_gui, s:spring7_gui, s:spring1_term, s:spring7_term]
let s:VRight = [s:spring1_gui, s:spring9_gui, s:spring1_term, s:spring9_term]
let s:VMiddle = [s:spring5_gui, s:spring3_gui, s:spring5_term, s:spring3_term]
let s:VWarn = [s:spring1_gui, s:spring13_gui, s:spring3_term, s:spring13_term]
let s:VError = [s:spring0_gui, s:spring11_gui, s:spring1_term, s:spring11_term]
let g:airline#themes#spring#palette.visual = airline#themes#generate_color_map(s:VMain, s:VRight, s:VMiddle)
let g:airline#themes#spring#palette.visual.airline_warning = s:VWarn
let g:airline#themes#spring#palette.visual.airline_error = s:VError

let s:IAMain = [s:spring5_gui, s:spring3_gui, s:spring5_term, s:spring3_term]
let s:IARight = [s:spring5_gui, s:spring3_gui, s:spring5_term, s:spring3_term]
if g:spring_uniform_status_lines == 0
  let s:IAMiddle = [s:spring5_gui, s:spring1_gui, s:spring5_term, s:spring1_term]
else
  let s:IAMiddle = [s:spring5_gui, s:spring3_gui, s:spring5_term, s:spring3_term]
endif
let s:IAWarn = [s:spring1_gui, s:spring13_gui, s:spring3_term, s:spring13_term]
let s:IAError = [s:spring0_gui, s:spring11_gui, s:spring1_term, s:spring11_term]
let g:airline#themes#spring#palette.inactive = airline#themes#generate_color_map(s:IAMain, s:IARight, s:IAMiddle)
let g:airline#themes#spring#palette.inactive.airline_warning = s:IAWarn
let g:airline#themes#spring#palette.inactive.airline_error = s:IAError

let g:airline#themes#spring#palette.normal.airline_term = s:NMiddle
let g:airline#themes#spring#palette.insert.airline_term = s:IMiddle
let g:airline#themes#spring#palette.replace.airline_term = s:RMiddle
let g:airline#themes#spring#palette.visual.airline_term = s:VMiddle
let g:airline#themes#spring#palette.inactive.airline_term = s:IAMiddle
