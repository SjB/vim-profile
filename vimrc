" Enable file type detection.
filetype plugin indent on

" pathogen.vim
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" vim setting
set incsearch
set ruler
set showmatch
set matchtime=2
set nobackup
set number
set scrolloff=4

set cink+=*;
set path+=include

set wildignore+=*.o,*.obj,*.exe,*.bak

autocmd BufEnter * set path+=**

if has("win32")
	set clipboard=unnamed
endif

" set status line
set statusline=%<%F\ %w%r%y[%{&ff}]%m\%=\ %l,%v\ \ %p%%\ %L

" remap vim commands
inoremap <silent> <C-B> i_CTRL_O
inoremap <silent> <C-V> i_CTRL_O v

" map Tab navigation 
map <unique> <C-left> :tabp<CR>
map <unique> <C-right> :tabn<CR>

" F9  - Run external make command
noremap <silent> <f9> :echo "Running make..."<cr>:sil! make<cr>:cw<cr>:redraw!<cr>:echo "Make complete."<cr>

" omni complete quick shortcut key
imap <C-space> <C-X><C-O>

au BufRead,BufNewFile *.{vala,gs,vapi}  setfiletype vala

" simplified buffer flipping
map <C-H> <C-W>h
map <C-L> <C-W>l
map <C-J> <C-W>j
map <C-K> <C-W>k
