noremap <silent> \ff :FufFile<cr>
noremap <silent> \fb :FufBuffer<cr>
noremap <silent> \ft :FufTaggedFile<cr>

"nnoremap <silent> <C-]> :FufBufferTagWithCursorWord!<CR>
"vnoremap <silent> <C-]> :FufBufferTagAllWithSelectedText!<CR>

nnoremap <silent> <C-]> :FufBufferTagAllWithCursorWord!<CR>
vnoremap <silent> <C-]> :FufBufferTagAllWithSelectedText!<CR>
