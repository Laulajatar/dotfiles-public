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

let g:colors_name = "wheat"
let s:wheat_vim_version="0.15.0"
set background=dark

" background color
let s:wheat0_gui = "#232732" 
" background of collapsed lines..? 
let s:wheat1_gui = "#3F4551"
" inactive bg in small popup menus
let s:wheat2_gui = "#4B5368"
" line numbers, text on collapsed lines
let s:wheat3_gui = "#656E7F"
let s:wheat3_gui_bright = "#616E88"
let s:wheat4_gui = "#E1E5EE"
let s:wheat5_gui = "#EBEEF5"
" html css attributes
let s:wheat6_gui = "#99BFCC"
" a whole lot of css shit and the numbers in startify
let s:wheat7_gui = "#A9C9D4"
" obl functions, html headline text 
let s:wheat8_gui = "#99B3CC"
" html tags, headlines in startify, 
let s:wheat9_gui = "#AABFD4"
let s:wheat10_gui = "#F3CA8A"
" background of error messages? 
let s:wheat11_gui = "#BF616A"
let s:wheat12_gui = "#F6D5A2"
let s:wheat13_gui = "#F4D48B"
" obl and html strings
let s:wheat14_gui = "#F6DEA2"
" css numbers
let s:wheat15_gui = "#BB9B90"

let s:wheat1_term = "0"
let s:wheat3_term = "8"
let s:wheat5_term = "7"
let s:wheat6_term = "15"
let s:wheat7_term = "14"
let s:wheat8_term = "6"
let s:wheat9_term = "4"
let s:wheat10_term = "12"
let s:wheat11_term = "1"
let s:wheat12_term = "11"
let s:wheat13_term = "3"
let s:wheat14_term = "2"
let s:wheat15_term = "5"

let s:wheat3_gui_brightened = [
  \ s:wheat3_gui,
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

if !exists("g:wheat_bold")
  let g:wheat_bold = 1
endif

let s:bold = "bold,"
if g:wheat_bold == 0
  let s:bold = ""
endif

if !exists("g:wheat_italic")
  if has("gui_running") || $TERM_ITALICS == "true"
    let g:wheat_italic = 1
  else  
    " ok fuck this, idk why, it works, so use it dammit
    let g:wheat_italic = 1
  endif
endif

let s:italic = "italic,"
if g:wheat_italic == 0
  let s:italic = ""
endif

let s:underline = "underline,"
if ! get(g:, "wheat_underline", 1)
  let s:underline = "NONE,"
endif

let s:italicize_comments = ""
if exists("g:wheat_italic_comments")
  if g:wheat_italic_comments == 1
    let s:italicize_comments = s:italic
  endif
endif
" I don't know why settings aren't working so force it
let s:italicize_comments = s:italic

if !exists('g:wheat_uniform_status_lines')
  let g:wheat_uniform_status_lines = 0
endif

function! s:logWarning(msg)
  echohl WarningMsg
  echomsg 'wheat: warning: ' . a:msg
  echohl None
endfunction

if exists("g:wheat_comment_brightness")
  call s:logWarning('Variable g:wheat_comment_brightness has been deprecated and will be removed in version 1.0.0!' .
                   \' The comment color brightness has been increased by 10% by default.' .
                   \' Please see https://github.com/arcticicestudio/wheat-vim/issues/145 for more details.')
  let g:wheat_comment_brightness = 10
endif

if !exists("g:wheat_uniform_diff_background")
  let g:wheat_uniform_diff_background = 0
endif

if !exists("g:wheat_cursor_line_number_background")
  let g:wheat_cursor_line_number_background = 0
endif

if !exists("g:wheat_bold_vertical_split_line")
  let g:wheat_bold_vertical_split_line = 0
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
call s:hi("ColorColumn", "", s:wheat1_gui, "NONE", s:wheat1_term, "", "")
call s:hi("Cursor", s:wheat0_gui, s:wheat4_gui, "", "NONE", "", "")
call s:hi("CursorLine", "", s:wheat1_gui, "NONE", s:wheat1_term, "NONE", "")
call s:hi("Error", s:wheat4_gui, s:wheat11_gui, "", s:wheat11_term, "", "")
call s:hi("iCursor", s:wheat0_gui, s:wheat4_gui, "", "NONE", "", "")
call s:hi("LineNr", s:wheat3_gui, "NONE", s:wheat3_term, "NONE", "", "")
call s:hi("MatchParen", s:wheat8_gui, s:wheat3_gui, s:wheat8_term, s:wheat3_term, "", "")
call s:hi("NonText", s:wheat2_gui, "", s:wheat3_term, "", "", "")
call s:hi("Normal", s:wheat4_gui, s:wheat0_gui, "NONE", "NONE", "", "")
call s:hi("PMenu", s:wheat4_gui, s:wheat2_gui, "NONE", s:wheat1_term, "NONE", "")
call s:hi("PmenuSbar", s:wheat4_gui, s:wheat2_gui, "NONE", s:wheat1_term, "", "")
call s:hi("PMenuSel", s:wheat8_gui, s:wheat3_gui, s:wheat8_term, s:wheat3_term, "", "")
call s:hi("PmenuThumb", s:wheat8_gui, s:wheat3_gui, "NONE", s:wheat3_term, "", "")
call s:hi("SpecialKey", s:wheat3_gui, "", s:wheat3_term, "", "", "")
call s:hi("SpellBad", s:wheat11_gui, s:wheat0_gui, s:wheat11_term, "NONE", "undercurl", s:wheat11_gui)
call s:hi("SpellCap", s:wheat13_gui, s:wheat0_gui, s:wheat13_term, "NONE", "undercurl", s:wheat13_gui)
call s:hi("SpellLocal", s:wheat5_gui, s:wheat0_gui, s:wheat5_term, "NONE", "undercurl", s:wheat5_gui)
call s:hi("SpellRare", s:wheat6_gui, s:wheat0_gui, s:wheat6_term, "NONE", "undercurl", s:wheat6_gui)
call s:hi("Visual", "", s:wheat2_gui, "", s:wheat1_term, "", "")
call s:hi("VisualNOS", "", s:wheat2_gui, "", s:wheat1_term, "", "")
"+- Neovim Support -+
call s:hi("healthError", s:wheat11_gui, s:wheat1_gui, s:wheat11_term, s:wheat1_term, "", "")
call s:hi("healthSuccess", s:wheat14_gui, s:wheat1_gui, s:wheat14_term, s:wheat1_term, "", "")
call s:hi("healthWarning", s:wheat13_gui, s:wheat1_gui, s:wheat13_term, s:wheat1_term, "", "")
call s:hi("TermCursorNC", "", s:wheat1_gui, "", s:wheat1_term, "", "")

"+- Vim 8 Terminal Colors -+
if has('terminal')
  let g:terminal_ansi_colors = [s:wheat1_gui, s:wheat11_gui, s:wheat14_gui, s:wheat13_gui, s:wheat9_gui, s:wheat15_gui, s:wheat8_gui, s:wheat5_gui, s:wheat3_gui, s:wheat11_gui, s:wheat14_gui, s:wheat13_gui, s:wheat9_gui, s:wheat15_gui, s:wheat7_gui, s:wheat6_gui]
endif

"+- Neovim Terminal Colors -+
if has('nvim')
  let g:terminal_color_0 = s:wheat0_gui
  let g:terminal_color_1 = s:wheat1_gui
  let g:terminal_color_2 = s:wheat2_gui
  let g:terminal_color_3 = s:wheat3_gui
  let g:terminal_color_4 = s:wheat4_gui
  let g:terminal_color_5 = s:wheat5_gui
  let g:terminal_color_6 = s:wheat6_gui
  let g:terminal_color_7 = s:wheat7_gui
  let g:terminal_color_8 = s:wheat8_gui
  let g:terminal_color_9 = s:wheat9_gui
  let g:terminal_color_10 = s:wheat10_gui
  let g:terminal_color_11 = s:wheat11_gui
  let g:terminal_color_12 = s:wheat12_gui
  let g:terminal_color_13 = s:wheat13_gui
  let g:terminal_color_14 = s:wheat14_gui
  let g:terminal_color_15 = s:wheat15_gui
endif

"+--- Gutter ---+
call s:hi("CursorColumn", "", s:wheat1_gui, "NONE", s:wheat1_term, "", "")
if g:wheat_cursor_line_number_background == 0
  call s:hi("CursorLineNr", s:wheat4_gui, "", "NONE", "", "NONE", "")
else
  call s:hi("CursorLineNr", s:wheat4_gui, s:wheat1_gui, "NONE", s:wheat1_term, "NONE", "")
endif
call s:hi("Folded", s:wheat3_gui, s:wheat1_gui, s:wheat3_term, s:wheat1_term, s:bold, "")
call s:hi("FoldColumn", s:wheat3_gui, s:wheat0_gui, s:wheat3_term, "NONE", "", "")
call s:hi("SignColumn", s:wheat1_gui, s:wheat0_gui, s:wheat1_term, "NONE", "", "")

"+--- Navigation ---+
call s:hi("Directory", s:wheat8_gui, "", s:wheat8_term, "NONE", "", "")

"+--- Prompt/Status ---+
call s:hi("EndOfBuffer", s:wheat1_gui, "", s:wheat1_term, "NONE", "", "")
call s:hi("ErrorMsg", s:wheat4_gui, s:wheat11_gui, "NONE", s:wheat11_term, "", "")
call s:hi("ModeMsg", s:wheat4_gui, "", "", "", "", "")
call s:hi("MoreMsg", s:wheat8_gui, "", s:wheat8_term, "", "", "")
call s:hi("Question", s:wheat4_gui, "", "NONE", "", "", "")
if g:wheat_uniform_status_lines == 0
  call s:hi("StatusLine", s:wheat8_gui, s:wheat3_gui, s:wheat8_term, s:wheat3_term, "NONE", "")
  call s:hi("StatusLineNC", s:wheat4_gui, s:wheat1_gui, "NONE", s:wheat1_term, "NONE", "")
  call s:hi("StatusLineTerm", s:wheat8_gui, s:wheat3_gui, s:wheat8_term, s:wheat3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:wheat4_gui, s:wheat1_gui, "NONE", s:wheat1_term, "NONE", "")
else
  call s:hi("StatusLine", s:wheat8_gui, s:wheat3_gui, s:wheat8_term, s:wheat3_term, "NONE", "")
  call s:hi("StatusLineNC", s:wheat4_gui, s:wheat3_gui, "NONE", s:wheat3_term, "NONE", "")
  call s:hi("StatusLineTerm", s:wheat8_gui, s:wheat3_gui, s:wheat8_term, s:wheat3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:wheat4_gui, s:wheat3_gui, "NONE", s:wheat3_term, "NONE", "")
endif
call s:hi("WarningMsg", s:wheat0_gui, s:wheat13_gui, s:wheat1_term, s:wheat13_term, "", "")
call s:hi("WildMenu", s:wheat8_gui, s:wheat1_gui, s:wheat8_term, s:wheat1_term, "", "")

"+--- Search ---+
call s:hi("IncSearch", s:wheat6_gui, s:wheat10_gui, s:wheat6_term, s:wheat10_term, s:underline, "")
call s:hi("Search", s:wheat1_gui, s:wheat8_gui, s:wheat1_term, s:wheat8_term, "NONE", "")

"+--- Tabs ---+
call s:hi("TabLine", s:wheat4_gui, s:wheat1_gui, "NONE", s:wheat1_term, "NONE", "")
call s:hi("TabLineFill", s:wheat4_gui, s:wheat1_gui, "NONE", s:wheat1_term, "NONE", "")
call s:hi("TabLineSel", s:wheat8_gui, s:wheat3_gui, s:wheat8_term, s:wheat3_term, "NONE", "")

"+--- Window ---+
call s:hi("Title", s:wheat4_gui, "", "NONE", "", "NONE", "")

if g:wheat_bold_vertical_split_line == 0
  call s:hi("VertSplit", s:wheat2_gui, s:wheat0_gui, s:wheat3_term, "NONE", "NONE", "")
else
  call s:hi("VertSplit", s:wheat2_gui, s:wheat1_gui, s:wheat3_term, s:wheat1_term, "NONE", "")
endif

"+----------------------+
"+ Language Base Groups +
"+----------------------+
call s:hi("Boolean", s:wheat9_gui, "", s:wheat9_term, "", "", "")
call s:hi("Character", s:wheat14_gui, "", s:wheat14_term, "", "", "")
call s:hi("Comment", s:wheat3_gui_bright, "", s:wheat3_term, "", s:italicize_comments, "")
call s:hi("Conditional", s:wheat9_gui, "", s:wheat9_term, "", "", "")
call s:hi("Constant", s:wheat4_gui, "", "NONE", "", "", "")
call s:hi("Define", s:wheat9_gui, "", s:wheat9_term, "", "", "")
call s:hi("Delimiter", s:wheat6_gui, "", s:wheat6_term, "", "", "")
call s:hi("Exception", s:wheat9_gui, "", s:wheat9_term, "", "", "")
call s:hi("Float", s:wheat15_gui, "", s:wheat15_term, "", "", "")
call s:hi("Function", s:wheat13_gui, "", s:wheat13_term, "", "", "")
call s:hi("Identifier", s:wheat4_gui, "", "NONE", "", "NONE", "")
call s:hi("Include", s:wheat9_gui, "", s:wheat9_term, "", "", "")
call s:hi("Keyword", s:wheat9_gui, "", s:wheat9_term, "", "", "")
call s:hi("Label", s:wheat9_gui, "", s:wheat9_term, "", "", "")
call s:hi("Number", s:wheat15_gui, "", s:wheat15_term, "", "", "")
call s:hi("Operator", s:wheat9_gui, "", s:wheat9_term, "", "NONE", "")
call s:hi("PreProc", s:wheat9_gui, "", s:wheat9_term, "", "NONE", "")
call s:hi("Repeat", s:wheat9_gui, "", s:wheat9_term, "", "", "")
call s:hi("Special", s:wheat4_gui, "", "NONE", "", "", "")
call s:hi("SpecialChar", s:wheat13_gui, "", s:wheat13_term, "", "", "")
call s:hi("SpecialComment", s:wheat8_gui, "", s:wheat8_term, "", s:italicize_comments, "")
call s:hi("Statement", s:wheat9_gui, "", s:wheat9_term, "", "", "")
call s:hi("StorageClass", s:wheat9_gui, "", s:wheat9_term, "", "", "")
call s:hi("String", s:wheat14_gui, "", s:wheat14_term, "", "", "")
call s:hi("Structure", s:wheat9_gui, "", s:wheat9_term, "", "", "")
call s:hi("Tag", s:wheat4_gui, "", "", "", "", "")
call s:hi("Todo", s:wheat13_gui, "NONE", s:wheat13_term, "NONE", "", "")
call s:hi("Type", s:wheat9_gui, "", s:wheat9_term, "", "NONE", "")
call s:hi("Typedef", s:wheat9_gui, "", s:wheat9_term, "", "", "")
hi! link Macro Define
hi! link PreCondit PreProc


"+-----------+
"+ Languages +
"+-----------+
call s:hi("asciidocAttributeEntry", s:wheat10_gui, "", s:wheat10_term, "", "", "")
call s:hi("asciidocAttributeList", s:wheat10_gui, "", s:wheat10_term, "", "", "")
call s:hi("asciidocAttributeRef", s:wheat10_gui, "", s:wheat10_term, "", "", "")
call s:hi("asciidocHLabel", s:wheat9_gui, "", s:wheat9_term, "", "", "")
call s:hi("asciidocListingBlock", s:wheat7_gui, "", s:wheat7_term, "", "", "")
call s:hi("asciidocMacroAttributes", s:wheat8_gui, "", s:wheat8_term, "", "", "")
call s:hi("asciidocOneLineTitle", s:wheat8_gui, "", s:wheat8_term, "", "", "")
call s:hi("asciidocPassthroughBlock", s:wheat9_gui, "", s:wheat9_term, "", "", "")
call s:hi("asciidocQuotedMonospaced", s:wheat7_gui, "", s:wheat7_term, "", "", "")
call s:hi("asciidocTriplePlusPassthrough", s:wheat7_gui, "", s:wheat7_term, "", "", "")
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

call s:hi("awkCharClass", s:wheat7_gui, "", s:wheat7_term, "", "", "")
call s:hi("awkPatterns", s:wheat9_gui, "", s:wheat9_term, "", s:bold, "")
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

call s:hi("cIncluded", s:wheat7_gui, "", s:wheat7_term, "", "", "")
hi! link cOperator Operator
hi! link cPreCondit PreCondit

call s:hi("cmakeGeneratorExpression", s:wheat10_gui, "", s:wheat10_term, "", "", "")

hi! link csPreCondit PreCondit
hi! link csType Type
hi! link csXmlTag SpecialComment

call s:hi("cssAttributeSelector", s:wheat7_gui, "", s:wheat7_term, "", "", "")
call s:hi("cssDefinition", s:wheat14_gui, "", s:wheat14_term, "", "NONE", "")
call s:hi("cssIdentifier", s:wheat7_gui, "", s:wheat7_term, "", s:underline, "")
call s:hi("cssStringQ", s:wheat5_gui, "", s:wheat5_term, "", "", "")
hi! link cssAttr Keyword
hi! link cssBraces Delimiter
hi! link cssClassName cssDefinition
hi! link cssColor Number
hi! link cssProp cssDefinition
hi! link cssPseudoClass cssDefinition
hi! link cssPseudoClassId cssPseudoClass
hi! link cssVendor Keyword

call s:hi("dosiniHeader", s:wheat8_gui, "", s:wheat8_term, "", "", "")
hi! link dosiniLabel Type

call s:hi("dtBooleanKey", s:wheat7_gui, "", s:wheat7_term, "", "", "")
call s:hi("dtExecKey", s:wheat7_gui, "", s:wheat7_term, "", "", "")
call s:hi("dtLocaleKey", s:wheat7_gui, "", s:wheat7_term, "", "", "")
call s:hi("dtNumericKey", s:wheat7_gui, "", s:wheat7_term, "", "", "")
call s:hi("dtTypeKey", s:wheat7_gui, "", s:wheat7_term, "", "", "")
hi! link dtDelim Delimiter
hi! link dtLocaleValue Keyword
hi! link dtTypeValue Keyword

if g:wheat_uniform_diff_background == 0
  call s:hi("DiffAdd", s:wheat14_gui, s:wheat0_gui, s:wheat14_term, "NONE", "inverse", "")
  call s:hi("DiffChange", s:wheat13_gui, s:wheat0_gui, s:wheat13_term, "NONE", "inverse", "")
  call s:hi("DiffDelete", s:wheat11_gui, s:wheat0_gui, s:wheat11_term, "NONE", "inverse", "")
  call s:hi("DiffText", s:wheat9_gui, s:wheat0_gui, s:wheat9_term, "NONE", "inverse", "")
else
  call s:hi("DiffAdd", s:wheat14_gui, s:wheat1_gui, s:wheat14_term, s:wheat1_term, "", "")
  call s:hi("DiffChange", s:wheat13_gui, s:wheat1_gui, s:wheat13_term, s:wheat1_term, "", "")
  call s:hi("DiffDelete", s:wheat11_gui, s:wheat1_gui, s:wheat11_term, s:wheat1_term, "", "")
  call s:hi("DiffText", s:wheat9_gui, s:wheat1_gui, s:wheat9_term, s:wheat1_term, "", "")
endif
" Legacy groups for official git.vim and diff.vim syntax
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete

call s:hi("gitconfigVariable", s:wheat7_gui, "", s:wheat7_term, "", "", "")

call s:hi("goBuiltins", s:wheat7_gui, "", s:wheat7_term, "", "", "")
hi! link goConstants Keyword

call s:hi("helpBar", s:wheat3_gui, "", s:wheat3_term, "", "", "")
call s:hi("helpHyperTextJump", s:wheat8_gui, "", s:wheat8_term, "", s:underline, "")

call s:hi("htmlArg", s:wheat7_gui, "", s:wheat7_term, "", "", "")
call s:hi("htmlLink", s:wheat4_gui, "", "", "", "NONE", "NONE")
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

call s:hi("javaDocTags", s:wheat7_gui, "", s:wheat7_term, "", "", "")
hi! link javaCommentTitle Comment
hi! link javaScriptBraces Delimiter
hi! link javaScriptIdentifier Keyword
hi! link javaScriptNumber Number

call s:hi("jsonKeyword", s:wheat7_gui, "", s:wheat7_term, "", "", "")

call s:hi("lessClass", s:wheat7_gui, "", s:wheat7_term, "", "", "")
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

call s:hi("markdownBlockquote", s:wheat7_gui, "", s:wheat7_term, "", "", "")
call s:hi("markdownCode", s:wheat7_gui, "", s:wheat7_term, "", "", "")
call s:hi("markdownCodeDelimiter", s:wheat7_gui, "", s:wheat7_term, "", "", "")
call s:hi("markdownFootnote", s:wheat7_gui, "", s:wheat7_term, "", "", "")
call s:hi("markdownId", s:wheat7_gui, "", s:wheat7_term, "", "", "")
call s:hi("markdownIdDeclaration", s:wheat7_gui, "", s:wheat7_term, "", "", "")
call s:hi("markdownH1", s:wheat8_gui, "", s:wheat8_term, "", "", "")
call s:hi("markdownLinkText", s:wheat8_gui, "", s:wheat8_term, "", "", "")
call s:hi("markdownUrl", s:wheat4_gui, "", "NONE", "", "NONE", "")
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

call s:hi("perlPackageDecl", s:wheat7_gui, "", s:wheat7_term, "", "", "")

call s:hi("phpClasses", s:wheat7_gui, "", s:wheat7_term, "", "", "")
call s:hi("phpClass", s:wheat7_gui, "", s:wheat7_term, "", "", "")
call s:hi("phpDocTags", s:wheat7_gui, "", s:wheat7_term, "", "", "")
hi! link phpDocCustomTags phpDocTags
hi! link phpMemberSelector Keyword
hi! link phpMethod Function
hi! link phpFunction Function

call s:hi("podCmdText", s:wheat7_gui, "", s:wheat7_term, "", "", "")
call s:hi("podVerbatimLine", s:wheat4_gui, "", "NONE", "", "", "")
hi! link podFormat Keyword

hi! link pythonBuiltin Type
hi! link pythonEscape SpecialChar

call s:hi("rubyConstant", s:wheat7_gui, "", s:wheat7_term, "", "", "")
call s:hi("rubySymbol", s:wheat6_gui, "", s:wheat6_term, "", s:bold, "")
hi! link rubyAttribute Identifier
hi! link rubyBlockParameterList Operator
hi! link rubyInterpolationDelimiter Keyword
hi! link rubyKeywordAsMethod Function
hi! link rubyLocalVariableOrMethod Function
hi! link rubyPseudoVariable Keyword
hi! link rubyRegexp SpecialChar

call s:hi("rustAttribute", s:wheat10_gui, "", s:wheat10_term, "", "", "")
call s:hi("rustEnum", s:wheat7_gui, "", s:wheat7_term, "", s:bold, "")
call s:hi("rustMacro", s:wheat8_gui, "", s:wheat8_term, "", s:bold, "")
call s:hi("rustModPath", s:wheat7_gui, "", s:wheat7_term, "", "", "")
call s:hi("rustPanic", s:wheat9_gui, "", s:wheat9_term, "", s:bold, "")
call s:hi("rustTrait", s:wheat7_gui, "", s:wheat7_term, "", s:italic, "")
hi! link rustCommentLineDoc Comment
hi! link rustDerive rustAttribute
hi! link rustEnumVariant rustEnum
hi! link rustEscape SpecialChar
hi! link rustQuestionMark Keyword

call s:hi("sassClass", s:wheat7_gui, "", s:wheat7_term, "", "", "")
call s:hi("sassId", s:wheat7_gui, "", s:wheat7_term, "", s:underline, "")
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

call s:hi("vimAugroup", s:wheat7_gui, "", s:wheat7_term, "", "", "")
call s:hi("vimMapRhs", s:wheat7_gui, "", s:wheat7_term, "", "", "")
call s:hi("vimNotation", s:wheat7_gui, "", s:wheat7_term, "", "", "")
hi! link vimFunc Function
hi! link vimFunction Function
hi! link vimUserFunc Function

call s:hi("xmlAttrib", s:wheat7_gui, "", s:wheat7_term, "", "", "")
call s:hi("xmlCdataStart", s:wheat3_gui_bright, "", s:wheat3_term, "", s:bold, "")
call s:hi("xmlNamespace", s:wheat7_gui, "", s:wheat7_term, "", "", "")
hi! link xmlAttribPunct Delimiter
hi! link xmlCdata Comment
hi! link xmlCdataCdata xmlCdataStart
hi! link xmlCdataEnd xmlCdataStart
hi! link xmlEndTag xmlTagName
hi! link xmlProcessingDelim Keyword
hi! link xmlTagName Keyword

call s:hi("yamlBlockMappingKey", s:wheat7_gui, "", s:wheat7_term, "", "", "")
hi! link yamlBool Keyword
hi! link yamlDocumentStart Keyword

"+----------------+
"+ Plugin Support +
"+----------------+
"+--- UI ---+
" ALE
" > w0rp/ale
call s:hi("ALEWarningSign", s:wheat13_gui, "", s:wheat13_term, "", "", "")
call s:hi("ALEErrorSign" , s:wheat11_gui, "", s:wheat11_term, "", "", "")
call s:hi("ALEWarning" , s:wheat13_gui, "", s:wheat13_term, "", "undercurl", "")
call s:hi("ALEError" , s:wheat11_gui, "", s:wheat11_term, "", "undercurl", "")

" Coc
" > neoclide/coc
call s:hi("CocWarningHighlight" , s:wheat13_gui, "", s:wheat13_term, "", "undercurl", "")
call s:hi("CocErrorHighlight" , s:wheat11_gui, "", s:wheat11_term, "", "undercurl", "")
call s:hi("CocWarningSign", s:wheat13_gui, "", s:wheat13_term, "", "", "")
call s:hi("CocErrorSign" , s:wheat11_gui, "", s:wheat11_term, "", "", "")
call s:hi("CocInfoSign" , s:wheat8_gui, "", s:wheat8_term, "", "", "")
call s:hi("CocHintSign" , s:wheat10_gui, "", s:wheat10_term, "", "", "")

" Nvim LSP
" > neovim/nvim-lsp
call s:hi("LSPDiagnosticsWarning", s:wheat13_gui, "", s:wheat13_term, "", "", "")
call s:hi("LSPDiagnosticsError" , s:wheat11_gui, "", s:wheat11_term, "", "", "")
call s:hi("LSPDiagnosticsInformation" , s:wheat8_gui, "", s:wheat8_term, "", "", "")
call s:hi("LSPDiagnosticsHint" , s:wheat10_gui, "", s:wheat10_term, "", "", "")

" GitGutter
" > airblade/vim-gitgutter
call s:hi("GitGutterAdd", s:wheat14_gui, "", s:wheat14_term, "", "", "")
call s:hi("GitGutterChange", s:wheat13_gui, "", s:wheat13_term, "", "", "")
call s:hi("GitGutterChangeDelete", s:wheat11_gui, "", s:wheat11_term, "", "", "")
call s:hi("GitGutterDelete", s:wheat11_gui, "", s:wheat11_term, "", "", "")

" Signify
" > mhinz/vim-signify
call s:hi("SignifySignAdd", s:wheat14_gui, "", s:wheat14_term, "", "", "")
call s:hi("SignifySignChange", s:wheat13_gui, "", s:wheat13_term, "", "", "")
call s:hi("SignifySignChangeDelete", s:wheat11_gui, "", s:wheat11_term, "", "", "")
call s:hi("SignifySignDelete", s:wheat11_gui, "", s:wheat11_term, "", "", "")

" fugitive.vim
" > tpope/vim-fugitive
call s:hi("gitcommitDiscardedFile", s:wheat11_gui, "", s:wheat11_term, "", "", "")
call s:hi("gitcommitUntrackedFile", s:wheat11_gui, "", s:wheat11_term, "", "", "")
call s:hi("gitcommitSelectedFile", s:wheat14_gui, "", s:wheat14_term, "", "", "")

" davidhalter/jedi-vim
call s:hi("jediFunction", s:wheat4_gui, s:wheat3_gui, "", s:wheat3_term, "", "")
call s:hi("jediFat", s:wheat8_gui, s:wheat3_gui, s:wheat8_term, s:wheat3_term, s:underline.s:bold, "")

" NERDTree
" > scrooloose/nerdtree
call s:hi("NERDTreeExecFile", s:wheat7_gui, "", s:wheat7_term, "", "", "")
hi! link NERDTreeDirSlash Keyword
hi! link NERDTreeHelp Comment

" CtrlP
" > ctrlpvim/ctrlp.vim
hi! link CtrlPMatch Keyword
hi! link CtrlPBufferHid Normal

" vim-clap
" > liuchengxu/vim-clap
call s:hi("ClapDir", s:wheat4_gui, "", "", "", "", "")
call s:hi("ClapDisplay", s:wheat4_gui, s:wheat1_gui, "", s:wheat1_term, "", "")
call s:hi("ClapFile", s:wheat4_gui, "", "", "NONE", "", "")
call s:hi("ClapMatches", s:wheat8_gui, "", s:wheat8_term, "", "", "")
call s:hi("ClapNoMatchesFound", s:wheat13_gui, "", s:wheat13_term, "", "", "")
call s:hi("ClapSelected", s:wheat7_gui, "", s:wheat7_term, "", s:bold, "")
call s:hi("ClapSelectedSign", s:wheat9_gui, "", s:wheat9_term, "", "", "")

let s:clap_matches = [
        \ [s:wheat8_gui,  s:wheat8_term] ,
        \ [s:wheat9_gui,  s:wheat9_term] ,
        \ [s:wheat10_gui, s:wheat10_term] ,
        \ ]
for s:wheat_clap_match_i in range(1,12)
  let clap_match_color = s:clap_matches[s:wheat_clap_match_i % len(s:clap_matches) - 1]
  call s:hi("ClapMatches" . s:wheat_clap_match_i, clap_match_color[0], "", clap_match_color[1], "", "", "")
  call s:hi("ClapFuzzyMatches" . s:wheat_clap_match_i, clap_match_color[0], "", clap_match_color[1], "", "", "")
endfor
unlet s:wheat_clap_match_i

hi! link ClapCurrentSelection PmenuSel
hi! link ClapCurrentSelectionSign ClapSelectedSign
hi! link ClapInput Pmenu
hi! link ClapPreview Pmenu
hi! link ClapProviderAbout ClapDisplay
hi! link ClapProviderColon Type
hi! link ClapProviderId Type

" vim-indent-guides
" > nathanaelkane/vim-indent-guides
call s:hi("IndentGuidesEven", "", s:wheat1_gui, "", s:wheat1_term, "", "")
call s:hi("IndentGuidesOdd", "", s:wheat2_gui, "", s:wheat3_term, "", "")

" vim-plug
" > junegunn/vim-plug
call s:hi("plugDeleted", s:wheat11_gui, "", "", s:wheat11_term, "", "")

" vim-signature
" > kshenoy/vim-signature
call s:hi("SignatureMarkText", s:wheat8_gui, "", s:wheat8_term, "", "", "")

" vim-startify
" > mhinz/vim-startify
call s:hi("StartifyFile", s:wheat5_gui, "", s:wheat6_term, "", s:bold, "")
" call s:hi("StartifyFooter", s:wheat7_gui, "", s:wheat7_term, "", "", "")
" call s:hi("StartifySpecial", s:wheat7_gui, "", s:wheat7_term, "", "", "")
call s:hi("StartifyHeader", s:wheat7_gui, "", s:wheat7_term, "", s:bold, "")
call s:hi("StartifyBracket", s:wheat8_gui, "", s:wheat8_term, "", "", "")
call s:hi("StartifySection", s:wheat5_gui, "", s:wheat5_term, "", s:bold, "")
call s:hi("StartifyNumber", s:wheat13_gui, "", s:wheat13_term, "", "", "")
call s:hi("StartifyPath", s:wheat8_gui, "", s:wheat8_term, "", "", "")
" hi! link StartifyBracket Delimiter
" hi! link StartifySlash Normal
" hi! link StartifySpecial Comment

"+--- Languages ---+
" Haskell
" > neovimhaskell/haskell-vim
call s:hi("haskellPreProc", s:wheat10_gui, "", s:wheat10_term, "", "", "")
call s:hi("haskellType", s:wheat7_gui, "", s:wheat7_term, "", "", "")
hi! link haskellPragma haskellPreProc

" JavaScript
" > pangloss/vim-javascript
call s:hi("jsGlobalNodeObjects", s:wheat8_gui, "", s:wheat8_term, "", s:italic, "")
hi! link jsBrackets Delimiter
hi! link jsFuncCall Function
hi! link jsFuncParens Delimiter
hi! link jsThis Keyword
hi! link jsNoise Delimiter
hi! link jsPrototype Keyword
hi! link jsRegexpString SpecialChar

" TypeScript
" > HerringtonDarkholme/yats.vim
call s:hi("typescriptBOMWindowMethod", s:wheat8_gui, "", s:wheat8_term, "", s:italic, "")
call s:hi("typescriptClassName", s:wheat7_gui, "", s:wheat7_term, "", "", "")
call s:hi("typescriptDecorator", s:wheat12_gui, "", s:wheat12_term, "", "", "")
call s:hi("typescriptInterfaceName", s:wheat7_gui, "", s:wheat7_term, "", s:bold, "")
call s:hi("typescriptRegexpString", s:wheat13_gui, "", s:wheat13_term, "", "", "")
" TypeScript JSX
 call s:hi("tsxAttrib", s:wheat7_gui, "", s:wheat7_term, "", "", "")
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
call s:hi("mkdCode", s:wheat7_gui, "", s:wheat7_term, "", "", "")
call s:hi("mkdFootnote", s:wheat8_gui, "", s:wheat8_term, "", "", "")
call s:hi("mkdRule", s:wheat10_gui, "", s:wheat10_term, "", "", "")
call s:hi("mkdLineBreak", s:wheat9_gui, "", s:wheat9_term, "", "", "")
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
    call s:hi("VimwikiHeader".s:i, s:wheat8_gui, "", s:wheat8_term, "", s:bold, "")
  endfor
else
  let s:vimwiki_hcolor_guifg = [s:wheat7_gui, s:wheat8_gui, s:wheat9_gui, s:wheat10_gui, s:wheat14_gui, s:wheat15_gui]
  let s:vimwiki_hcolor_ctermfg = [s:wheat7_term, s:wheat8_term, s:wheat9_term, s:wheat10_term, s:wheat14_term, s:wheat15_term]
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, s:vimwiki_hcolor_guifg[s:i-1] , "", s:vimwiki_hcolor_ctermfg[s:i-1], "", s:bold, "")
  endfor
endif

call s:hi("VimwikiLink", s:wheat8_gui, "", s:wheat8_term, "", s:underline, "")
hi! link VimwikiHeaderChar markdownHeadingDelimiter
hi! link VimwikiHR Keyword
hi! link VimwikiList markdownListMarker

" YAML
" > stephpy/vim-yaml
call s:hi("yamlKey", s:wheat7_gui, "", s:wheat7_term, "", "", "")


" Obli-Vim
" > katawful/Obli-Vim
call s:hi("obseStatement", s:wheat6_gui, "", s:wheat6_term, "", s:bold, "")
call s:hi("obseString", s:wheat5_gui, "", s:wheat5_term, "", s:bold, "")
call s:hi("obseRepeat", s:wheat10_gui, "", s:wheat10_term, "", s:bold, "")
call s:hi("obseCondition", s:wheat10_gui, "", s:wheat10_term, "", s:bold, "")
call s:hi("obseBlock", s:wheat12_gui, "", s:wheat12_term, "", s:bold, "")
call s:hi("obseBlockType", s:wheat9_gui, "", s:wheat9_term, "", s:bold, "")
call s:hi("obseTypes", s:wheat5_gui, "", s:wheat5_term, "", "", "")
call s:hi("obseScriptNameRegion", s:wheat14_gui, "", s:wheat14_term, "", "", "")
hi! link obseStringFormatting Number
