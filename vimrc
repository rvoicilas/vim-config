" use vim defaults
set nocompatible

" pathogen settings
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" pathogen doesn't correctly pick up ftdetect directories in plugins
" for me this used to happen with the vim-clojure plugin
filetype off

"
filetype plugin indent on

" number of commands and search patterns to save
set history=5000

" enable numbers
set nu

" show control characters
set binary

" do no auto indent
set noautoindent

" align to standard indent when shifting with < and >
set shiftround

" change with F11
set background=dark
map <silent><F11> :let &background=(&background == "dark" ? "light" : "dark")<cr>

" use syntax color higlighting
syntax on

" smoother display on fast network connections
set ttyfast

" allow most motion keys to wrap
set whichwrap=b,s,<,>,[,],~

" allow backspace over indent, eol and start of insert
set backspace=indent,eol,start

" incremental search
set incsearch

" use only one space when using joing
set nojoinspaces

" add the following chars to the list that form pairs
set matchpairs+={:}

" show matching brackets by flickering cursor
set showmatch

" show matching brackets quicker than default
set matchtime=1

" automatically read file changed outside vim
set autoread

" automatically save before commands like :next and :make
set autowrite

" open new split window below the current one
set splitbelow

" dunno !?
set winminheight=0

" do not resize windows on split/close
set noequalalways

" show partial command in status line
set showcmd

" skip bytecode files for filename completion
set suffixes+=.pyc

" do not skip files from filename completion
set suffixes-=.h

" wrap long lines
set wrap

" smooth scroll
set sidescroll=1

" swap file locations
set dir=/tmp " maybe even ~/tmp ?

" allow visual block select everywhere
set virtualedit=block

" always show statusline
set laststatus=2

set statusline=%n\ %1*%h%f%*\ %=%<[%3lL,%2cC]\ %2p%%\ 0x%02B%r%m
set statusline+=\ %{fugitive#statusline()}

" show ruler
set ruler
set rulerformat=%h%r%m%=%f

" highlight the current search pattern
set hlsearch

" show the current filename and path in the term title
set title

" highlight end of the line whitespace
"highlight WhitespaceEOL ctermbg=red guibg=red
"match WhitespaceEOL /\s\+$/

" default tab settings
set tabstop=4
set shiftwidth=4
set expandtab

" python tab settings
autocmd filetype python set tabstop=4 | set shiftwidth=4 | set expandtab | set textwidth=80 | set softtabstop=4 | set smartindent | set smarttab

" other python settings
nmap <F5> oimport pdb; pdb.set_trace()<esc>

" vim clojure settings
let vimclojure#HighlightBuiltins=1
let vimclojure#ParenRainbow=1

" ack.vim settings
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" easy indentation in visual mode
" this keeps the visual selection active after indenting, which is usually lost
" after you indent it
vmap > >gv
vmap < <gv

" Use display movement with arrow keys for extra precision. Arrow keys will
" move up and down the next line in the display even if the line is wrapped.
" This is useful for navigating very long lines that you often find with
" automatically generated text such as HTML.
" This is not useful if you turn off wrap.
imap <up> <C-O>gk
imap <down> <C-O>gj
nmap <up> gk
nmap <down> gj
vmap <up> gk
vmap <down> gj

" bring up nerdtree on <F4>
nmap <silent><F4> :NERDTreeToggle <cr>

" compile current latex file and open up okular after it has been converted to
" pdf
nmap <silent><F10> :!latex % && pdflatex % && okular %:r.pdf <cr>

" for vim version 7 or greater
if version >= 700
    " set number width
    set numberwidth=4

    " spell check on <F2>
    map <silent><F2> <esc>:set spell!<cr>
    map <silent><leader>s <esc>:set spell!<cr>
endif

if has("gui_running")

    " colors
    " solarized with a light background for gvim
    set background=light
    colorscheme solarized

    " change cwd to the current file that's being edited (each time)
    set autochdir

    " no need for the menu bar, scrollbar or toolbar in the gui
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=R

endif
