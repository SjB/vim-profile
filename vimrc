" fix ubuntu filetype bug
filetype off

" pathogen.vim
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Enable filetype detection.
set filetype=on
filetype plugin on
filetype indent on

" Make sure syntax in on
syntax on

" Change mapleader key
let mapleader = ','

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
set path+=~/Projects/libs/**

" reset the path when entering a buffer
autocmd BufEnter * set path+=**

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

" set status line
set stl=%<%f\ %(\ [%M%R%H%W%Y,%{&ff}]%)\ %{MinScmStatus()}%=[L:%l\ C:%c]\ %L[%2p%%]\ Buf:\ #%02n\ [%3b][0x%02B]

" make helpgrep easier to access
cnoreabbrev H helpgrep

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
noremap <Leader>b	:b<Space>

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

" NERD_tree setting
let NERDTreeQuitOnOpen=0
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2

" map F12 to Toggle NERD Tree view
noremap <silent> <F12> :NERDTreeToggle<cr>
inoremap <silent> <F12> :NERDTreeToggle<cr>

noremap <silent> <Leader>nt :NERDTreeToggle<cr>

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

" xptemplate setting
let g:xptemplate_brace_complete=''
let g:xptemplate_strict=0

" trailing-whitespace setting
noremap <silent> <Leader>tw :FixWhitespace<cr>
noremap <silent> <Leader>tws :highlight link ExtraWhitespace Search<cr>
noremap <silent> <Leader>twh :highlight link ExtraWhitespace None<cr>

" devhelp 
let g:devhelpWordLength=4
let g:devhelpAssistant=0
let g:devhelpSearch=1

" looks
let g:looks = {}
let g:looks.dark = {
	\ '_map': 'd',
	\ ':set': 'background=dark',
	\ ':colorscheme': "ir_black"
	\ }

let g:looks.normal= {
	\ '_map': 'n',
	\ ':colorscheme': "dusk"
	\ }

let g:looks.tango = {
	\ '_map': 't',
	\ ':colorscheme': "tango2",
	\ '&cursorline': 1
	\ }

let g:looks.light = {
	\ '_map': 'l',
	\ ':colorscheme': 'eclipse'
	\ }

let g:looks.solorize = {
	\ '_map': 's',
	\ ':set': 'background=light',
	\ ':colorscheme': 'solarized'
	\ }
let g:looks.pigraph = {
	\ '_map': 'p',
	\ ':colorscheme': 'pigraph'
	\ }

let g:snips_author = 'Steve Beaulac <sjb@beaulac.me>'
let g:localvimrc_ask = 0

