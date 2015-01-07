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

hi Normal guifg=Black guibg=grey90 ctermbg=White ctermfg=Black

" Groups used in the 'highlight' and 'guicursor' options default value.
hi ErrorMsg guibg=Red guifg=White ctermbg=DarkRed ctermfg=White
hi IncSearch gui=reverse cterm=reverse
hi ModeMsg gui=bold cterm=reverse,bold
hi StatusLine gui=reverse,bold cterm=reverse,bold
hi StatusLineNC gui=reverse cterm=reverse
hi VertSplit gui=reverse cterm=reverse
hi Visual guibg=grey75 ctermbg=LightGrey
hi VisualNOS gui=underline,bold cterm=underline,bold
hi DiffText gui=bold guibg=Red cterm=bold ctermbg=Red
hi nCursor guibg=DarkGreen guifg=White ctermbg=DarkGreen ctermfg=White
hi iCursor guibg=DarkBlue guifg=White ctermbg=Cyan ctermfg=White
hi Directory guifg=DarkBlue ctermfg=DarkBlue
hi LineNr guifg=#C05000 guibg=White ctermfg=DarkRed ctermbg=White
hi MoreMsg gui=bold guifg=SeaGreen cterm=bold ctermfg=Green
hi NonText gui=bold guifg=DarkBlue guibg=grey93 ctermfg=DarkBlue
hi Question gui=bold guifg=Blue ctermfg=Blue
hi Search guibg=#D06030 guifg=White ctermbg=Brown ctermfg=White
hi SpecialKey guifg=DarkBlue cterm=bold ctermfg=DarkBlue
hi Title gui=bold guifg=DarkMagenta cterm=bold ctermfg=DarkMagenta
hi WarningMsg guifg=Red ctermfg=Red
hi WildMenu guibg=DarkOrange guifg=White ctermbg=Brown ctermfg=White
hi Folded guibg=DarkGrey guifg=LightBlue ctermbg=DarkGrey ctermfg=LightBlue
hi FoldColumn guibg=Grey guifg=LightBlue ctermbg=Grey ctermfg=LightBlue
hi DiffAdd guibg=LightBlue ctermbg=LightBlue
hi DiffChange guibg=LightMagenta ctermbg=LightMagenta
hi DiffDelete gui=bold guifg=Blue guibg=DarkCyan ctermbg=DarkCyan ctermfg=Blue
hi ColorColumn guibg=#F0E5FF ctermbg=LightGrey
hi Conceal guifg=#009000 guibg=grey90 ctermbg=White

" Groups for syntax highlighting
hi Constant guifg=#B05000 gui=bold ctermfg=DarkRed
hi Special guifg=#B000B0 ctermfg=DarkBlue
hi Statement guifg=#0000A0 gui=bold cterm=bold ctermfg=DarkMagenta
hi Ignore guifg=grey80 ctermfg=LightGrey
hi Identifier guifg=DarkCyan gui=bold ctermfg=Blue cterm=bold
hi PreProc guifg=Purple gui=bold ctermfg=DarkMagenta cterm=bold
hi Comment guifg=DarkBlue ctermfg=Blue

" language specific colors

" ruby:
hi rubyBlock guifg=Black gui=bold ctermfg=Black cterm=bold

" Additional options
hi ExtraWhitespace guibg=red ctermbg=Red
autocmd BufWinEnter * let m=matchadd('ExtraWhitespace', '\s\+$', 10)
