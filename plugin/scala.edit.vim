
function! TuneScalaDev()

  se suffixesadd+=.scala

  set path=

  let dirs = system('find -type d')

  let dirList = split(dirs)
  let readyDirs = []
  call remove( dirList, 0 )

  for dir in dirList
    let dir = strpart( dir, 2 )
    call add( readyDirs, dir )
  endfor

  let dirs = join( readyDirs, ',' )

  exe 'set path+=' . dirs

endfunction

au BufNewFile,BufEnter *.scala map ,t :call TuneScalaDev()<CR>
