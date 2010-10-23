" looks.vim - Manage various looks of vim
" Maintainer:   Shrikant Sharat <shrikantsharat.k@gmail.com>
" Version:      0.2

" Install this file as plugin/looks.vim.  See doc/looks.txt for details.

" Exit quickly when:
" - this plugin was already loaded (or disabled)
" - when 'compatible' is set
" - Vim is older than 7.0
if (exists("g:loaded_looks") && g:loaded_looks) || &cp || v:version < 700
    finish
endif
let g:loaded_looks = 1

let s:save_cpo = &cpo
set cpo&vim

function! s:LoadNamedLook(name)

    if !exists("g:looks")
        echo "No g:looks found"
        return
    endif

    if !exists("g:looks." . a:name)
        echo "No look named " . a:name
        return
    endif

    call s:LoadLook(g:looks[a:name])

endfunction

function! s:LoadLook(look)

    for [key, value] in items(a:look)

        if key[0] == "&"
            exe "let " . key . "=\"" . value . "\""

        elseif key[0] == ":"
            exe key . (len(value) ? " " . value : "")

        elseif key[0] == "_"
            " These are reserved for future versions

        endif

    endfor

endfunction

function! s:LookComplete(ArgLead, CmdLine, CursorPos)

    if !exists("g:looks")
        return ""
    endif

    return join(keys(g:looks), "\n")

endfunction

function! s:SetupLookMaps()

    if !exists("g:looks")
        return ""
    endif

    if !exists("g:looks_map_prefix")
        let g:looks_map_prefix = "o"
    endif

    for [key, value] in items(g:looks)
        if exists("value._map")
            exe "nnoremap <Leader>" . g:looks_map_prefix . value._map . " :Look " . key . "<CR>"
        endif
    endfor

endfunction

call <SID>SetupLookMaps()

command! -nargs=1 -complete=custom,<SID>LookComplete Look call <SID>LoadNamedLook(<q-args>)

let &cpo = s:save_cpo
