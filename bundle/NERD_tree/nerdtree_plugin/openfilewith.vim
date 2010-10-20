" ============================================================================
" File:        openfilewith.vim
" Description: plugin for NERD Tree that will open the selected file 
"              using xdg-open
" Maintainer:  SjB <steve.beaulac at gmail dot com>
" Last Change: 2010 Oct 20
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
"
" ============================================================================
if exists("g:loaded_nerdtree_openfilewith_menuitem")
	finish
endif
let g:loaded_nerdtree_openfilewith_menuitem = 1

call NERDTreeAddKeyMap({
	\ 'key': 'gO',
	\ 'callback': 'NERDTreeOpenWith',
	\ 'quickhelpText': 'Open file with command' })

function! NERDTreeOpenWith()
    let treenode = g:NERDTreeFileNode.GetSelected()
	let cmd = 'xdg-open'

    if cmd != ''
        exec ':silent !' . cmd . ' ' . treenode.path.str({'escape': 1})
    else
        echo "Aborted"
    endif
endfunction
