set ttymouse=xterm

" Use Vim settings, rather then Vi settings.
set nocompatible

filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


syntax    on            
set autoindent                  " copy indent from current line
set autoread                    " read open files again when changed outside Vim
set autowrite                   " write a modified buffer on each :next , ...
set backspace=indent,eol,start  " backspacing over everything in insert mode
set backup                      " keep a backup file
set backupdir=~/.vimbackup,.
set browsedir=current           " which directory to use for the file browser
set complete+=k                 " scan the files given with the 'dictionary' option
set expandtab
set history=50                  " keep 50 lines of command line history
set hlsearch                    " highlight the last used search pattern
set incsearch                   " do incremental searching
set listchars=tab:>.,eol:\$     " strings to use in 'list' mode
set wrap                        " do not wrap lines
set popt=left:8pc,right:3pc     " print options
set ruler                       " show the cursor position all the time
set shiftwidth=4                " number of spaces to use for each step of indent
set showcmd                     " display incomplete commands
set smartindent                 " smart autoindenting when starting a new line
set tabstop=4                   " number of spaces that a <Tab> counts for
set visualbell                  " visual bell instead of beeping
set wildignore=*.bak,*.o,*.e,*~ " wildmenu: ignore these extensions
set wildmenu                    " command-line completion in an enhanced mode
set cursorcolumn
set cursorline

" The current directory is the directory of the file in the current window.
if has("autocmd")
  autocmd BufEnter * :lchdir %:p:h
endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
if has("autocmd")
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif " has("autocmd")

"Dont lose what we paste
xnoremap p pgvy

" Remap direction keys for standard homerow position
nnoremap j h
nnoremap k j
nnoremap l k
nnoremap ; l

vnoremap j h
vnoremap k j
vnoremap l k
vnoremap ; l

nnoremap L H
nnoremap K L

nnoremap gk gj
nnoremap gl gk

nnoremap <C-l> <C-u>
nnoremap <C-k> <C-d>

nnoremap <C-L> <C-Y>
nnoremap <C-K> <C-E>

nnoremap <C-w>j <C-w>h
nnoremap <C-w>k <C-w>j
nnoremap <C-w>l <C-w>k
nnoremap <C-w>; <C-w>l

nnoremap <C-w>J <C-w>H
nnoremap <C-w>K <C-w>J
nnoremap <C-w>L <C-w>K
nnoremap <C-w>: <C-w>L

" More reachable beggining/end of line
nnoremap h ^
nnoremap ' $

vnoremap h ^
vnoremap ' $

nnoremap w :silent execute ":normal! /\[a-zA-Z0-9\]\\+\n:noh\n"
vnoremap w :silent execute ":normal! /\[a-zA-Z0-9\]\\+\n:noh\n"

nnoremap ∆ 10h
nnoremap ˚ 10j
nnoremap ¬ 10k
nnoremap … 10l

vnoremap ∆ 10h
vnoremap ˚ 10j
vnoremap ¬ 10k
vnoremap … 10l

set foldmethod=syntax
set foldlevel=10
set laststatus=2

