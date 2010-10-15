command! -n=? -complete=dir Intellisense :call s:AddTags('<args>')

let s:escape_chars =  " `|\"~'#"

function s:AddTags(dir)
	if !empty(a:dir)
		let dir = a:dir
	else
        	let dir = resolve(getcwd())
	endif

	if exists('*system')		
		let cmd_output = system("ctags -R -a --c++-kinds=+p --fields=+iaS --extra=+q " . escape(dir, s:escape_chars))
		return 1
	endif
endfunction
