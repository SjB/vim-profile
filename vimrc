" Enable file type detection.
filetype plugin indent on

syntax on

let mapleader = ','

"setlocal spell spelllang=en_ca
"
augroup vala
	au!
	au BufRead,BufNewFile *.{vala,gs,vapi}  setfiletype vala
augroup END

" pathogen.vim
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" default tabs setting
set tabstop=4
set shiftwidth=4
set textwidth=120

" vim setting
"set ch=2 	" Make command line two lines high
"set backspace=eol,indent,start
set cink+=*;
set cpoptions+=$
set fillchars=""
set hidden
set history=100
set hlsearch
set incsearch
set ignorecase
set laststatus=2
set lazyredraw
set matchtime=2
set mousehide
set nobackup
set number
set ruler
set scrolloff=4
set showfulltag
set showmatch
set showmode
set smartcase
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

set diffopt+=iwhite

set path=/usr/include/**
set path=/usr/local/include/**
set path=~/Projects/libs/**

" reset the path when entering a buffer
autocmd BufEnter * set path+=**

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

nmap <silent> <Leader>rc :@"<cr>

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

" simplified buffer flipping
noremap <C-H> :wincmd h<cr>
noremap <C-L> :wincmd l<cr>
noremap <C-J> :wincmd j<cr>
noremap <C-K> :wincmd k<cr>

" re-assign all windows keys
noremap <silent> <Leader>h :wincmd h<cr>
noremap <silent> <Leader>j :wincmd j<cr>
noremap <silent> <Leader>k :wincmd k<cr>
noremap <silent> <Leader>l :wincmd l<cr>

noremap <silent> <Leader>sb :wincmd p<cr>
noremap <silent> <Leader>s= :wincmd =<cr>
noremap <silent> <Leader>sh :resize +10<cr>
noremap <silent> <Leader>sh- :resize -10<cr>
noremap <silent> <Leader>sv :vertical resize +10<cr>
noremap <silent> <Leader>sv- :vertical resize -10<cr>

" close windows
noremap <silent> <Leader>cj :wincmd j<cr>:close<cr>
noremap <silent> <Leader>ck :wincmd k<cr>:close<cr>
noremap <silent> <Leader>ch :wincmd h<cr>:close<cr>
noremap <silent> <Leader>cl :wincmd l<cr>:close<cr>
noremap <silent> <Leader>cc :close<cr>
noremap <silent> <Leader>co :wincmd o<cr>

" windows placeme<Leader>t
noremap <silent> <Leader>ml :wincmd L
noremap <silent> <Leader>mk :wincmd K
noremap <silent> <Leader>mh :wincmd H
noremap <silent> <Leader>mj :wincmd J

noremap <silent> <Leader>bd :bd<cr>
nmap <silent> <Leader>ev :e $HOME/.vim/vimrc<cr>
nmap <silent> <Leader>sv :so $HOME/.vim/vimrc<cr>

nmap <silent> ^ :setl hls<cr>:let @/="<C-r><C-w>"<cr>
nmap <silent> <Leader>gs :vimgrep /<C-r>// %<cr>:ccl<cr>:cwin<cr><C-W>J:set nohls<cr>
nmap <silent> <Leader>gw :vimgrep /<C-r><C-w>/ %<cr>:ccl<cr><C-W>J:set nohls<cr>
nmap <silent> <Leader>gW :vimgrep /<C-r><C-a>/ %<cr>:ccl<cr><C-W>J:set nohls<cr>

"configure window size and colors
if has("gui_running")
	set guioptions=aegirLtc
 	if has("win32")
		set guifont=ProgCleanCo:h8:cOEM
	elseif has("mac")
		set nomacatsui
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
