
if exists("b:did_alun_help_ftplugin") | finish | endif
let b:did_alun_help_ftplugin = 1

let s:pattern = "\\('.\\{-}'\\)\\<Bar>\\(<Bar>.\\{-}<Bar>\\)"

exe "nn <silent> <Tab> /" . s:pattern ."<CR>"
exe "nn <silent> <S-Tab> ?" . s:pattern ."<CR>"
nn <CR> <C-]>
nn <BS> <C-O>

