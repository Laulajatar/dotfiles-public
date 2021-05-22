" Copyright (C) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
" Copyright (C) 2016-present Sven Greb <development@svengreb.de>

" Project: Nord Vim
" Repository: https://github.com/arcticicestudio/nord-vim
" License: MIT

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = "spring"
set background=dark

" background color
let s:spring0_gui = "#232732" 
" background of collapsed lines..? 
let s:spring1_gui = "#3F4551"
" inactive bg in small popup menus
let s:spring2_gui = "#4B5368"
" line numbers, text on collapsed lines
let s:spring3_gui = "#656E7F"
let s:spring3_gui_bright = "#616E88"
let s:spring4_gui = "#E1E5EE"
let s:spring5_gui = "#EBEEF5"
" html css attributes
let s:spring6_gui = "#99BFCC"
" a whole lot of css shit and the numbers in startify
let s:spring7_gui = "#A9C9D4"
" obl functions, html headline text 
let s:spring8_gui = "#99B3CC"
" html tags, headlines in startify, 
let s:spring9_gui = "#BED9A6"
let s:spring10_gui = "#CBE0B8"
" background of error messages? 
let s:spring11_gui = "#EDA992"
let s:spring12_gui = "#F6DDA2"
let s:spring13_gui = "#F4CA8B"
" obl and html strings
let s:spring14_gui = "#F6DEA2"
" css numbers
let s:spring15_gui = "#B7AFCF"

let s:spring1_term = "0"
let s:spring3_term = "8"
let s:spring5_term = "7"
let s:spring6_term = "15"
let s:spring7_term = "14"
let s:spring8_term = "6"
let s:spring9_term = "4"
let s:spring10_term = "12"
let s:spring11_term = "1"
let s:spring12_term = "11"
let s:spring13_term = "3"
let s:spring14_term = "2"
let s:spring15_term = "5"

let s:spring3_gui_brightened = [
  \ s:spring3_gui,
  \ "#4e586d",
  \ "#505b70",
  \ "#525d73",
  \ "#556076",
  \ "#576279",
  \ "#59647c",
  \ "#5b677f",
  \ "#5d6982",
  \ "#5f6c85",
  \ "#616e88",
  \ "#63718b",
  \ "#66738e",
  \ "#687591",
  \ "#6a7894",
  \ "#6d7a96",
  \ "#6f7d98",
  \ "#72809a",
  \ "#75829c",
  \ "#78859e",
  \ "#7b88a1",
\ ]

if !exists("g:spring_bold")
  let g:spring_bold = 1
endif

let s:bold = "bold,"
if g:spring_bold == 0
  let s:bold = ""
endif

if !exists("g:spring_italic")
  if has("gui_running") || $TERM_ITALICS == "true"
    let g:spring_italic = 1
  else  
    " ok fuck this, idk why, it works, so use it dammit
    let g:spring_italic = 1
  endif
endif

let s:italic = "italic,"
if g:spring_italic == 0
  let s:italic = ""
endif

let s:underline = "underline,"
if ! get(g:, "spring_underline", 1)
  let s:underline = "NONE,"
endif

let s:italicize_comments = ""
if exists("g:spring_italic_comments")
  if g:spring_italic_comments == 1
    let s:italicize_comments = s:italic
  endif
endif
" I don't know why settings aren't working so force it
let s:italicize_comments = s:italic

if !exists('g:spring_uniform_status_lines')
  let g:spring_uniform_status_lines = 0
endif

function! s:logWarning(msg)
  echohl WarningMsg
  echomsg 'spring: warning: ' . a:msg
  echohl None
endfunction

if exists("g:spring_comment_brightness")
  call s:logWarning('Variable g:spring_comment_brightness has been deprecated and will be removed in version 1.0.0!' .
                   \' The comment color brightness has been increased by 10% by default.' .
                   \' Please see https://github.com/arcticicestudio/spring-vim/issues/145 for more details.')
  let g:spring_comment_brightness = 10
endif

if !exists("g:spring_uniform_diff_background")
  let g:spring_uniform_diff_background = 0
endif

if !exists("g:spring_cursor_line_number_background")
  let g:spring_cursor_line_number_background = 0
endif

if !exists("g:spring_bold_vertical_split_line")
  let g:spring_bold_vertical_split_line = 0
endif

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . substitute(a:attr, "undercurl", s:underline, "")
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=" . a:guisp
  endif
endfunction

"+---------------+
"+ UI Components +
"+---------------+
"+--- Attributes ---+
call s:hi("Bold", "", "", "", "", s:bold, "")
call s:hi("Italic", "", "", "", "", s:italic, "")
call s:hi("Underline", "", "", "", "", s:underline, "")

"+--- Editor ---+
call s:hi("ColorColumn", "", s:spring1_gui, "NONE", s:spring1_term, "", "")
call s:hi("Cursor", s:spring0_gui, s:spring4_gui, "", "NONE", "", "")
call s:hi("CursorLine", "", s:spring1_gui, "NONE", s:spring1_term, "NONE", "")
call s:hi("Error", s:spring4_gui, s:spring11_gui, "", s:spring11_term, "", "")
call s:hi("iCursor", s:spring0_gui, s:spring4_gui, "", "NONE", "", "")
call s:hi("LineNr", s:spring3_gui, "NONE", s:spring3_term, "NONE", "", "")
call s:hi("MatchParen", s:spring8_gui, s:spring3_gui, s:spring8_term, s:spring3_term, "", "")
call s:hi("NonText", s:spring2_gui, "", s:spring3_term, "", "", "")
call s:hi("Normal", s:spring4_gui, s:spring0_gui, "NONE", "NONE", "", "")
call s:hi("PMenu", s:spring4_gui, s:spring2_gui, "NONE", s:spring1_term, "NONE", "")
call s:hi("PmenuSbar", s:spring4_gui, s:spring2_gui, "NONE", s:spring1_term, "", "")
call s:hi("PMenuSel", s:spring8_gui, s:spring3_gui, s:spring8_term, s:spring3_term, "", "")
call s:hi("PmenuThumb", s:spring8_gui, s:spring3_gui, "NONE", s:spring3_term, "", "")
call s:hi("SpecialKey", s:spring3_gui, "", s:spring3_term, "", "", "")
call s:hi("SpellBad", s:spring11_gui, s:spring0_gui, s:spring11_term, "NONE", "undercurl", s:spring11_gui)
call s:hi("SpellCap", s:spring13_gui, s:spring0_gui, s:spring13_term, "NONE", "undercurl", s:spring13_gui)
call s:hi("SpellLocal", s:spring5_gui, s:spring0_gui, s:spring5_term, "NONE", "undercurl", s:spring5_gui)
call s:hi("SpellRare", s:spring6_gui, s:spring0_gui, s:spring6_term, "NONE", "undercurl", s:spring6_gui)
call s:hi("Visual", "", s:spring2_gui, "", s:spring1_term, "", "")
call s:hi("VisualNOS", "", s:spring2_gui, "", s:spring1_term, "", "")
"+- Neovim Support -+
call s:hi("healthError", s:spring11_gui, s:spring1_gui, s:spring11_term, s:spring1_term, "", "")
call s:hi("healthSuccess", s:spring14_gui, s:spring1_gui, s:spring14_term, s:spring1_term, "", "")
call s:hi("healthWarning", s:spring13_gui, s:spring1_gui, s:spring13_term, s:spring1_term, "", "")
call s:hi("TermCursorNC", "", s:spring1_gui, "", s:spring1_term, "", "")

"+- Vim 8 Terminal Colors -+
if has('terminal')
  let g:terminal_ansi_colors = [s:spring1_gui, s:spring11_gui, s:spring14_gui, s:spring13_gui, s:spring9_gui, s:spring15_gui, s:spring8_gui, s:spring5_gui, s:spring3_gui, s:spring11_gui, s:spring14_gui, s:spring13_gui, s:spring9_gui, s:spring15_gui, s:spring7_gui, s:spring6_gui]
endif

"+- Neovim Terminal Colors -+
if has('nvim')
  let g:terminal_color_0 = s:spring0_gui
  let g:terminal_color_1 = s:spring1_gui
  let g:terminal_color_2 = s:spring2_gui
  let g:terminal_color_3 = s:spring3_gui
  let g:terminal_color_4 = s:spring4_gui
  let g:terminal_color_5 = s:spring5_gui
  let g:terminal_color_6 = s:spring6_gui
  let g:terminal_color_7 = s:spring7_gui
  let g:terminal_color_8 = s:spring8_gui
  let g:terminal_color_9 = s:spring9_gui
  let g:terminal_color_10 = s:spring10_gui
  let g:terminal_color_11 = s:spring11_gui
  let g:terminal_color_12 = s:spring12_gui
  let g:terminal_color_13 = s:spring13_gui
  let g:terminal_color_14 = s:spring14_gui
  let g:terminal_color_15 = s:spring15_gui
endif

"+--- Gutter ---+
call s:hi("CursorColumn", "", s:spring1_gui, "NONE", s:spring1_term, "", "")
if g:spring_cursor_line_number_background == 0
  call s:hi("CursorLineNr", s:spring4_gui, "", "NONE", "", "NONE", "")
else
  call s:hi("CursorLineNr", s:spring4_gui, s:spring1_gui, "NONE", s:spring1_term, "NONE", "")
endif
call s:hi("Folded", s:spring3_gui, s:spring1_gui, s:spring3_term, s:spring1_term, s:bold, "")
call s:hi("FoldColumn", s:spring3_gui, s:spring0_gui, s:spring3_term, "NONE", "", "")
call s:hi("SignColumn", s:spring1_gui, s:spring0_gui, s:spring1_term, "NONE", "", "")

"+--- Navigation ---+
call s:hi("Directory", s:spring8_gui, "", s:spring8_term, "NONE", "", "")

"+--- Prompt/Status ---+
call s:hi("EndOfBuffer", s:spring1_gui, "", s:spring1_term, "NONE", "", "")
call s:hi("ErrorMsg", s:spring4_gui, s:spring11_gui, "NONE", s:spring11_term, "", "")
call s:hi("ModeMsg", s:spring4_gui, "", "", "", "", "")
call s:hi("MoreMsg", s:spring8_gui, "", s:spring8_term, "", "", "")
call s:hi("Question", s:spring4_gui, "", "NONE", "", "", "")
if g:spring_uniform_status_lines == 0
  call s:hi("StatusLine", s:spring8_gui, s:spring3_gui, s:spring8_term, s:spring3_term, "NONE", "")
  call s:hi("StatusLineNC", s:spring4_gui, s:spring1_gui, "NONE", s:spring1_term, "NONE", "")
  call s:hi("StatusLineTerm", s:spring8_gui, s:spring3_gui, s:spring8_term, s:spring3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:spring4_gui, s:spring1_gui, "NONE", s:spring1_term, "NONE", "")
else
  call s:hi("StatusLine", s:spring8_gui, s:spring3_gui, s:spring8_term, s:spring3_term, "NONE", "")
  call s:hi("StatusLineNC", s:spring4_gui, s:spring3_gui, "NONE", s:spring3_term, "NONE", "")
  call s:hi("StatusLineTerm", s:spring8_gui, s:spring3_gui, s:spring8_term, s:spring3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:spring4_gui, s:spring3_gui, "NONE", s:spring3_term, "NONE", "")
endif
call s:hi("WarningMsg", s:spring0_gui, s:spring13_gui, s:spring1_term, s:spring13_term, "", "")
call s:hi("WildMenu", s:spring8_gui, s:spring1_gui, s:spring8_term, s:spring1_term, "", "")

"+--- Search ---+
call s:hi("IncSearch", s:spring6_gui, s:spring10_gui, s:spring6_term, s:spring10_term, s:underline, "")
call s:hi("Search", s:spring1_gui, s:spring8_gui, s:spring1_term, s:spring8_term, "NONE", "")

"+--- Tabs ---+
call s:hi("TabLine", s:spring4_gui, s:spring1_gui, "NONE", s:spring1_term, "NONE", "")
call s:hi("TabLineFill", s:spring4_gui, s:spring1_gui, "NONE", s:spring1_term, "NONE", "")
call s:hi("TabLineSel", s:spring8_gui, s:spring3_gui, s:spring8_term, s:spring3_term, "NONE", "")

"+--- Window ---+
call s:hi("Title", s:spring4_gui, "", "NONE", "", "NONE", "")

if g:spring_bold_vertical_split_line == 0
  call s:hi("VertSplit", s:spring2_gui, s:spring0_gui, s:spring3_term, "NONE", "NONE", "")
else
  call s:hi("VertSplit", s:spring2_gui, s:spring1_gui, s:spring3_term, s:spring1_term, "NONE", "")
endif

"+----------------------+
"+ Language Base Groups +
"+----------------------+
call s:hi("Boolean", s:spring9_gui, "", s:spring9_term, "", "", "")
call s:hi("Character", s:spring14_gui, "", s:spring14_term, "", "", "")
call s:hi("Comment", s:spring3_gui_bright, "", s:spring3_term, "", s:italicize_comments, "")
call s:hi("Conditional", s:spring9_gui, "", s:spring9_term, "", "", "")
call s:hi("Constant", s:spring4_gui, "", "NONE", "", "", "")
call s:hi("Define", s:spring9_gui, "", s:spring9_term, "", "", "")
call s:hi("Delimiter", s:spring6_gui, "", s:spring6_term, "", "", "")
call s:hi("Exception", s:spring9_gui, "", s:spring9_term, "", "", "")
call s:hi("Float", s:spring15_gui, "", s:spring15_term, "", "", "")
call s:hi("Function", s:spring13_gui, "", s:spring13_term, "", "", "")
call s:hi("Identifier", s:spring4_gui, "", "NONE", "", "NONE", "")
call s:hi("Include", s:spring9_gui, "", s:spring9_term, "", "", "")
call s:hi("Keyword", s:spring9_gui, "", s:spring9_term, "", "", "")
call s:hi("Label", s:spring9_gui, "", s:spring9_term, "", "", "")
call s:hi("Number", s:spring15_gui, "", s:spring15_term, "", "", "")
call s:hi("Operator", s:spring9_gui, "", s:spring9_term, "", "NONE", "")
call s:hi("PreProc", s:spring9_gui, "", s:spring9_term, "", "NONE", "")
call s:hi("Repeat", s:spring9_gui, "", s:spring9_term, "", "", "")
call s:hi("Special", s:spring4_gui, "", "NONE", "", "", "")
call s:hi("SpecialChar", s:spring13_gui, "", s:spring13_term, "", "", "")
call s:hi("SpecialComment", s:spring8_gui, "", s:spring8_term, "", s:italicize_comments, "")
call s:hi("Statement", s:spring9_gui, "", s:spring9_term, "", "", "")
call s:hi("StorageClass", s:spring9_gui, "", s:spring9_term, "", "", "")
call s:hi("String", s:spring14_gui, "", s:spring14_term, "", "", "")
call s:hi("Structure", s:spring9_gui, "", s:spring9_term, "", "", "")
call s:hi("Tag", s:spring4_gui, "", "", "", "", "")
call s:hi("Todo", s:spring13_gui, "NONE", s:spring13_term, "NONE", "", "")
call s:hi("Type", s:spring9_gui, "", s:spring9_term, "", "NONE", "")
call s:hi("Typedef", s:spring9_gui, "", s:spring9_term, "", "", "")
hi! link Macro Define
hi! link PreCondit PreProc


"+-----------+
"+ Languages +
"+-----------+
call s:hi("asciidocAttributeEntry", s:spring10_gui, "", s:spring10_term, "", "", "")
call s:hi("asciidocAttributeList", s:spring10_gui, "", s:spring10_term, "", "", "")
call s:hi("asciidocAttributeRef", s:spring10_gui, "", s:spring10_term, "", "", "")
call s:hi("asciidocHLabel", s:spring9_gui, "", s:spring9_term, "", "", "")
call s:hi("asciidocListingBlock", s:spring7_gui, "", s:spring7_term, "", "", "")
call s:hi("asciidocMacroAttributes", s:spring8_gui, "", s:spring8_term, "", "", "")
call s:hi("asciidocOneLineTitle", s:spring8_gui, "", s:spring8_term, "", "", "")
call s:hi("asciidocPassthroughBlock", s:spring9_gui, "", s:spring9_term, "", "", "")
call s:hi("asciidocQuotedMonospaced", s:spring7_gui, "", s:spring7_term, "", "", "")
call s:hi("asciidocTriplePlusPassthrough", s:spring7_gui, "", s:spring7_term, "", "", "")
hi! link asciidocAdmonition Keyword
hi! link asciidocAttributeRef markdownH1
hi! link asciidocBackslash Keyword
hi! link asciidocMacro Keyword
hi! link asciidocQuotedBold Bold
hi! link asciidocQuotedEmphasized Italic
hi! link asciidocQuotedMonospaced2 asciidocQuotedMonospaced
hi! link asciidocQuotedUnconstrainedBold asciidocQuotedBold
hi! link asciidocQuotedUnconstrainedEmphasized asciidocQuotedEmphasized
hi! link asciidocURL markdownLinkText

call s:hi("awkCharClass", s:spring7_gui, "", s:spring7_term, "", "", "")
call s:hi("awkPatterns", s:spring9_gui, "", s:spring9_term, "", s:bold, "")
hi! link awkArrayElement Identifier
hi! link awkBoolLogic Keyword
hi! link awkBrktRegExp SpecialChar
hi! link awkComma Delimiter
hi! link awkExpression Keyword
hi! link awkFieldVars Identifier
hi! link awkLineSkip Keyword
hi! link awkOperator Operator
hi! link awkRegExp SpecialChar
hi! link awkSearch Keyword
hi! link awkSemicolon Delimiter
hi! link awkSpecialCharacter SpecialChar
hi! link awkSpecialPrintf SpecialChar
hi! link awkVariables Identifier

call s:hi("cIncluded", s:spring7_gui, "", s:spring7_term, "", "", "")
hi! link cOperator Operator
hi! link cPreCondit PreCondit

call s:hi("cmakeGeneratorExpression", s:spring10_gui, "", s:spring10_term, "", "", "")

hi! link csPreCondit PreCondit
hi! link csType Type
hi! link csXmlTag SpecialComment

call s:hi("cssAttributeSelector", s:spring7_gui, "", s:spring7_term, "", "", "")
call s:hi("cssDefinition", s:spring14_gui, "", s:spring14_term, "", "NONE", "")
call s:hi("cssIdentifier", s:spring7_gui, "", s:spring7_term, "", s:underline, "")
call s:hi("cssStringQ", s:spring5_gui, "", s:spring5_term, "", "", "")
hi! link cssAttr Keyword
hi! link cssBraces Delimiter
hi! link cssClassName cssDefinition
hi! link cssColor Number
hi! link cssProp cssDefinition
hi! link cssPseudoClass cssDefinition
hi! link cssPseudoClassId cssPseudoClass
hi! link cssVendor Keyword

call s:hi("dosiniHeader", s:spring8_gui, "", s:spring8_term, "", "", "")
hi! link dosiniLabel Type

call s:hi("dtBooleanKey", s:spring7_gui, "", s:spring7_term, "", "", "")
call s:hi("dtExecKey", s:spring7_gui, "", s:spring7_term, "", "", "")
call s:hi("dtLocaleKey", s:spring7_gui, "", s:spring7_term, "", "", "")
call s:hi("dtNumericKey", s:spring7_gui, "", s:spring7_term, "", "", "")
call s:hi("dtTypeKey", s:spring7_gui, "", s:spring7_term, "", "", "")
hi! link dtDelim Delimiter
hi! link dtLocaleValue Keyword
hi! link dtTypeValue Keyword

if g:spring_uniform_diff_background == 0
  call s:hi("DiffAdd", s:spring14_gui, s:spring0_gui, s:spring14_term, "NONE", "inverse", "")
  call s:hi("DiffChange", s:spring13_gui, s:spring0_gui, s:spring13_term, "NONE", "inverse", "")
  call s:hi("DiffDelete", s:spring11_gui, s:spring0_gui, s:spring11_term, "NONE", "inverse", "")
  call s:hi("DiffText", s:spring9_gui, s:spring0_gui, s:spring9_term, "NONE", "inverse", "")
else
  call s:hi("DiffAdd", s:spring14_gui, s:spring1_gui, s:spring14_term, s:spring1_term, "", "")
  call s:hi("DiffChange", s:spring13_gui, s:spring1_gui, s:spring13_term, s:spring1_term, "", "")
  call s:hi("DiffDelete", s:spring11_gui, s:spring1_gui, s:spring11_term, s:spring1_term, "", "")
  call s:hi("DiffText", s:spring9_gui, s:spring1_gui, s:spring9_term, s:spring1_term, "", "")
endif
" Legacy groups for official git.vim and diff.vim syntax
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete

call s:hi("gitconfigVariable", s:spring7_gui, "", s:spring7_term, "", "", "")

call s:hi("goBuiltins", s:spring7_gui, "", s:spring7_term, "", "", "")
hi! link goConstants Keyword

call s:hi("helpBar", s:spring3_gui, "", s:spring3_term, "", "", "")
call s:hi("helpHyperTextJump", s:spring8_gui, "", s:spring8_term, "", s:underline, "")

call s:hi("htmlArg", s:spring7_gui, "", s:spring7_term, "", "", "")
call s:hi("htmlLink", s:spring4_gui, "", "", "", "NONE", "NONE")
hi! link htmlBold Bold
hi! link htmlEndTag htmlTag
hi! link htmlItalic Italic
hi! link htmlH1 markdownH1
hi! link htmlH2 markdownH1
hi! link htmlH3 markdownH1
hi! link htmlH4 markdownH1
hi! link htmlH5 markdownH1
hi! link htmlH6 markdownH1
hi! link htmlSpecialChar SpecialChar
hi! link htmlTag Keyword
hi! link htmlTagN htmlTag

call s:hi("javaDocTags", s:spring7_gui, "", s:spring7_term, "", "", "")
hi! link javaCommentTitle Comment
hi! link javaScriptBraces Delimiter
hi! link javaScriptIdentifier Keyword
hi! link javaScriptNumber Number

call s:hi("jsonKeyword", s:spring7_gui, "", s:spring7_term, "", "", "")

call s:hi("lessClass", s:spring7_gui, "", s:spring7_term, "", "", "")
hi! link lessAmpersand Keyword
hi! link lessCssAttribute Delimiter
hi! link lessFunction Function
hi! link cssSelectorOp Keyword

hi! link lispAtomBarSymbol SpecialChar
hi! link lispAtomList SpecialChar
hi! link lispAtomMark Keyword
hi! link lispBarSymbol SpecialChar
hi! link lispFunc Function

hi! link luaFunc Function

call s:hi("markdownBlockquote", s:spring7_gui, "", s:spring7_term, "", "", "")
call s:hi("markdownCode", s:spring7_gui, "", s:spring7_term, "", "", "")
call s:hi("markdownCodeDelimiter", s:spring7_gui, "", s:spring7_term, "", "", "")
call s:hi("markdownFootnote", s:spring7_gui, "", s:spring7_term, "", "", "")
call s:hi("markdownId", s:spring7_gui, "", s:spring7_term, "", "", "")
call s:hi("markdownIdDeclaration", s:spring7_gui, "", s:spring7_term, "", "", "")
call s:hi("markdownH1", s:spring8_gui, "", s:spring8_term, "", "", "")
call s:hi("markdownLinkText", s:spring8_gui, "", s:spring8_term, "", "", "")
call s:hi("markdownUrl", s:spring4_gui, "", "NONE", "", "NONE", "")
hi! link markdownBold Bold
hi! link markdownBoldDelimiter Keyword
hi! link markdownFootnoteDefinition markdownFootnote
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownH6 markdownH1
hi! link markdownIdDelimiter Keyword
hi! link markdownItalic Italic
hi! link markdownItalicDelimiter Keyword
hi! link markdownLinkDelimiter Keyword
hi! link markdownLinkTextDelimiter Keyword
hi! link markdownListMarker Keyword
hi! link markdownRule Keyword
hi! link markdownHeadingDelimiter Keyword

call s:hi("perlPackageDecl", s:spring7_gui, "", s:spring7_term, "", "", "")

call s:hi("phpClasses", s:spring7_gui, "", s:spring7_term, "", "", "")
call s:hi("phpClass", s:spring7_gui, "", s:spring7_term, "", "", "")
call s:hi("phpDocTags", s:spring7_gui, "", s:spring7_term, "", "", "")
hi! link phpDocCustomTags phpDocTags
hi! link phpMemberSelector Keyword
hi! link phpMethod Function
hi! link phpFunction Function

call s:hi("podCmdText", s:spring7_gui, "", s:spring7_term, "", "", "")
call s:hi("podVerbatimLine", s:spring4_gui, "", "NONE", "", "", "")
hi! link podFormat Keyword

hi! link pythonBuiltin Type
hi! link pythonEscape SpecialChar

call s:hi("rubyConstant", s:spring7_gui, "", s:spring7_term, "", "", "")
call s:hi("rubySymbol", s:spring6_gui, "", s:spring6_term, "", s:bold, "")
hi! link rubyAttribute Identifier
hi! link rubyBlockParameterList Operator
hi! link rubyInterpolationDelimiter Keyword
hi! link rubyKeywordAsMethod Function
hi! link rubyLocalVariableOrMethod Function
hi! link rubyPseudoVariable Keyword
hi! link rubyRegexp SpecialChar

call s:hi("rustAttribute", s:spring10_gui, "", s:spring10_term, "", "", "")
call s:hi("rustEnum", s:spring7_gui, "", s:spring7_term, "", s:bold, "")
call s:hi("rustMacro", s:spring8_gui, "", s:spring8_term, "", s:bold, "")
call s:hi("rustModPath", s:spring7_gui, "", s:spring7_term, "", "", "")
call s:hi("rustPanic", s:spring9_gui, "", s:spring9_term, "", s:bold, "")
call s:hi("rustTrait", s:spring7_gui, "", s:spring7_term, "", s:italic, "")
hi! link rustCommentLineDoc Comment
hi! link rustDerive rustAttribute
hi! link rustEnumVariant rustEnum
hi! link rustEscape SpecialChar
hi! link rustQuestionMark Keyword

call s:hi("sassClass", s:spring7_gui, "", s:spring7_term, "", "", "")
call s:hi("sassId", s:spring7_gui, "", s:spring7_term, "", s:underline, "")
hi! link sassAmpersand Keyword
hi! link sassClassChar Delimiter
hi! link sassControl Keyword
hi! link sassControlLine Keyword
hi! link sassExtend Keyword
hi! link sassFor Keyword
hi! link sassFunctionDecl Keyword
hi! link sassFunctionName Function
hi! link sassidChar sassId
hi! link sassInclude SpecialChar
hi! link sassMixinName Function
hi! link sassMixing SpecialChar
hi! link sassReturn Keyword

hi! link shCmdParenRegion Delimiter
hi! link shCmdSubRegion Delimiter
hi! link shDerefSimple Identifier
hi! link shDerefVar Identifier

hi! link sqlKeyword Keyword
hi! link sqlSpecial Keyword

call s:hi("vimAugroup", s:spring7_gui, "", s:spring7_term, "", "", "")
call s:hi("vimMapRhs", s:spring7_gui, "", s:spring7_term, "", "", "")
call s:hi("vimNotation", s:spring7_gui, "", s:spring7_term, "", "", "")
hi! link vimFunc Function
hi! link vimFunction Function
hi! link vimUserFunc Function

call s:hi("xmlAttrib", s:spring7_gui, "", s:spring7_term, "", "", "")
call s:hi("xmlCdataStart", s:spring3_gui_bright, "", s:spring3_term, "", s:bold, "")
call s:hi("xmlNamespace", s:spring7_gui, "", s:spring7_term, "", "", "")
hi! link xmlAttribPunct Delimiter
hi! link xmlCdata Comment
hi! link xmlCdataCdata xmlCdataStart
hi! link xmlCdataEnd xmlCdataStart
hi! link xmlEndTag xmlTagName
hi! link xmlProcessingDelim Keyword
hi! link xmlTagName Keyword

call s:hi("yamlBlockMappingKey", s:spring7_gui, "", s:spring7_term, "", "", "")
hi! link yamlBool Keyword
hi! link yamlDocumentStart Keyword

"+----------------+
"+ Plugin Support +
"+----------------+
"+--- UI ---+
" ALE
" > w0rp/ale
call s:hi("ALEWarningSign", s:spring13_gui, "", s:spring13_term, "", "", "")
call s:hi("ALEErrorSign" , s:spring11_gui, "", s:spring11_term, "", "", "")
call s:hi("ALEWarning" , s:spring13_gui, "", s:spring13_term, "", "undercurl", "")
call s:hi("ALEError" , s:spring11_gui, "", s:spring11_term, "", "undercurl", "")

" Coc
" > neoclide/coc
call s:hi("CocWarningHighlight" , s:spring13_gui, "", s:spring13_term, "", "undercurl", "")
call s:hi("CocErrorHighlight" , s:spring11_gui, "", s:spring11_term, "", "undercurl", "")
call s:hi("CocWarningSign", s:spring13_gui, "", s:spring13_term, "", "", "")
call s:hi("CocErrorSign" , s:spring11_gui, "", s:spring11_term, "", "", "")
call s:hi("CocInfoSign" , s:spring8_gui, "", s:spring8_term, "", "", "")
call s:hi("CocHintSign" , s:spring10_gui, "", s:spring10_term, "", "", "")

" Nvim LSP
" > neovim/nvim-lsp
call s:hi("LSPDiagnosticsWarning", s:spring13_gui, "", s:spring13_term, "", "", "")
call s:hi("LSPDiagnosticsError" , s:spring11_gui, "", s:spring11_term, "", "", "")
call s:hi("LSPDiagnosticsInformation" , s:spring8_gui, "", s:spring8_term, "", "", "")
call s:hi("LSPDiagnosticsHint" , s:spring10_gui, "", s:spring10_term, "", "", "")

" GitGutter
" > airblade/vim-gitgutter
call s:hi("GitGutterAdd", s:spring14_gui, "", s:spring14_term, "", "", "")
call s:hi("GitGutterChange", s:spring13_gui, "", s:spring13_term, "", "", "")
call s:hi("GitGutterChangeDelete", s:spring11_gui, "", s:spring11_term, "", "", "")
call s:hi("GitGutterDelete", s:spring11_gui, "", s:spring11_term, "", "", "")

" Signify
" > mhinz/vim-signify
call s:hi("SignifySignAdd", s:spring14_gui, "", s:spring14_term, "", "", "")
call s:hi("SignifySignChange", s:spring13_gui, "", s:spring13_term, "", "", "")
call s:hi("SignifySignChangeDelete", s:spring11_gui, "", s:spring11_term, "", "", "")
call s:hi("SignifySignDelete", s:spring11_gui, "", s:spring11_term, "", "", "")

" fugitive.vim
" > tpope/vim-fugitive
call s:hi("gitcommitDiscardedFile", s:spring11_gui, "", s:spring11_term, "", "", "")
call s:hi("gitcommitUntrackedFile", s:spring11_gui, "", s:spring11_term, "", "", "")
call s:hi("gitcommitSelectedFile", s:spring14_gui, "", s:spring14_term, "", "", "")

" davidhalter/jedi-vim
call s:hi("jediFunction", s:spring4_gui, s:spring3_gui, "", s:spring3_term, "", "")
call s:hi("jediFat", s:spring8_gui, s:spring3_gui, s:spring8_term, s:spring3_term, s:underline.s:bold, "")

" NERDTree
" > scrooloose/nerdtree
call s:hi("NERDTreeExecFile", s:spring7_gui, "", s:spring7_term, "", "", "")
hi! link NERDTreeDirSlash Keyword
hi! link NERDTreeHelp Comment

" CtrlP
" > ctrlpvim/ctrlp.vim
hi! link CtrlPMatch Keyword
hi! link CtrlPBufferHid Normal

" vim-clap
" > liuchengxu/vim-clap
call s:hi("ClapDir", s:spring4_gui, "", "", "", "", "")
call s:hi("ClapDisplay", s:spring4_gui, s:spring1_gui, "", s:spring1_term, "", "")
call s:hi("ClapFile", s:spring4_gui, "", "", "NONE", "", "")
call s:hi("ClapMatches", s:spring8_gui, "", s:spring8_term, "", "", "")
call s:hi("ClapNoMatchesFound", s:spring13_gui, "", s:spring13_term, "", "", "")
call s:hi("ClapSelected", s:spring7_gui, "", s:spring7_term, "", s:bold, "")
call s:hi("ClapSelectedSign", s:spring9_gui, "", s:spring9_term, "", "", "")

let s:clap_matches = [
        \ [s:spring8_gui,  s:spring8_term] ,
        \ [s:spring9_gui,  s:spring9_term] ,
        \ [s:spring10_gui, s:spring10_term] ,
        \ ]
for s:spring_clap_match_i in range(1,12)
  let clap_match_color = s:clap_matches[s:spring_clap_match_i % len(s:clap_matches) - 1]
  call s:hi("ClapMatches" . s:spring_clap_match_i, clap_match_color[0], "", clap_match_color[1], "", "", "")
  call s:hi("ClapFuzzyMatches" . s:spring_clap_match_i, clap_match_color[0], "", clap_match_color[1], "", "", "")
endfor
unlet s:spring_clap_match_i

hi! link ClapCurrentSelection PmenuSel
hi! link ClapCurrentSelectionSign ClapSelectedSign
hi! link ClapInput Pmenu
hi! link ClapPreview Pmenu
hi! link ClapProviderAbout ClapDisplay
hi! link ClapProviderColon Type
hi! link ClapProviderId Type

" vim-indent-guides
" > nathanaelkane/vim-indent-guides
call s:hi("IndentGuidesEven", "", s:spring1_gui, "", s:spring1_term, "", "")
call s:hi("IndentGuidesOdd", "", s:spring2_gui, "", s:spring3_term, "", "")

" vim-plug
" > junegunn/vim-plug
call s:hi("plugDeleted", s:spring11_gui, "", "", s:spring11_term, "", "")

" vim-signature
" > kshenoy/vim-signature
call s:hi("SignatureMarkText", s:spring8_gui, "", s:spring8_term, "", "", "")

" vim-startify
" > mhinz/vim-startify
call s:hi("StartifyFile", s:spring5_gui, "", s:spring6_term, "", s:bold, "")
" call s:hi("StartifyFooter", s:spring7_gui, "", s:spring7_term, "", "", "")
" call s:hi("StartifySpecial", s:spring7_gui, "", s:spring7_term, "", "", "")
call s:hi("StartifyHeader", s:spring7_gui, "", s:spring7_term, "", s:bold, "")
call s:hi("StartifyBracket", s:spring8_gui, "", s:spring8_term, "", "", "")
call s:hi("StartifySection", s:spring5_gui, "", s:spring5_term, "", s:bold, "")
call s:hi("StartifyNumber", s:spring13_gui, "", s:spring13_term, "", "", "")
call s:hi("StartifyPath", s:spring8_gui, "", s:spring8_term, "", "", "")
" hi! link StartifyBracket Delimiter
" hi! link StartifySlash Normal
" hi! link StartifySpecial Comment

"+--- Languages ---+
" Haskell
" > neovimhaskell/haskell-vim
call s:hi("haskellPreProc", s:spring10_gui, "", s:spring10_term, "", "", "")
call s:hi("haskellType", s:spring7_gui, "", s:spring7_term, "", "", "")
hi! link haskellPragma haskellPreProc

" JavaScript
" > pangloss/vim-javascript
call s:hi("jsGlobalNodeObjects", s:spring8_gui, "", s:spring8_term, "", s:italic, "")
hi! link jsBrackets Delimiter
hi! link jsFuncCall Function
hi! link jsFuncParens Delimiter
hi! link jsThis Keyword
hi! link jsNoise Delimiter
hi! link jsPrototype Keyword
hi! link jsRegexpString SpecialChar

" TypeScript
" > HerringtonDarkholme/yats.vim
call s:hi("typescriptBOMWindowMethod", s:spring8_gui, "", s:spring8_term, "", s:italic, "")
call s:hi("typescriptClassName", s:spring7_gui, "", s:spring7_term, "", "", "")
call s:hi("typescriptDecorator", s:spring12_gui, "", s:spring12_term, "", "", "")
call s:hi("typescriptInterfaceName", s:spring7_gui, "", s:spring7_term, "", s:bold, "")
call s:hi("typescriptRegexpString", s:spring13_gui, "", s:spring13_term, "", "", "")
" TypeScript JSX
 call s:hi("tsxAttrib", s:spring7_gui, "", s:spring7_term, "", "", "")
hi! link typescriptOperator Operator
hi! link typescriptBinaryOp Operator
hi! link typescriptAssign Operator
hi! link typescriptMember Identifier
hi! link typescriptDOMStorageMethod Identifier
hi! link typescriptArrowFuncArg Identifier
hi! link typescriptGlobal typescriptClassName
hi! link typescriptBOMWindowProp Function
hi! link typescriptArrowFuncDef Function
hi! link typescriptAliasDeclaration Function
hi! link typescriptPredefinedType Type
hi! link typescriptTypeReference typescriptClassName
hi! link typescriptTypeAnnotation Structure
hi! link typescriptDocNamedParamType SpecialComment
hi! link typescriptDocNotation Keyword
hi! link typescriptDocTags Keyword
hi! link typescriptImport Keyword
hi! link typescriptExport Keyword
hi! link typescriptTry Keyword
hi! link typescriptVariable Keyword
hi! link typescriptBraces Normal
hi! link typescriptObjectLabel Normal
hi! link typescriptCall Normal
hi! link typescriptClassHeritage typescriptClassName
hi! link typescriptFuncTypeArrow Structure
hi! link typescriptMemberOptionality Structure
hi! link typescriptNodeGlobal typescriptGlobal
hi! link typescriptTypeBrackets Structure
hi! link tsxEqual Operator
hi! link tsxIntrinsicTagName htmlTag
hi! link tsxTagName tsxIntrinsicTagName

" Markdown
" > plasticboy/vim-markdown
call s:hi("mkdCode", s:spring7_gui, "", s:spring7_term, "", "", "")
call s:hi("mkdFootnote", s:spring8_gui, "", s:spring8_term, "", "", "")
call s:hi("mkdRule", s:spring10_gui, "", s:spring10_term, "", "", "")
call s:hi("mkdLineBreak", s:spring9_gui, "", s:spring9_term, "", "", "")
hi! link mkdBold Bold
hi! link mkdItalic Italic
hi! link mkdString Keyword
hi! link mkdCodeStart mkdCode
hi! link mkdCodeEnd mkdCode
hi! link mkdBlockquote Comment
hi! link mkdListItem Keyword
hi! link mkdListItemLine Normal
hi! link mkdFootnotes mkdFootnote
hi! link mkdLink markdownLinkText
hi! link mkdURL markdownUrl
hi! link mkdInlineURL mkdURL
hi! link mkdID Identifier
hi! link mkdLinkDef mkdLink
hi! link mkdLinkDefTarget mkdURL
hi! link mkdLinkTitle mkdInlineURL
hi! link mkdDelimiter Keyword

" Vimwiki
" > vimwiki/vimwiki
if !exists("g:vimwiki_hl_headers") || g:vimwiki_hl_headers == 0
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, s:spring8_gui, "", s:spring8_term, "", s:bold, "")
  endfor
else
  let s:vimwiki_hcolor_guifg = [s:spring7_gui, s:spring8_gui, s:spring9_gui, s:spring10_gui, s:spring14_gui, s:spring15_gui]
  let s:vimwiki_hcolor_ctermfg = [s:spring7_term, s:spring8_term, s:spring9_term, s:spring10_term, s:spring14_term, s:spring15_term]
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, s:vimwiki_hcolor_guifg[s:i-1] , "", s:vimwiki_hcolor_ctermfg[s:i-1], "", s:bold, "")
  endfor
endif

call s:hi("VimwikiLink", s:spring8_gui, "", s:spring8_term, "", s:underline, "")
hi! link VimwikiHeaderChar markdownHeadingDelimiter
hi! link VimwikiHR Keyword
hi! link VimwikiList markdownListMarker

" YAML
" > stephpy/vim-yaml
call s:hi("yamlKey", s:spring7_gui, "", s:spring7_term, "", "", "")


" Obli-Vim
" > katawful/Obli-Vim
call s:hi("obseStatement", s:spring6_gui, "", s:spring6_term, "", s:bold, "")
call s:hi("obseString", s:spring5_gui, "", s:spring5_term, "", s:bold, "")
call s:hi("obseRepeat", s:spring10_gui, "", s:spring10_term, "", s:bold, "")
call s:hi("obseCondition", s:spring10_gui, "", s:spring10_term, "", s:bold, "")
call s:hi("obseBlock", s:spring12_gui, "", s:spring12_term, "", s:bold, "")
call s:hi("obseBlockType", s:spring9_gui, "", s:spring9_term, "", s:bold, "")
call s:hi("obseTypes", s:spring5_gui, "", s:spring5_term, "", "", "")
call s:hi("obseScriptNameRegion", s:spring14_gui, "", s:spring14_term, "", "", "")
hi! link obseStringFormatting Number
