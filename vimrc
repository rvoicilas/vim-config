" use vim defaults
set nocompatible

" pathogen settings
call pathogen#infect()

"
filetype plugin indent on

" number of commands and search patterns to save
set history=5000

" make tabs, trailing whitespace, and EOL characters easy to spot.
set list
set listchars=tab:▸\ ,trail:·,eol:¬

" enable numbers
set number

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

set noswapfile

" allow visual block select everywhere
set virtualedit=block

" always show statusline
set laststatus=2

set statusline=%n\ %1*%h%f%*\ %=%<[%3lL,%2cC]\ %2p%%\ 0x%02B%r%m
set statusline+=\ %{fugitive#statusline()}

" show ruler
set ruler
set rulerformat=%h%r%m%=%f

" do not highlight the current search pattern
set nohlsearch

set lazyredraw

" show the current filename and path in the term title
set title

" string to put at the start of lines that have been wrapped
set showbreak=↪

" ignore files in nerdtree by extension
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeHighlightCursorLine = 1
let NERDChristmasTree = 1
let NERDTreeChDirMode = 2

" Wildmenu completion
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn
set wildignore+=*.pyc,*.class
set wildignore+=*.orig

" default tab settings
set tabstop=4
set shiftwidth=4
set expandtab

autocmd filetype ruby set autoindent tabstop=2 shiftwidth=2 softtabstop=2

" python tab settings
autocmd filetype python set tabstop=4 | set shiftwidth=4 | set expandtab | set textwidth=79 | set softtabstop=4 | set smarttab

" other python settings
nmap <F5> oimport IPython; IPython.embed()<esc>
nmap <F6> oimport ipdb; ipdb.set_trace()<esc>

" python mode settings
let g:pymode_lint_checker = "pep8,pyflakes"
let g:pymode_lint_on_write = 0 " do not check code every save
let g:pymode_lint_unmodified = 0
let g:pymode_lint_on_fly = 0
let g:pymode_lint_cwindow = 0 " do not open cwindow if errors are found
let g:pymode_lint_ignore = "E126,E127,E128" " continuation line over/under-indented
let g:pymode_rope_lookup_project = 0 " do not search for .ropeproject
let g:pymode_rope_regenerate_on_write = 0 " rope does not regenerate project cache on every save
let g:pymode_rope_completion = 0
let g:pymode_folding = 0 " no default code folding
let g:pymode_utils_whitespaces = 0 " do not remove unused whitespaces by default
let g:pymode_syntax_space_errors = 0
let g:pymode_indent = 0 " trust the above settings, rather than pymode's
let g:pymode_run = 0 " the run script is disabled
let g:pymode_virtualenv = 0 " virtualenv support disabled
let g:pymode_options_indent = 0 " no default options for python buffers
let g:pymode_options_other = 0 " same as above
let g:pymode_breakpoint = 0 " do not load breakpoint plugin so that the breakpoint key (<leader>b) doesn't override Command-T's buffer key
let g:pymode_trim_whitespaces = 0
let g:pymode_options_colorcolumn = 0

" PyLint key mapping
nmap <silent><F7> :PymodeLint<CR>
nmap <silent><F8> :sign unplace *<CR>

" ack.vim settings
let g:ackprg="ag --nocolor --nogroup --column"

" tagbar map
nmap <silent><F9> :TagbarToggle<CR>

" git-vim like bindings for fugitive
nmap <leader>gd :Gdiff<cr>
nmap <leader>gs :Gstatus<cr>
nmap <leader>gb :Gblame<cr>

" gitv settings
let g:Gitv_CommitStep = 50 " commits should do it
let g:Gitv_OpenHorizontal = 0
let g:Gitv_WipeAllOnClose = 1
let g:Gitv_OpenPreviewOnLaunch = 0
nmap <leader>gv :Gitv --all<cr>

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

nnoremap ,, <c-^>

" for vim version 7 or greater
if version >= 700
    " set number width
    set numberwidth=4
endif

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" colorscheme
set background=dark
" let g:badwolf_html_link_underline = 0
" let g:badwolf_darkgutter = 1
" let g:badwolf_tabline = 3
colorscheme atom-dark-256

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'badwolf'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" fzf
set rtp+=~/.fzf
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:fzf_layout = {'down': '~20%'}
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>a :Ag<CR>

" GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" load specific settings
if filereadable(expand("$HOME/.vim/specific.vim"))
    source $HOME/.vim/specific.vim
endif
