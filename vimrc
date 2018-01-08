runtime bundle/vim-pathogen/autoload/pathogen.vim

call pathogen#infect()

set ttymouse=xterm

" Use Vim settings, rather then Vi settings.
set nocompatible

filetype  plugin on
filetype  indent on
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

" Use backtick for <esc> for better reach
noremap ` <Esc>
inoremap ` <Esc>
vnoremap ` <Esc>
xnoremap ` <Esc>
cnoremap ` <Esc>
nnoremap ` <Esc>

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

colorscheme distinguished

set foldmethod=syntax
set foldlevel=10
set laststatus=2

function! AckText()
    let text = input('Txt: ')
    let gitroot = system('git rev-parse --show-toplevel')
    execute ":cd " . gitroot
    if text == ""
        echom "No text entered"
        return
    endif
    execute ':Ack ' . text . ' ./'
endfunction

nnoremap <leader>/ :call AckText()<CR>

