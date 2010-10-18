XPTemplate priority=like

let s:f = g:XPTfuncs()

XPTvar $BRfun	\n
XPTvar $BRret	\n

XPTinclude
	\ _common/common

fun! s:f.c_fun_body_indent()
	return self[ '$BRret' ]
endfunction

fun! s:f.c_fun_type_indent()
	return ''
endfunction

