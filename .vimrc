set nocompatible          " We're running Vim, not Vi!
filetype off
"filetype plugin indent on " Enable filetype-specific indenting and plugins

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" http://tilvim.com/2013/05/20/vim-and-rbenv.html
let g:ruby_path = system('echo $HOME/.rbenv/shims')

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Bundles Here
Bundle 'ack.vim'
Bundle 'delimitMate.vim'
Bundle 'ragtag.vim'
Bundle 'endwise.vim'

Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'

Bundle 'surround.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'Yggdroot/indentLine.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'briancollins/vim-jst'
Bundle 'bronson/vim-trailing-whitespace'

" tpope is the man
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-rbenv'

" Important if you're using zsh since
" you need paths to work properly for vim-rspec
" https://coderwall.com/p/w7fnxa
Bundle 'thoughtbot/vim-rspec'

"
" Bundle 'taglist.vim'
" Bundle 'git://git.wincent.com/command-t.git'
Bundle 'vim-coffee-script'
Bundle 'bling/vim-airline'

let g:airline_powerline_fonts = 1

" Allow mouse events to flow through to vim from the terminal
set mouse=a

" NerdTree
let g:NERDTreeWinSize=40
let NERDTreeShowHidden=1
let NERDTreeChDirMode=0 
let NERDTreeDirArrows=1
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

" Rspec.vim mappings
map <Leader>f :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Enable indent_guides
hi Conceal guifg=lightgray guibg=NONE
hi Conceal ctermfg=gray ctermbg=NONE
" let g:indentLine_char = '┆'
let g:indentLine_color_term = 239
" let g:indent_guides_auto_colors = 0 
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_start_level = 2
" let g:indent_guides_guide_size = 1
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=gray   ctermbg=3 
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=gray ctermbg=4 

" Code Folding
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" Enable project-specific .vimrc files
set exrc
set secure

" Tabs
set tabstop=2
set expandtab
set shiftwidth=2
set autoindent

" Don't let go of visual selection
" automatically after shifting indentation
" http://vim.wikia.com/wiki/Shifting_blocks_visually
vnoremap > >gv
vnoremap < <gv

" Store a crapton of history
set history=1000

" Turn on highlighted search and syntax highlighting
syntax enable
set hlsearch
set incsearch

" Make searches case-insensitive
set ignorecase
set smartcase

" General
set novisualbell  " No blinking .
set noerrorbells  " No noise.
" set laststatus=2  " Always show status line.

set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termtrans = 1

colorscheme vibrantink
"set guifont=Monaco:h9
set guifont=Menlo:h11


" Tmp Directories
set backupdir=/Users/rickb/tmp
set directory=/Users/rickb/tmp
set nobackup
set nowritebackup 
set noswapfile

" Cursor line can cause perf problems :(
set nocursorline

" We like numbered lines
set nu

set encoding=utf-8

filetype plugin indent on     " required!

" If > 7.3 then colorcolumn 80
" if exists('+colorcolumn')
"  set colorcolumn=80
"else
"  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"endif

" set synmaxcol=100 " don't even think about coloring long lines
set ttyfast " u got a fast terminal
set ttyscroll=3
set lazyredraw " to avoid scrolling problems"

" Tabs
" ctrl-t makes a new tab
" noremap <C-t> <Esc>:tabnew<CR>

" shift T turns a split window into it's own tab
noremap <S-T> <Esc><C-w>T

" ctrl h and l moves left and right between tabs
noremap <C-h> <Esc>rr<CR>
noremap <C-l> <Esc>gt<CR>

" Remap escape to 'jj'
inoremap jj <ESC>

" Map NERDTreeToggle to convenient key
nmap <leader>n :NERDTreeToggle<cr>
"  
"  " NERDTree config
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\env','\.vim$', '\~$', '\.pyc$', '\.swp$', '\.egg-info$', '^dist$', '^build$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\~$']
" let NERDTreeShowBookmarks=1
" let NERDTreeHightlightCursorline=1
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
nmap ww <C-w><C-w>

nmap tt :tabn<CR>
nmap pt  :tabp<CR>

nmap qq :q<CR>
nmap ss :w<CR>
nmap qw :q!<CR>


" Vimtabs (thanks @nmeans)
map ,<Right> <ESC>:tabnext<CR>
map ,<Left> <ESC>:tabprev<CR>
" map <C-t> <ESC>:tabnew<CR>
map ,1 <ESC>:tabnext 1<CR>
map ,2 <ESC>:tabnext 2<CR>
map ,3 <ESC>:tabnext 3<CR>
map ,4 <ESC>:tabnext 4<CR>
map ,5 <ESC>:tabnext 5<CR>
map ,6 <ESC>:tabnext 6<CR>
map ,7 <ESC>:tabnext 7<CR>
map ,8 <ESC>:tabnext 8<CR>
map ,9 <ESC>:tabnext 9<CR>
map ,t <ESC>:tabnew<CR>

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

" Resize vim splits automatically
autocmd VimResized * wincmd =

" http://robots.thoughtbot.com/post/48275867281/vim-splits-move-faster-and-more-naturally
set splitbelow
set splitright

"http://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting
"OMG after all these years creating a new empty such *facepalm*
nnoremap <CR> :noh<CR><CR>

scriptencoding utf-8
set encoding=utf-8
