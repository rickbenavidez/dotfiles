" runtime! autoload/pathogen.vim
" if exists('g:loaded_pathogen')
"   call pathogen#runtime_prepend_subdirectories(expand('~/.vimbundles'))
" end

set nocompatible          " We're running Vim, not Vi!
filetype off
"filetype plugin indent on " Enable filetype-specific indenting and plugins

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Bundles Here
Bundle 'tpope/vim-fugitive'
Bundle 'rails.vim'
Bundle 'ack.vim'
Bundle 'delimitMate.vim'
Bundle 'ragtag.vim'
Bundle 'endwise.vim'
Bundle 'snipMate.vim'
Bundle 'surround.vim'
" Bundle 'vim-peepopen'
Bundle 'kien/ctrlp.vim'
" Bundle 'nathanaelkane/vim-indent-guides.git'
Bundle 'Yggdroot/indentLine.git'
Bundle 'scrooloose/nerdtree.git'
"

" Bundle 'taglist.vim'
" Bundle 'git://git.wincent.com/command-t.git'
Bundle 'vim-coffee-script'

" Allow mouse events to flow through to vim from the terminal
set mouse=a

" NerdTree
let g:NERDTreeWinSize=40
let NERDTreeShowHidden=1

" Set up our taglist
" let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Kill off MacVim's useless toolbar
set guioptions-=T

"""ctrlp.vim"""
let g:ctrlp_working_path_mode = 0
nmap <leader>t :CtrlP<cr>
"RoR CtrlP stuff
nmap <leader>ec :CtrlP app/controllers<cr>
nmap <leader>ea :CtrlP app<cr>
nmap <leader>em :CtrlP app/models<cr>
nmap <leader>ev :CtrlP app/views<cr>

" Enable indent_guides
hi Conceal guifg=lightgray guibg=NONE
hi Conceal ctermfg=gray ctermbg=NONE
let g:indentLine_char = '┆'
" let g:indent_guides_auto_colors = 0 
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_start_level = 2
" let g:indent_guides_guide_size = 1
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=gray   ctermbg=3 
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=gray ctermbg=4 

" Enable project-specific .vimrc files
set exrc
set secure

" Tabs
set tabstop=2
set expandtab
set shiftwidth=2
set autoindent

" Turn on highlighted search and syntax highlighting
" syntax on
set hlsearch
set incsearch

" Make searches case-insensitive
set ignorecase
set smartcase

" General
set novisualbell  " No blinking .
set noerrorbells  " No noise.
" set laststatus=2  " Always show status line.

colorscheme vibrantink
"set guifont=Monaco:h9
set guifont=Menlo:h11
set background=dark

" Tmp Directories
"
set backupdir=/Users/rickb/tmp
set directory=/Users/rickb/tmp
set nobackup
set nowritebackup 
set noswapfile

set cursorline
set nu

filetype plugin indent on     " required!

" If > 7.3 then colorcolumn 80
" if exists('+colorcolumn')
"  set colorcolumn=80
"else
"  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"endif

set synmaxcol=100 " don't even think about coloring long lines
set ttyfast " u got a fast terminal
set ttyscroll=3
set lazyredraw " to avoid scrolling problems"


" Map NERDTreeToggle to convenient key
nmap <leader>n :NERDTreeToggle<cr>
"  
"  " NERDTree config
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\env','\.vim$', '\~$', '\.pyc$', '\.swp$', '\.egg-info$', '^dist$', '^build$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\~$']
" let NERDTreeShowBookmarks=1
let NERDTreeHightlightCursorline=1

" May require ruby compiled in
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete 
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

augroup filetype
  au!
  au! BufRead,BufNewFile *.module set filetype=php
  au BufRead,BufNewFile *.engine set filetype=php
  au BufRead,BufNewFile *.inc set filetype=php
  au BufRead,BufNewFile *.tmpl set filetype=php
  au BufRead,BufNewFile *.mxml set filetype=xml
  au BufRead,BufNewFile *.htm set filetype=html
  au BufRead,BufNewFile *.html set filetype=html
  au BufRead,BufNewFile *.xhtm set filetype=html
  au BufRead,BufNewFile *.xhtml set filetype=html
  au BufRead,BufNewFile *.php3 set filetype=php
  au BufRead,BufNewFile *.php4 set filetype=php
  au BufRead,BufNewFile *.less set filetype=less
  au BufRead,BufNewFile *.less.erb set filetype=less

  au BufRead,BufNewFile *.ejs set filetype=html
  au BufRead *.rhtml set filetype=eruby
  au BufRead *.erb set filetype=eruby
  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END

autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror
