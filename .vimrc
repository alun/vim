"syntax on
filetype on
filetype plugin on

set shiftwidth=2 tabstop=2 expandtab
set autoindent
set laststatus=2 		" always show status line

nmap <silent> <F12> :wa<Bar>exe "mks! " . v:this_session<Bar>echo "Session " . v:this_session . " is saved"<CR>
nmap <F10> :silent qa!<CR>
nmap <C-Esc> <F10>

" au BufWrite *.html silent! %sm/<meta\s\+name="Modified"\s\+content="\zs.*\ze"/\=strftime("%c")/
" map ,d :exe "/\\%(^\\%(\\w\\\\|\\s\\)*\\)\\@<=" . expand("<cword>")<CR>
"
au VimEnter * silent! exe 'cd ' . expand('%:p:h')
"au BufEnter hotseat.conf.json so ~/.vim/hotseat.conf.helper.vim
"au BufRead * cd %:h

set fencs=ucs-bom,utf-8,default,cp1251

fu! ToUTF()
	let tmpname = system('mktemp')
	se fenc=cp1251
	exe "saveas! " . tmpname
	e ++enc=utf8
endfu

fu! PrintDate()
  read !date
endfu

map ,d :call PrintDate()<CR>
map ,u :call ToUTF()<CR>

fu! CdSrc()
  let p = "%:p:h"
  while getcwd() !~ "src$"
    exe "cd " .p
    if getcwd() == "/" | break | endif
    let p = p . ":h"
  endwhile
endfu
map <silent> ,s :call CdSrc()<CR>
map <silent> <C-UP> :e %:h<CR>
