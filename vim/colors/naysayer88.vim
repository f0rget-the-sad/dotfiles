"AUTHOR: Jan Hahlganß
"SCRIPT: https://github.com/roepel/naysayer88.vim

set background=dark

highlight clear
if exists("syntax_on")
	syntax reset
endif

let g:colors_name="naysayer88"

highlight! Default guifg=#d6b48b guibg=#042327 gui=NONE ctermfg=180 ctermbg=None
highlight! Normal guifg=#d6b48b guibg=#042327 gui=NONE ctermfg=180 ctermbg=None

highlight! Comment guifg=#31B72C guibg=NONE gui=NONE ctermfg=70

highlight! link Constant Statement
highlight! String guifg=#2ca198 guibg=NONE gui=NONE ctermfg=36
highlight! link Character Number
highlight! Number guifg=#70c5bf guibg=NONE gui=NONE ctermfg=79
highlight! link Boolean Number
highlight! link Float Number

highlight! link Identifier Default
"highlight! link Function Default

highlight! Statement guifg=#ffffff guibg=NONE gui=NONE ctermfg=15
"highlight! link Conditional Statement
"highlight! link Repeat Statement
"highlight! link Label Statement
highlight! link Operator Default
"highlight! link Keyword Statement
"highlight! link Exception Statement

highlight! PreProc guifg=#9DE3C0 guibg=NONE gui=NONE ctermfg=151
"highlight link Include PreProc
"highlight link Define PreProc
"highlight link Macro PreProc
"highlight link PreCondit PreProc

highlight! link Type PreProc
"highlight! link StorageClass Type
"highlight! link Structure Type
"highlight! link Typedef Type

highlight! link Special Default
highlight! link SpecialChar String
"highlight! link Tag Special
"highlight! link Delimiter Special
highlight SpecialComment guifg=#87875f guibg=NONE gui=reverse ctermfg=101 cterm=reverse
"highlight! link Debug Special

highlight Underlined guifg=#af5f5f guibg=NONE gui=NONE ctermfg=131

"highlight Ignore guifg=#af5f5f guibg=NONE gui=NONE

"highlight Error guifg=#af5f5f guibg=NONE gui=NONE

highlight! link Todo Comment

highlight link Title Default
"highlight htmlStatement guifg=#878787 guibg=NONE gui=NONE
"highlight htmlItalic guifg=#dfaf87 guibg=NONE gui=NONE
"highlight htmlArg guifg=#875f5f guibg=NONE gui=NONE
"highlight cssIdentifier guifg=#dfaf87 guibg=NONE gui=NONE
"highlight cssClassName guifg=#dfaf87 guibg=NONE gui=NONE

" C#
highlight! link csEndColon Default
highlight! link csLogicSymbols Default

" Window UI
highlight Cursor       guifg=#000000 guibg=#dfdfaf gui=NONE ctermfg=0   ctermbg=187
highlight MoreMsg      guifg=#dfaf87 guibg=NONE    gui=NONE ctermfg=180
highlight Visual       guifg=#dfdfaf guibg=#888888 gui=NONE ctermfg=187 ctermbg=102
highlight Question     guifg=#875f5f guibg=NONE    gui=NONE ctermfg=95  ctermbg=NONE
highlight Search       guifg=#dfdfaf guibg=#878787 gui=NONE ctermfg=187 ctermbg=102
highlight PmenuSel     guifg=#dfdfaf guibg=#875f5f gui=NONE ctermfg=187 ctermbg=95
highlight MatchParen   guifg=#dfdfaf guibg=#875f5f gui=NONE ctermfg=187 ctermbg=95
highlight VertSplit    guifg=#000000 guibg=NONE    gui=NONE ctermfg=0   ctermbg=NONE
highlight! EndOfBuffer guifg=#042327 guibg=#042327 gui=NONE ctermfg=234 ctermbg=234
