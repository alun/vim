
if exists("b:did_alun_ftplugin") | finish | endif
let b:did_alun_ftplugin = 1

fun! UpdateModifiedMeta()

	try
		normal mz
		let @0 = substitute(system('LANG=en_EN date'),'\r\|\n','','')
		exec '%s/<meta\s\+name="Modified"\s\+content="\zs[^"]*\ze"/'.@0.'/i'
		normal `z
	catch /.*/
	endtry

endfun

augroup alun_autocmds
	au BufWritePre *.html call UpdateModifiedMeta()
augroup END

