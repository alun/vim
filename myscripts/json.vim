
func! FmtJSON()
	%substitute/{/{\r/g
	%substitute/}/\r}/g
	%substitute/,/,\r/g

	let lines = getline(1, '$')

	for line in range(1, len(lines))
		let cnt = 0
		for i in range(1, line - 1)
			if getline(i) =~ '{' 
				let cnt = cnt + 1
			elseif getline(i) =~ '}'
				let cnt = cnt - 1
			endif
		endfor
		let nline = getline( line )
		for i in range(1, cnt)
			let nline = "\t" . nline
		endfor
		call setline( line, nline )
	endfor

endfunc


"func! UnFmtJSON()
"	let lines = getline(1, '$')
"
"
"	for line in lines
"		let cnt = 0
"		for i in range(1, line - 1)
"			if getline(i) =~ '{' 
"				let cnt = cnt + 1
"			elseif getline(i) =~ '}'
"				let cnt = cnt - 1
"			endif
"		endfor
"		let nline = getline( line )
"		for i in range(1, cnt)
"			let nline = "\t" . nline
"		endfor
"		call setline( line, nline )
"	endfor
"endfunc

"map <F7> :w<BAR>so %<CR>
"map ,f :silent call FmtJSON()<CR>
"map ,u :silent call UnFmtJSON()<CR>
