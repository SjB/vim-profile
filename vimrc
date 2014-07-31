filetype off
filetype plugin indent off

silent function! OSX()
return has('macunix')
endfunction

silent function! LINUX()
return has('unix') && !has('macunix') && !has('win32unix')
endfunction

silent function! WINDOWS()
return (has('win16') || has('win32') || has('win64'))
endfunction

" fix ubuntu filetype bug
set nocompatible

if !WINDOWS()
    set shell=/bin/sh
endif


" On Windows this make synchronization across system easier
if WINDOWS()
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

if filereadable(expand("~/.vim/vimrc.before"))
    source ~/.vim/vimrc.before
endif

if filereadable(expand("~/.vim/vimrc.bundles"))
    source ~/.vim/vimrc.bundles
endif

if filereadable(expand("~/.vim/vimrc.spf13"))
    source ~/.vim/vimrc.spf13
endif

filetype plugin indent on
syntax on
set mouse=a
set mousehide
scriptencoding utf-8

if has('clipboard')
    if LINUX()
        set clipboard=unnamedplus
    else
        set clipboard=unnamed
    endif
endif

" window specific setting
if WINDOWS()
    set shellslash
endif


"set autowrite                       " Automatically write a file when leaving a modified buffer
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
set spell                           " Spell checking on
set hidden                          " Allow buffer switching without saving

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

set backup                  " Backups are nice ...
if has('persistent_undo')
    set undofile                " So is persistent undo ...
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

set tabpagemax=15               " Only show 15 tabs
set showmode                    " Display the current mode

set cursorline                  " Highlight current line

highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode


if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and
    " Selected characters/lines in visual mode
endif

runtime ftplugin/man.vim

" Set spell language
"setlocal spell spelllang=en_ca
set dictionary=/usr/share/dict/words

set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                          " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
"set list
"set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set formatoptions-=t

" default tabs setting
set tabstop=4
set shiftwidth=4
set softtabstop=4 
set nowrap
set expandtab
set nojoinspaces
set splitright
set splitbelow
set textwidth=79


" vim setting
"set ch=2 	" Make command line two lines high
"set backspace=eol,indent,start
"set background=light
set autoindent
set cink+=*;
set cpoptions+=$d
set fillchars=""
set lazyredraw
set matchtime=2
set nobackup
" set ruler
"set showfulltag
"set smartindent
set synmaxcol=2048
set timeoutlen=500
"set virtualedit=all
"set wrapscan

set wildignore+=*.o,*.obj,*.exe,*.bak

" completion settings
""set complete=.,w,b,t,i,kspell

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" Set diff mode to ingnore white space
set diffopt+=iwhite

" Set vim search path
set path=/usr/include/**
set path+=/usr/local/include/**
set path+=~/Projects/lib/**

noremap <Leader>we :e <C-R>=expand("%:p:h")."/"<cr>
noremap <Leader>ws :sp <C-R>=expand("%:p:h")."/"<cr>
noremap <Leader>wvs :vsp <C-R>=expand("%:p:h")."/"<cr>

"show minscm status on statusline
function! MinScmStatus()
    if exists('*g:minscm_getStatus')
        return g:minscm_getStatus()
    else
        return ''
    endif
endfunction

" Starting from  vim 7.3 undo can be persisted across sessions
" http://www.reddit.com/r/vim/comments/kz84u/what_are_some_simple_yet_mindblowing_tweaks_to/c2onmqe
if has("persistent_undo")
    set undodir=~/.vim/undodir
    set undofile
endif

" Mark the ideal max text width
"if v:version >= 703
"	set colorcolumn=+1
"endif

" reset the path when entering a buffer
autocmd BufEnter * set path+=**

" Return to last edit position when opening files
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'svn\|commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

autocmd filetype svn,*commit* setlocal spell

" Remember info about open buffers on close
set viminfo^=%

if has('statusline')
    " set status line
    set statusline=%<%f\ %(\ [%M%R%H%W%Y,%{&ff}]%)\ %{MinScmStatus()}

    "display a warning if fileformat isnt unix
    set statusline+=%#warningmsg#
    set statusline+=%{&ff!='unix'?'['.&ff.']':''}
    set statusline+=%*

    "display a warning if file encoding isnt utf-8
    set statusline+=%#warningmsg#
    set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
    set statusline+=%*
    "read only flag
    set statusline+=%#identifier#
    set statusline+=%r
    set statusline+=%*

    "modified flag
    set statusline+=%#identifier#
    set statusline+=%m
    set statusline+=%*

    set statusline+=%{fugitive#statusline()}

    "display a warning if &et is wrong, or we have mixed-indenting
    set statusline+=%#error#
    set statusline+=%{StatuslineTabWarning()}
    set statusline+=%*

    set statusline+=%{StatuslineTrailingSpaceWarning()}

    set statusline+=%{StatuslineLongLineWarning()}

    set statusline+=%#warningmsg#
"    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    "display a warning if &paste is set
    set statusline+=%#error#
    set statusline+=%{&paste?'[paste]':''}
    set statusline+=%*

    set statusline+=%=      "left/right separator
    set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
    set statusline+=[L:%l\ C:%c]\ %L[%2p%%]\ Buf:\ #%02n\ [%3b][0x%02B]
    set laststatus=2

    "recalculate the trailing whitespace warning when idle, and after saving
    autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

    "return '[\s]' if trailing white space is detected
    "return '' otherwise
    function! StatuslineTrailingSpaceWarning()
        if !exists("b:statusline_trailing_space_warning")

            if !&modifiable
                let b:statusline_trailing_space_warning = ''
                return b:statusline_trailing_space_warning
            endif

            if search('\s\+$', 'nw') != 0
                let b:statusline_trailing_space_warning = '[\s]'
            else
                let b:statusline_trailing_space_warning = ''
            endif
        endif
        return b:statusline_trailing_space_warning
    endfunction


    "return the syntax highlight group under the cursor ''
    function! StatuslineCurrentHighlight()
        let name = synIDattr(synID(line('.'),col('.'),1),'name')
        if name == ''
            return ''
        else
            return '[' . name . ']'
        endif
    endfunction

    "recalculate the tab warning flag when idle and after writing
    autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

    "return '[&et]' if &et is set wrong
    "return '[mixed-indenting]' if spaces and tabs are used to indent
    "return an empty string if everything is fine
    function! StatuslineTabWarning()
        if !exists("b:statusline_tab_warning")
            let b:statusline_tab_warning = ''

            if !&modifiable
                return b:statusline_tab_warning
            endif

            let tabs = search('^\t', 'nw') != 0

            "find spaces that arent used as alignment in the first indent column
            let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

            if tabs && spaces
                let b:statusline_tab_warning =  '[mixed-indenting]'
            elseif (spaces && !&et) || (tabs && &et)
                let b:statusline_tab_warning = '[&et]'
            endif
        endif
        return b:statusline_tab_warning
    endfunction

    "recalculate the long line warning when idle and after saving
    autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

    "return a warning for "long lines" where "long" is either &textwidth or 80 (if
    "no &textwidth is set)
    "
    "return '' if no long lines
    "return '[#x,my,$z] if long lines are found, were x is the number of long
    "lines, y is the median length of the long lines and z is the length of the
    "longest line
    function! StatuslineLongLineWarning()
        if !exists("b:statusline_long_line_warning")

            if !&modifiable
                let b:statusline_long_line_warning = ''
                return b:statusline_long_line_warning
            endif

            let long_line_lens = s:LongLines()

            if len(long_line_lens) > 0
                let b:statusline_long_line_warning = "[" .
                            \ '#' . len(long_line_lens) . "," .
                            \ 'm' . s:Median(long_line_lens) . "," .
                            \ '$' . max(long_line_lens) . "]"
            else
                let b:statusline_long_line_warning = ""
            endif
        endif
        return b:statusline_long_line_warning
    endfunction

    "return a list containing the lengths of the long lines in this buffer
    function! s:LongLines()
        let threshold = (&tw ? &tw : 80)
        let spaces = repeat(" ", &ts)
        let line_lens = map(getline(1,'$'), 'len(substitute(v:val, "\\t", spaces, "g"))')
        return filter(line_lens, 'v:val > threshold')
    endfunction

    "find the median of the given array of numbers
    function! s:Median(nums)
        let nums = sort(a:nums)
        let l = len(nums)

        if l % 2 == 1
            let i = (l-1) / 2
            return nums[i]
        else
            return (nums[l/2] + nums[(l/2)-1]) / 2
        endif
    endfunction
endif

" make helpgrep easier to access
cnoreabbrev H helpgrep

" Breaking lines with \[enter] without having to go to insert mode (myself).
nmap <leader><cr> i<cr><Esc>

" F9  - Run external make command
noremap <silent> <f9> :echo "Running waf..."<cr>:sil! ./waf<cr>:cw<cr>:redraw!<cr>:echo "waf complete."<cr>

" Toggle paste mode
nmap <silent> <Leader>p :set invpaste<cr>:set paste?<cr>

" Turn off that stupid highlight search
nmap <silent> <Leader>n :set invhls<cr>:set hls?<cr>

" Set text wrapping toggles
nmap <silent> <Leader>w :set invwrap<cr>:set wrap?<cr>

" Set up retabbing on a source file
nmap <silent> <Leader>rr :1,$retab<cr>

" cd to the directory containing the file in the buffer
nmap <silent> <Leader>cd :lcd %:h<cr>
nmap <silent> <Leader>md :!mkdir -p %:p:h<cr>

" execute contents of register "
nmap <silent> <Leader>rc :@"<cr>

" saving and resoring session
map <S-F5> :execute "source ".input("Load session: ", "~/.vim/session/", "file")<cr>
map <F5> :execute "mksession! ".input("Save session: ", "~/.vim/session/", "file")\| :echo "Session saved."<CR>

" allow command line editing like emacs
cnoremap <C-A>      <Home>
cnoremap <C-B>      <Left>
cnoremap <C-E>      <End>
cnoremap <C-F>      <Right>
cnoremap <C-N>      <End>
cnoremap <C-P>      <Up>
cnoremap <ESC>b     <S-Left>
cnoremap <ESC><C-B> <S-Left>
cnoremap <ESC>      <S-Right>
cnoremap <ESC><C-F> <S-Right>
cnoremap <ESC><C-H> <C-W>

" buffer key mapping
noremap <silent> <C-Tab> :bnext<cr>
noremap <silent> <C-S-Tab> :bprevious<cr>
noremap <silent> <Leader>ls :ls<cr>
noremap <Leader>bj	:b<Space>

" simplified buffer flipping
noremap <silent> <C-H> :wincmd h<cr>
noremap <silent> <C-L> :wincmd l<cr>
noremap <silent> <C-J> :wincmd j<cr>
noremap <silent> <C-K> :wincmd k<cr>

" re-assign all windows keys
noremap <silent> <Leader>h :wincmd h<cr>
noremap <silent> <Leader>j :wincmd j<cr>
noremap <silent> <Leader>k :wincmd k<cr>
noremap <silent> <Leader>l :wincmd l<cr>

map <Leader>= <C-w>=
noremap <silent> <Leader>sp     :wincmd p<cr>
noremap <silent> <Leader>se     :wincmd =<cr>
noremap <silent> <Leader>sh     :resize +10'<cr>
noremap <silent> <Leader>sh-    :resize -10'<cr>
noremap <silent> <Leader>sv     :vertical resize +10<cr>
noremap <silent> <Leader>sv-    :vertical resize -10<cr>

" close windows
noremap <silent> <Leader>cj :wincmd j<cr>:close<cr>
noremap <silent> <Leader>ck :wincmd k<cr>:close<cr>
noremap <silent> <Leader>ch :wincmd h<cr>:close<cr>
noremap <silent> <Leader>cl :wincmd l<cr>:close<cr>
noremap <silent> <Leader>cc :close<cr>
noremap <silent> <Leader>co :only<cr>

" windows placeme<Leader>t
noremap <silent> <Leader>ml :wincmd L<cr>
noremap <silent> <Leader>mk :wincmd K<cr>
noremap <silent> <Leader>mh :wincmd H<cr>
noremap <silent> <Leader>mj :wincmd J<cr>

noremap <silent> <Leader>bd :bd<cr>
noremap <silent> <Leader>ev :e $HOME/.vim/vimrc<cr>
noremap <silent> <Leader>sov :so $HOME/.vim/vimrc<cr>

noremap <silent> <Leader>^ :setl hls<cr>:let @/="<C-r><C-w>"<cr>
noremap <silent> <Leader>gs :vimgrep /<C-r>// %<cr>:ccl<cr>:cwin<cr><C-W>J:set nohls<cr>
noremap <silent> <Leader>gw :vimgrep /<C-r><C-w>/ %<cr>:ccl<cr><C-W>J:set nohls<cr>
noremap <silent> <Leader>gW :vimgrep /<C-r><C-a>/ %<cr>:ccl<cr><C-W>J:set nohls<cr>

vnoremap <silent> [v	>gv
vnoremap <silent> ]v	<gv

" make Y consistent with C and D
nnoremap Y y$

" Code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

" Shortcuts
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" Fix home and end keybindings for screen, particularly on mac
" - for some reason this fixes the arrow keys too. huh.
map [F $
imap [F $
map [H g0
imap [H g0

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Easier horizontal scrolling
map zl zL
map zh zH

" FIXME: Revert this f70be548
" fullscreen mode for GVIM and Terminal, need 'wmctrl' in you PATH
map <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>


set tags=./tags;/,~/.vimtags

" Make tags placed in .git/tags file available in all levels of a repository
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if gitroot != ''
    let &tags = &tags . ',' . gitroot . '/.git/tags'
endif

" IMPORTANT: Uncomment one of the following lines to force
" using 256 colors (or 88 colors) if your terminal supports it,
" but does not automatically use 256 colors by default.
set t_Co=256
"set t_Co=88
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }

" GVIM- (here instead of .gvimrc)
if has('gui_running')
    set guioptions=aegitcf
    set guioptions-=T           " Remove the toolbar
    set lines=40                " 40 lines of text instead of 24
    set antialias
    if !exists("g:spf13_no_big_font")
        if LINUX() && has("gui_running")
            set guifont=Andale\ Mono\ Regular\ 16,Ubuntu\ Mono\ 12,Menlo\ Regular\ 15,Consolas\ Regular\ 16,Courier\ New\ Regular\ 18
        elseif OSX() && has("gui_running")
            set guifont=Andale\ Mono\ Regular:h16,Monaco:h12,Menlo\ Regular:h15,Consolas\ Regular:h16,Courier\ New\ Regular:h18
        elseif WINDOWS() && has("gui_running")
            set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
        endif
    endif
    if exists("sjb_size_lines")
        exec 'set lines=' . sjb_size_lines
    endif

    if exists("sjb_size_columns")
        exec 'set columns=' . sjb_size_columns
    endif
else
    if &term == 'xterm' || &term == 'screen'
        set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
    endif
    "set term=builtin_ansi       " Make arrow and other keys work
endif

"if has("autocmd") && exists("+omnifunc")
"    autocmd Filetype *
"                \if &omnifunc == "" |
"                \setlocal omnifunc=syntaxcomplete#Complete |
"                \endif
"endif

hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

" Automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menu,preview,longest

if filereadable(expand("~/.vim/vimrc.local"))
    source ~/.vim/vimrc.local
endif

