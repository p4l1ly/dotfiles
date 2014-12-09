" Vim color file
" Maintainer:	Pavol Vargovcik <pallly.vargovcik@gmail.com>
" Last Change:	2014 Jun 14

" This color scheme uses a white background
" Uses the evening color scheme by Bram Moolenaar as a base

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "light"

hi Normal guifg=Black guibg=grey90

" Groups used in the 'highlight' and 'guicursor' options default value.
hi ErrorMsg guibg=Red guifg=White
hi IncSearch gui=reverse
hi ModeMsg gui=bold
hi StatusLine gui=reverse,bold
hi StatusLineNC gui=reverse
hi VertSplit gui=reverse
hi Visual guibg=grey75
hi VisualNOS gui=underline,bold
hi DiffText gui=bold guibg=Red
hi Cursor guibg=DarkGreen guifg=White
hi lCursor guibg=DarkBlue guifg=White
hi Directory guifg=DarkBlue
hi LineNr guifg=#C05000 guibg=White
hi MoreMsg gui=bold guifg=SeaGreen
hi NonText gui=bold guifg=DarkBlue guibg=grey93
hi Question gui=bold guifg=Blue
hi Search guibg=#D06030 guifg=White
hi SpecialKey guifg=DarkBlue
hi Title gui=bold guifg=DarkMagenta
hi WarningMsg guifg=Red
hi WildMenu guibg=DarkOrange guifg=White
hi Folded guibg=DarkGrey guifg=LightBlue
hi FoldColumn guibg=Grey guifg=LightBlue
hi DiffAdd guibg=LightBlue
hi DiffChange guibg=LightMagenta
hi DiffDelete gui=bold guifg=Blue guibg=DarkCyan
hi CursorLine guibg=grey60
hi CursorColumn guibg=grey82
hi ColorColumn guibg=#F0E5FF
hi Conceal guifg=#009000 guibg=grey90

" Groups for syntax highlighting
hi Constant guifg=#B05000 gui=bold
hi Special guifg=#B000B0
if &t_Co > 8
  hi Statement guifg=#0000A0 gui=bold
endif
hi Ignore guifg=grey80
hi Identifier guifg=DarkCyan gui=bold
hi PreProc guifg=Purple gui=bold

" language specific colors

" ruby:
hi rubyBlock guifg=Black gui=bold

" Additional options
hi ExtraWhitespace guibg=red
autocmd BufWinEnter * let m=matchadd('ExtraWhitespace', '\s\+$', 10)
