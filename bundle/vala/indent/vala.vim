" Vim indent file
" Language:	Vale
" Maintainer:	SjB steve@sagacity.ca
" Last Change:	2010 Oct 20

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

" Vala is like indenting C
setlocal cindent

let b:undo_indent = "setl cin<"
