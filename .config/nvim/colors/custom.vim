" midnightdust.vim
" A minimalist, dark, greyish theme with brown & cyan accents

set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = "midnightdust"

" === Base ===
highlight Normal        guifg=#C0C0C0 guibg=#000000
highlight NormalFloat   guifg=#C0C0C0 guibg=#101010
highlight Comment       guifg=#606060 gui=italic
highlight LineNr        guifg=#4c4c4c guibg=#000000
highlight CursorLineNr  guifg=#a0a0a0 gui=bold
highlight CursorLine    guibg=#111111
highlight VertSplit     guifg=#202020
highlight NonText       guifg=#303030
highlight Visual        guibg=#1a1a1a
highlight Search        guibg=#2a2a2a guifg=#c0c0c0
highlight MatchParen    guibg=#252525 guifg=#00bcd4

" === Syntax / Semantic ===
highlight Keyword       guifg=#00bcd4
highlight Conditional   guifg=#00bcd4
highlight Repeat        guifg=#00bcd4
highlight Operator      guifg=#bbbbbb
highlight Function      guifg=#c88a3d
highlight Identifier    guifg=#a8a8a8
highlight Type          guifg=#c88a3d
highlight Constant      guifg=#00bcd4
highlight String        guifg=#a6783d
highlight Number        guifg=#00a0a0
highlight Boolean       guifg=#00a0a0
highlight Character     guifg=#00bcd4
highlight Structure     guifg=#c88a3d
highlight Include       guifg=#00bcd4
highlight Statement     guifg=#bbbbbb
highlight PreProc       guifg=#9b9b9b
highlight Special       guifg=#c88a3d
highlight Todo          guifg=#8b8b8b gui=italic
highlight Underlined    guifg=#00bcd4 gui=underline

" === UI ===
highlight Pmenu         guibg=#1a1a1a guifg=#c0c0c0
highlight PmenuSel      guibg=#2a2a2a guifg=#00bcd4
highlight PmenuSbar     guibg=#2a2a2a
highlight PmenuThumb    guibg=#444444
highlight StatusLine    guibg=#111111 guifg=#aaaaaa
highlight StatusLineNC  guibg=#111111 guifg=#555555
highlight TabLine       guibg=#1a1a1a guifg=#888888
highlight TabLineSel    guibg=#2a2a2a guifg=#00bcd4
highlight WinSeparator  guifg=#222222

" === Diagnostics ===
highlight DiagnosticError guifg=#d17b6c
highlight DiagnosticWarn  guifg=#c8a15a
highlight DiagnosticInfo  guifg=#5faea0
highlight DiagnosticHint  guifg=#6a9a9a
highlight DiagnosticUnderlineError gui=undercurl guisp=#d17b6c
highlight DiagnosticUnderlineWarn  gui=undercurl guisp=#c8a15a
highlight DiagnosticUnderlineInfo  gui=undercurl guisp=#5faea0
highlight DiagnosticUnderlineHint  gui=undercurl guisp=#6a9a9a
