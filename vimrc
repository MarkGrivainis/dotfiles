set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plugin 'xuyuanp/nerdtree-git-plugin'

"Plugin 'scrooloose/syntastic'
Plugin 'w0rp/ale'

"Plugin 'davidhalter/jedi-vim'

Plugin 'jmcantrell/vim-virtualenv'

Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-surround'

Plugin 'bling/vim-airline'

Plugin 'vim-airline/vim-airline-themes'

Plugin 'easymotion/vim-easymotion'

Plugin 'airblade/vim-gitgutter'

Plugin 'sirver/ultisnips'

Plugin 'honza/vim-snippets'

Plugin 'mattn/emmet-vim'

Plugin 'flazz/vim-colorschemes'

Plugin 'scrooloose/nerdcommenter'

Plugin 'valloric/youcompleteme'

Plugin 'ervandew/supertab'

Plugin 'kien/ctrlp.vim'

Plugin 'jaxbot/semantic-highlight.vim'

Plugin 'lilydjwg/colorizer'

Plugin 'lervag/vimtex'

Plugin 'posva/vim-vue'

Plugin 'majutsushi/tagbar'

call vundle#end()            " required
filetype plugin indent on    " required



let mapleader="," "leader character used when doing shorcuts
set hidden "hide buffers instead of closing them

"set guioptions -=r
"set guioptions -=L

set undofile   " Maintain undo history between sessions
set undodir=~/.vim/undodir

set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
" allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
"    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
"    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=200         " remember more commands and search history
set undolevels=200      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep


"Get the filetype"
filetype plugin indent on
if has('autocmd')
  "Expand tab in python files"
  autocmd filetype python set expandtab
  autocmd filetype typescript set expandtab
endif

if &t_Co >= 256 || has("gui_running")
  set background=dark
  augroup SpellCheck
    autocmd!
    autocmd ColorScheme * highlight SpellBad cterm=underline ctermfg=red
          \ | highlight SpellRare cterm=underline ctermfg=red
          \ | highlight SpellCap cterm=underline ctermfg=red
          \ | highlight SpellLocal cterm=underline ctermfg=red
  augroup END
  colorscheme gruvbox
endif

if &t_Co > 2 || has("gui_running")
  " switch syntax highlighting on, when the terminal has colors
  syntax on
endif

set expandtab

"Show whitespace characters"
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

set wildmenu "show all options when using menus"

if has('autocmd')
  autocmd filetype html,xml set listchars-=tab:>.
endif

set pastetoggle=<F2> "for pasting large amounts of text without formatting"

nnoremap ; :

"stop being a noob"
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  :bp<cr>
nnoremap <right> :bn<cr>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>

"natural scrolling"
nnoremap j gj
nnoremap k gk

"change windows"
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"clear search history using ,/"
nmap <silent> ,/ :nohlsearch<CR>

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltisnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let g:ultisnips_python_style = "sphinx"



" For YouCompleteMe messes
set shortmess+=c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Useful mappings for managing tabs
"map <A-D-Right> :tabnext<cr>
"map <A-D-Left> :tabprevious<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
" Remember info about open buffers on close
"set viminfo^=%


map <F3> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

let g:NERDDefaultAlign = 'left'
let NERDSpaceDelims=1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set term=xterm-256color

set novisualbell

map <silent> <F11>
      \    :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>


set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

let g:ale_fixers = {
      \  'python': ['black'],
      \ 'vue': ['prettier'],
      \ 'markdown': ['prettier'],
      \ 'javascript': ['prettier'],
      \ 'cpp': ['clang-format'],
      \ 'typescript': ['prettier', 'xo']
      \}
let g:ale_linters = {
        \ 'python': ['mypy', 'flake8', 'pylint'],
        \ 'markdown': ['proselint', 'writegood', 'alex', 'markdownlint'],
        \ 'vue': ['eslint', 'vls', 'xo'],
        \ 'javascript': ['eslint', 'tsserver', 'xo'],
        \ 'typescript': ['eslint', 'tsserver', 'xo']
      \}
" , 'pyls']
let g:ale_fix_on_save = 1

let g:ale_javascript_prettier_options = "--prose-wrap always"
let g:ale_javascript_eslint_options = "--ext vue"

nmap <silent> <Up> <Plug>(ale_previous_wrap)
nmap <silent> <Down> <Plug>(ale_next_wrap)

let g:ale_python_black_options = '-l 79 -t py36'
"let g:ale_completion_enabled = 1

set colorcolumn=79

" Some variables need default value
if !exists("g:snips_author")
  let g:snips_author = "Mark Grivainis"
endif

if !exists("g:snips_email")
  let g:snips_email = "mark.grivainis@fenyolab.org"
endif

if !exists("g:snips_github")
  let g:snips_github = "https://github.com/MarkGrivainis"
endif

"let g:black_linelength = 79


let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
"let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#ale#enabled = 1
set laststatus=2

"Save when focus changes
autocmd BufLeave,FocusLost * silent! wall

"Stop  Ctrl-P from looking
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|env)|(\.(swp|ico|git|svn))$'
let g:ctrlp_show_hidden = 1

let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_python_binary_path = '/usr/bin/python3'
"let g:ycm_server_python_interpreter = '/usr/bin/python3'
"
nnoremap <Leader>s :SemanticHighlightToggle<cr>
let g:semanticTermColors = [28,1,2,3,4,5,6,7,25,9,10,34,12,13,14,15,61,125,124,158]

set spelllang=en_us
autocmd BufRead,BufNewFile *.markdown setlocal spell





