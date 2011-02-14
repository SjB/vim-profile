" reStructuredText

" underline Parts w/ #'s
noremap <C-u>1 yyPVr#yyjp
inoremap <C-u>1 <esc>yyPVr#yyjpA

" underline Chapters w/ *'s
noremap <C-u>2 yyPVr*yyjp
inoremap <C-u>2 <esc>yyPVr*yyjpA

" underline Section Level 1 w/ ='s
noremap <C-u>3 yypVr=
inoremap <C-u>3 <esc>yypVr=A

" underline Section Level 2 w/ -'s
noremap <C-u>4 yypVr-
inoremap <C-u>4 <esc>yypVr-A

" underline Section Level 3 w/ ^'s
noremap <C-u>5 yypVr^
inoremap <C-u>5 <esc>yypVr^A


