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

filetype plugin indent on
syntax on
set mouse=a
set mousehide
scriptencoding utf-8

if &encoding ==# 'latin1' && has('gui_running')
    set encoding=utf-8
endif

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

if !WINDOWS()
    set shell=/bin/zsh
endif

set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=50                    " Store a ton of history (default is 20)
set spell                           " Spell checking on
set hidden                          " Allow buffer switching without saving
set showtabline=0

if has('persistent_undo')
    set undofile                " So is persistent undo ...
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

set tabpagemax=15               " Only show 15 tabs
set cursorline                  " Highlight current line

highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode


if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    " Selected characters/lines in visual mode
endif

if has("cryptv")
    set cryptmethod=blowfish
endif

" Set spell language
"setlocal spell spelllang=en_ca
set dictionary=/usr/share/dict/words

set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows

set number                      " Line numbers on
set numberwidth=5
set showmode                    " Display the current mode
set showcmd                     " Show partial commands in status line and
set cmdheight=1
set scrolloff=4
set scrolljump=5                " Lines to scroll when cursor leaves screen
set sidescrolloff=2
set laststatus=2
set ttyfast
"set lazyredraw
set re=1


set incsearch                   " Find as you type search
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set hlsearch                    " Highlight search terms
set gdefault                    " Substitute all matches in a line by default

set cindent
set cinoptions=l1,j1
set showmatch                   " Show matching brackets/parenthesis
set matchtime=3

set wildmenu                    " Show list instead of just completing
set wildignore+=*.o,*.obj,*.exe,*.bak,*.pyc,*.sass-cache,tmp,*.~
set winminheight=0              " Windows can be 0 line high
set wildmode=longest:full,list:full
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too

"set list
"set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set formatoptions-=t

" default tabs setting
set tabstop=4
set shiftwidth=4
set softtabstop=4 
set smarttab
"set expandtab
set complete-=i

set nowrap
set nojoinspaces
set splitright
set splitbelow
set textwidth=79

" vim setting
"set ch=2 	" Make command line two lines high
"set backspace=eol,indent,start
"set background=light
set cink+=*;
set cpoptions+=$d
set fillchars=""

set nobackup
set nowritebackup
set noswapfile
set directory=/tmp

set synmaxcol=120
set ttimeout
set ttimeoutlen=100

" These commands open folds
set foldenable                  " Auto fold code
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" Set diff mode to ingnore white space
set diffopt+=iwhite

" Set vim search path
set path=/usr/include/**
set path+=/usr/local/include/**
set path+=~/Projects/lib/**

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
" autocmd BufEnter * set path+=**

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

autocmd filetype svn,*commit* setlocal spell
autocmd GuiEnter * set background&
autocmd BufReadPost quickfix map <buffer> <leader>qq :cclose<cr>|map <buffer> <c-p> <up>|map <buffer> <c-n> <down>

au BufRead,BufNewFile *.definition set filetype=xml
au BufRead,BufNewFile packages.*.config set filetype=xml
au BufRead,BufNewFile packages.config set filetype=xml
au BufRead,BufNewFile *.es6 set filetype=javascript

" Remember info about open buffers on close
set viminfo^=%

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
            set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h11:cANSI,Courier_New:h10
        endif
    endif
else
	" IMPORTANT: Uncomment one of the following lines to force
	" using 256 colors (or 88 colors) if your terminal supports it,
	" but does not automatically use 256 colors by default.
	set t_Co=256
	set t_ut=
	"set t_Co=88
endif

if filereadable(expand("~/.vim/vimrc.local"))
    source ~/.vim/vimrc.local
endif

if filereadable(expand("~/.vim/vimrc.bindings"))
    source ~/.vim/vimrc.bindings
endif
