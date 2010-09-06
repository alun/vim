if exists("b:alun_ft_ac_loaded") | finish | endif
let b:alun_ft_ac_loaded = 1

augroup filetypedetect

au BufNewFile,BufRead *.json	setf json
au! BufNewFile,BufRead *.as
au BufNewFile,BufRead *.as		setf actionscript
au BufNewFile,BufRead *.vm		setf velocity

augroup END

