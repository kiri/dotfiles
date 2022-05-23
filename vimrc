" .vimrc

" vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : has('win32') ? 'vimfiles' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) | PlugInstall --sync | source $MYVIMRC | endif

call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'glidenote/memolist.vim'
Plug 'vim-jp/vimdoc-ja'
Plug 'vim-scripts/vim-auto-save'
" Initialize plugin system
call plug#end()

"
set nocompatible
set nowritebackup
set nobackup
set virtualedit=block
set backspace=indent,eol,start
set ambiwidth=double
set wildmenu

set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch

set noerrorbells
"set shellslash
set showmatch matchtime=1
set cinoptions+=:0
set cmdheight=2
set laststatus=2
set showcmd
set display=lastline
set list
set listchars=tab:^\ ,trail:~
set history=10000
hi Comment ctermfg=3
set shiftwidth=0
set softtabstop=-1
set tabstop=2
set expandtab
set guioptions-=T
set guioptions+=a
" set guioptions-=m
set guioptions+=R
set showmatch
set smartindent
set noswapfile
" set nofoldenable
set title
set number
set clipboard=unnamed,autoselect
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
syntax on
set nrformats=
set whichwrap=b,s,h,l<,>,[,],~
set mouse=a
set visualbell

set background=dark
"set background=light
"colorscheme desert
colorscheme toast
set termguicolors

set scrolloff=5
set sidescrolloff=8
set sidescroll=1
set guifont=HackGen_Console:h14:cSHIFTJIS:qDRAFT
set cursorline

"let g:lightline = {
"      \ 'colorscheme': 'wombat'
"      \ }
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [  'readonly', 'filename', 'modified' ] ]
      \ },
      \ }

let mapleader="\<Space>"

let g:memolist_path="~/OneDrive/vim-memolist"
let g:auto_save=1
map <Leader>mn  :MemoNew<CR>
map <Leader>ml  :MemoList<CR>
map <Leader>mg  :MemoGrep<CR>
let g:memolist_memo_suffix = "md"
