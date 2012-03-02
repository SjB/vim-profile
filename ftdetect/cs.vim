" recognize .cs files
if has("autocmd")
    autocmd BufNewFile,BufRead *.cs setf cs 
endif
