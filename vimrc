" fix ubuntu filetype bug
set nocompatible
filetype off

" Change mapleader key
let mapleader = ','

" CtrlP setting
let g:ctrlp_map = '<c-space>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                          \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']

" NERD_tree setting
let NERDTreeQuitOnOpen=0
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2

let g:localvimrc_ask = 0

let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" devhelp 
let g:devhelpWordLength=4
let g:devhelpAssistant=0
let g:devhelpSearch=1

if !has("gui")
	let g:CSApprox_loaded = 1
endif

"configure window size and colors
if has("gui_running")
	set guioptions=aegitc
 	if has("win32")
		set guifont=ProgCleanCo:h8:cOEM
	elseif has("mac")
		set antialias
		set guifont=Monaco:h12
	else
		set antialias
		set guifont=Nimbus\ Mono\ L\ 10
	endif
	if exists("sjb_size_lines")
		exec 'set lines=' . sjb_size_lines
	endif

	if exists("sjb_size_columns")
		exec 'set columns=' . sjb_size_columns
	endif
endif
:nohls

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

"Vundle manage vim plugins
" Github repos
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/snipmate-snippets'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-flatfoot'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-ragtag'
Bundle 'godlygeek/csapprox'
Bundle 'godlygeek/tabular'
Bundle 'SjB/refactor'
Bundle 'SjB/devhelp.vim'
Bundle 'SjB/gtk-vim-syntax'
Bundle 'noahfrederick/vim-hemisu'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'kien/ctrlp.vim'
Bundle 'anzaika/go.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'gregsexton/MatchTag'
Bundle 'yazug/vim-taglist-plus'
Bundle 'tomtom/tcomment_vim'
Bundle 'SirVer/ultisnips'
Bundle 'jeetsukumaran/vim-buffersaurus'
Bundle 'altercation/vim-colors-solarized'
Bundle 'wesgibbs/vim-irblack'
Bundle 'pangloss/vim-javascript'
Bundle 'fmeyer/vim-pigraph'
Bundle 'vimoutliner/vimoutliner'
"Bundle 'majutsushi/tagbar'

" vim-script repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'bufkill.vim'
Bundle 'localvimrc'
Bundle 'matchit.zip'
Bundle 'pythoncomplete'
Bundle 'python_match.vim'
Bundle 'a.vim'
Bundle 'bufexplorer.zip'
Bundle 'delimitMate.vim'
Bundle 'IndexedSearch'
Bundle 'argtextobj.vim'
Bundle 'looks'
Bundle 'YankRing.vim'

" non-GitHub repos
" Bundle 'git://git.wincent.com/command-t.git' "Requires Ruby

" Enable filetype detection.
set filetype=on
filetype plugin on
filetype indent on

" Make sure syntax in on
syntax on

runtime ftplugin/man.vim

" Set spell language
"setlocal spell spelllang=en_ca
set dictionary=/usr/share/dict/words

" default tabs setting
set tabstop=4
set shiftwidth=4
set softtabstop=4 
set textwidth=79

" vim setting
"set ch=2 	" Make command line two lines high
"set backspace=eol,indent,start
"set background=light
set autoindent
set cink+=*;
set cpoptions+=$d
set fillchars=""
set hidden
set history=100
set hlsearch
set incsearch
set ignorecase
set laststatus=2
set lazyredraw
set matchtime=2
set nobackup
set number
" set ruler
set scrolloff=4
set showfulltag
set showmatch
set showmode
set smartcase
set smartindent
set showcmd
set synmaxcol=2048
set timeoutlen=500
"set virtualedit=all
set wildmenu
set wrapscan

set wildignore+=*.o,*.obj,*.exe,*.bak

" completion settings
set complete=.,w,b,t,i,kspell

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

" window specific setting
if has("win32")
	set clipboard=unnamed
	set shellslash
endif

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
set statusline+=%{SyntasticStatuslineFlag()}
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
cnoremap <C-A>		<Home>
cnoremap <C-B>		<Left>
cnoremap <C-E>		<End>
cnoremap <C-F>		<Right>
cnoremap <C-N>		<End>
cnoremap <C-P>		<Up>
cnoremap <ESC>b		<S-Left>
cnoremap <ESC><C-B>	<S-Left>
cnoremap <ESC>f		<S-Right>
cnoremap <ESC><C-F>	<S-Right>
cnoremap <ESC><C-H>	<C-W>

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

noremap <silent> <Leader>sp :wincmd p<cr>
noremap <silent> <Leader>se :wincmd =<cr>
noremap <silent> <Leader>sh 	:resize +10'<cr>
noremap <silent> <Leader>sh- 	:resize -10'<cr>
noremap <silent> <Leader>sv 	:vertical resize +10<cr>
noremap <silent> <Leader>sv- 	:vertical resize -10<cr>

" close windows
noremap <silent> <Leader>cj :wincmd j<cr>:close<cr>
noremap <silent> <Leader>ck :wincmd k<cr>:close<cr>
noremap <silent> <Leader>ch :wincmd h<cr>:close<cr>
noremap <silent> <Leader>cl :wincmd l<cr>:close<cr>
noremap <silent> <Leader>cc :close<cr>
noremap <silent> <Leader>co :only<cr>

" windows placeme<Leader>t
noremap <silent> <Leader>ml :wincmd L
noremap <silent> <Leader>mk :wincmd K
noremap <silent> <Leader>mh :wincmd H
noremap <silent> <Leader>mj :wincmd J

noremap <silent> <Leader>bd :bd<cr>
noremap <silent> <Leader>ev :e $HOME/.vim/vimrc<cr>
noremap <silent> <Leader>sov :so $HOME/.vim/vimrc<cr>

noremap <silent> <Leader>^ :setl hls<cr>:let @/="<C-r><C-w>"<cr>
noremap <silent> <Leader>gs :vimgrep /<C-r>// %<cr>:ccl<cr>:cwin<cr><C-W>J:set nohls<cr>
noremap <silent> <Leader>gw :vimgrep /<C-r><C-w>/ %<cr>:ccl<cr><C-W>J:set nohls<cr>
noremap <silent> <Leader>gW :vimgrep /<C-r><C-a>/ %<cr>:ccl<cr><C-W>J:set nohls<cr>

vnoremap <silent> [v	>gv
vnoremap <silent> ]v	<gv

" bundle settings
" ===============

noremap <Leader>= :call Preserve("normal gg=G")<cr>
"noremap <Leader>$ :call Perserve("%s/\\s\\+$//e")<cr>

" FuzzyPrototypefinder plugin setting
noremap <Leader>fpc :FuzzyPrototypeFinderClass<cr>
noremap <Leader>fpg :FuzzyPrototypeFinderGlobal<cr>
noremap <Leader>fpm :FuzzyPrototypeFinderFunction<cr>

" Intellizense
noremap <silent> <Leader>I :Intellisense<cr>

" map F12 to Toggle NERD Tree view
noremap <silent> <F12> :NERDTreeToggle<cr>
inoremap <silent> <F12> :NERDTreeToggle<cr>

noremap <silent> <Leader>nt :NERDTreeToggle<cr>

" explorer mappings
nnoremap <F11> :BufExplorer<cr>
nnoremap <F10> :TagbarToggle<cr>

" make Y consistent with C and D
nnoremap Y y$

" omnicppcomplete setting
"set completeopt=menuone
let g:OmniCpp_GlobalScopeSearch=1
let g:OmniCpp_NamespaceSearch=1
let g:OmniCpp_DisplayMode=0
let g:OmniCpp_ShowScopeInAbbr=1
let g:OmniCpp_ShowPrototypeInAbbr=1
let g:OmniCpp_ShowAccess=1
let g:OmniCpp_DefaultNamespaces=["std"]
let g:OmniCpp_MayCompleteDot=1
let g:OmniCpp_MayCompleteArrow=1
let g:OmniCpp_MayCompleteScope=1
let g:OmniCpp_SelectFirstItem=0

" vim-fuzzyfinder setting
nnoremap <silent> <Leader>ff :FufFile<cr>
nnoremap <silent> <Leader>fF :FufFile!<cr>
nnoremap <silent> <Leader>fb :FufBuffer<cr>
nnoremap <silent> <Leader>fB :FufBuffer!<cr>
nnoremap <silent> <Leader>ft :FufTag<cr>
nnoremap <silent> <Leader>fT :FufTag!<cr>
nnoremap <silent> <Leader>fo :FufJumpList<cr>
nnoremap <silent> <Leader>fg :FufLine<cr>
nnoremap <silent> <Leader>fh	:FufHelp<cr>
nnoremap <silent> <Leader>fc	:FufQuickfix<cr>
nnoremap <silent> <Leader>f:	:FufMruCmd<cr>
nnoremap <silent> <Leader>fu :FufBookmarkFile<cr>
nnoremap <silent> <Leader>fua :FufBookmarkFileAdd<cr>
nnoremap <silent> <Leader>f<C-]> :FufTagWithCursorWord!<CR>
nnoremap <silent> <Leader>f,     :FufBufferTag<CR>
nnoremap <silent> <Leader>f<     :FufBufferTag!<CR>
vnoremap <silent> <Leader>f,     :FufBufferTagWithSelectedText!<CR>
vnoremap <silent> <Leader>f<     :FufBufferTagWithSelectedText<CR>
nnoremap <silent> <Leader>f}     :FufBufferTagWithCursorWord!<CR>
nnoremap <silent> <Leader>f.     :FufBufferTagAll<CR>
nnoremap <silent> <Leader>f>     :FufBufferTagAll!<CR>
vnoremap <silent> <Leader>f.     :FufBufferTagAllWithSelectedText!<CR>
vnoremap <silent> <Leader>f>     :FufBufferTagAllWithSelectedText<CR>
nnoremap <silent> <Leader>f]     :FufBufferTagAllWithCursorWord!<CR>
nnoremap <silent> <Leader>fe     :FufTaggedFile<CR>
nnoremap <silent> <Leader>fE     :FufTaggedFile!<CR>

" Tlist setting
" let Tlist_Show_One_File=1

nnoremap <silent> <Leader>tl	:TlistToggle<cr>

" trailing-whitespace setting
noremap <silent> <Leader>tw :FixWhitespace<cr>
noremap <silent> <Leader>tws :highlight link ExtraWhitespace Search<cr>
noremap <silent> <Leader>twh :highlight link ExtraWhitespace None<cr>

" looks <leader>o
let g:looks = {}
let g:looks.dark = {
	\ '_map': 'd',
	\ ':set': 'background=dark'
	\ }

let g:looks.light = {
	\ '_map': 'l',
	\ ':set': 'background=light'
	\ }

let g:looks.dusk= {
	\ '_map': 'n',
	\ ':colorscheme': "dusk"
	\ }

let g:looks.tango = {
	\ '_map': 't',
	\ ':colorscheme': "tango2",
	\ '&cursorline': 1
	\ }

let g:looks.solorize = {
	\ '_map': 's',
	\ ':colorscheme': 'solarized'
	\ }

let g:looks.pigraph = {
	\ '_map': 'p',
	\ ':colorscheme': 'pigraph'
	\ }

let g:looks.hemisu = {
	\ '_map': 'h',
	\ ':colorscheme': 'hemisu'
	\ }

