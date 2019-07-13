set encoding=utf-8
scriptencoding utf-8

"---------------------------------------------------------------------------
" カラー設定:
"
syntax enable

colorscheme solarized
set background=dark
"colorscheme molokai
"set background=light
"colorscheme solarized
"colorscheme slate
"colorscheme pyte
"colorscheme zenburn
"
" itchyny/lightline.vim
"let g:lightline = {
"      \ 'colorscheme': 'solarized'
"      \ }

""---------------------------------------------------------------------------
"" フォント設定:
""
"source $vimruntime/delmenu.vim
"set langmenu=ja_jp.utf-8
"source $vimruntime/menu.vim
"" set renderoptions=type:directx,renmode:5,taamode:1,geom:1

if has('win32')
  " Windows用
	set rop=type:directx,geom:1,renmode:5,taamode:1
	set gfn=Ricty_Diminished:h12:cSHIFTJIS:qDRAFT
	set gfw=Ricty_Diminished:h12:cSHIFTJIS:qDRAFT
  "set guifont=BIZ\ UDシック:h10:cSHIFTJIS
  "set guifontwide=BIZ\ UDゴシック:h10:cSHIFTJIS
  "set guifont=MeiryoKe_Console:h10:cSHIFTJIS
  "set guifontwide=MeiryoKe_Console:h10:cSHIFTJIS
  "set guifont=Migu_2M:h12:cSHIFTJIS
  "set guifontwide=Migu_2M:h12:cSHIFTJIS
	"
  set printfont=MeiryoKe_Console:h10:cSHIFTJIS
  "set printfont=Migu_2M:h10:cSHIFTJIS
  set printoptions=wrap:y
  set printheader=%<%f%h%m%=%N\ ページ
  "set printoptions=syntax:y,number:y

  " 行間隔の設定
  set linespace=3
  " 一部のUCS文字の幅を自動計測して決める
  if has('kaoriya')
    set ambiwidth=auto
  endif
elseif has('mac')
  set guifont=Osaka－等幅:h14
elseif has('xfontset')
  " UNIX用 (xfontsetを使用)
  set guifontset=a14,r14,k14
endif

"---------------------------------------------------------------------------
" ウインドウに関する設定:
"
"set guioptions-=t
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions+=a
set guioptions+=m
set clipboard=unnamed,autoselect
set nofoldenable
set notitle

"" let &guioptions = substitute(&guioptions, "t", "", "g")
"" let &guioptions = substitute(&guioptions, "T", "", "g")
"
"" ウインドウの幅
"set columns=120
"" ウインドウの高さ
"set lines=24
"" コマンドラインの高さ(GUI使用時)
"set cmdheight=2
"" 画面を黒地に白にする (次行の先頭の " を削除すれば有効になる)
""colorscheme evening " (GUI使用時)
"" 常にタブラインを表示
""set showtabline=1
"
"" The prefix key.
"nnoremap    [Tag]   <Nop>
"nmap    t [Tag]
"" Tab jump
"" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
"for n in range(1, 9)
"  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
"endfor
"" tc 新しいタブを一番右に作る
"map <silent> [Tag]c :tablast <bar> tabnew<CR>
"" tx タブを閉じる
"map <silent> [Tag]x :tabclose<CR>
"
"---------------------------------------------------------------------------
" 日本語入力に関する設定:
"
if has('multi_byte_ime') || has('xim')
  " IME ON時のカーソルの色を設定(設定例:紫)
  highlight CursorIM guibg=Purple guifg=NONE
  " 挿入モード・検索モードでのデフォルトのIME状態設定
  "set iminsert=0 imsearch=0
"  if has('xim') && has('GUI_GTK')
"    " XIMの入力開始キーを設定:
"    " 下記の s-space はShift+Spaceの意味でkinput2+canna用設定
"    "set imactivatekey=s-space
"  endif
  " 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
  "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

"---------------------------------------------------------------------------
" マウスに関する設定:
"
" 解説:
" mousefocusは幾つか問題(一例:ウィンドウを分割しているラインにカーソルがあっ
" ている時の挙動)があるのでデフォルトでは設定しない。Windowsではmousehide
" が、マウスカーソルをVimのタイトルバーに置き日本語を入力するとチラチラする
" という問題を引き起す。
"
if has('mouse')
  " どのモードでもマウスを使えるようにする
  set mouse=a
  " マウスの移動でフォーカスを自動的に切替えない (mousefocus:切替る)
  set nomousefocus
  " 入力時にマウスポインタを隠す (nomousehide:隠さない)
  set mousehide
  " ビジュアル選択(D&D他)を自動的にクリップボードへ (:help guioptions_a)
  set guioptions+=a
endif

"---------------------------------------------------------------------------
" その他、見栄えに関する設定:
"
" 検索文字列をハイライトしない(_vimrcではなく_gvimrcで設定する必要がある)
if &t_Co > 2 || has("gui_running")
  syntax enable
  set nohlsearch
endif
"
"---------------------------------------------------------------------------
" ウィンドウ透過 :
"
if has("autocmd")
  augroup Transparency
    autocmd!
    autocmd GUIEnter * set transparency=255
    autocmd FocusGained * set transparency=255
    autocmd FocusLost * set transparency=192
  augroup END
endif
"
"""---------------------------------------------------------------------------
""" 全角スペース
""augroup highlightZenkaku
""  autocmd!
""  autocmd Colorscheme * highlight IdeographicSpace term=underline cterm=bold,reverse guibg=SlateGray
"""  autocmd Colorscheme * highlight AsciiSpace       term=underline cterm=bold,reverse guibg=#e0e0e0 gui=underline guisp=DarkGrey
""  "autocmd Colorscheme * highlight IdeographicSpace term=underline cterm=bold,reverse guibg=#e0e0e0 gui=underline
""  "autocmd Colorscheme * highlight IdeographicSpace term=underline cterm=bold,reverse guibg=#f0f0f0 gui=undercurl guisp=DarkGrey
""  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
"""    autocmd VimEnter,WinEnter * match AsciiSpace       / /
""augroup END
