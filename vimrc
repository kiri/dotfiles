" .vimrc

" vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : has('win32') ? '~/vimfiles' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) | PlugInstall --sync | source $MYVIMRC | endif

" Initialize plugin system
call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'glidenote/memolist.vim'
Plug 'vim-jp/vimdoc-ja'
Plug 'vim-scripts/vim-auto-save'
Plug 'mattn/vim-sonictemplate'
Plug 'yasukotelin/shirotelin'
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
"colorscheme toast
colorscheme shirotelin
set termguicolors

set scrolloff=5
set sidescrolloff=8
set sidescroll=1
set guifont=HackGen_Console:h14:cSHIFTJIS:qDRAFT
set cursorline

"let g:lightline = {
"      \ 'colorscheme': 'wombat'
"      \ }

"let g:lightline = {
"      \ 'colorscheme': 'powerline',
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [  'readonly', 'filename', 'modified' ] ]
"      \ },
"      \ }

"\ 'colorscheme': 'wombat',
let g:lightline = {
        \ 'colorscheme': 'shirotelin',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'LightlineModified',
        \   'readonly': 'LightlineReadonly',
        \   'fugitive': 'LightlineFugitive',
        \   'filename': 'LightlineFilename',
        \   'fileformat': 'LightlineFileformat',
        \   'filetype': 'LightlineFiletype',
        \   'fileencoding': 'LightlineFileencoding',
        \   'mode': 'LightlineMode'
        \ }
        \ }

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let mapleader="\<Space>"
let g:memolist_path="~/OneDrive/vim-memolist"
let g:memolist_memo_suffix = "md"
let g:memolist_template_dir_path="~/OneDrive/vim-memolist"
let g:auto_save=1
map <Leader>mn  :MemoNew<CR>
map <Leader>ml  :MemoList<CR>
map <Leader>mg  :MemoGrep<CR>
