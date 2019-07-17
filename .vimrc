set enc=utf-8
set fenc=utf-8
scriptencoding utf-8

let mapleader = "\<Space>"

"----------------------------------------
" Kaoriya対策
" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/kaoriya-trouble
"$VIM/vimrc_local.vimによりg:no_vimrc_exampleを利用してvimrc_example.vimを無効化しているのでここで読込
"
if exists('g:no_vimrc_example') && g:no_vimrc_example == 1
  silent! source $VIMRUNTIME/vimrc_example.vim
endif
filetype plugin indent on

"Kaoriya版に添付されているプラグインの無効化($VIM/plugins/kaoriya/)
let plugin_autodate_disable  = 1
let plugin_cmdex_disable     = 1
let plugin_dicwin_disable    = 1
let plugin_format_disable    = 1
let plugin_hz_ja_disable     = 1
let plugin_scrnmode_disable  = 1
let plugin_verifyenc_disable = 1

"----------------------------------------
"不要なデフォルトプラグインを止める
"https://lambdalisue.hatenablog.com/entry/2015/12/25/000046
"
let g:loaded_gzip              = 1
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1
let g:loaded_rrhelper          = 1
let g:loaded_2html_plugin      = 1
let g:loaded_vimball           = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_getscript         = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1

"----------------------------------------
"実行ファイルパス追加
"
"let $path = join([$path, iconv('C:/アプリ/git/cmd', 'utf-8', 'cp932')], ';')
"let $path .= ';C:\Program Files\Git\usr\bin'

"----------------------------------------
"vim-plug https://github.com/junegunn/vim-plug 
"
call plug#begin('~/vimfiles/plugged')
Plug 'tyru/eskk.vim'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/calendar.vim'
"Plug 'fuenor/qfixhowm'
Plug 'vim-scripts/vim-auto-save'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'glidenote/memolist.vim'
Plug 'tomasr/molokai'
"Plug 'fuenor/im_control.vim'
"Plug 'osyo-manga/vim-nyaaancat'
Plug 'altercation/vim-colors-solarized'
Plug 'thinca/vim-singleton'
call plug#end()

"----------------------------------------
"Singleton
call singleton#enable()

"----------------------------------------
set nocompatible
set autoread
set hidden
set nowritebackup
set nobackup
set noswapfile
set virtualedit=block
set backspace=indent,eol,start
set ambiwidth=double
set wildmenu
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch
set shellslash
set noerrorbells
set visualbell
set showmatch
set matchtime=1
set cinoptions+=:0
set smartindent
set autoindent
set cmdheight=2
set laststatus=2
set showcmd
set display=lastline
set wildmode=list:longest
set history=10000
set shiftwidth=2
set softtabstop=2
set tabstop=2
set whichwrap=b,s,<,>,[,],~
nnoremap j gj
nnoremap k gk
set cursorline
set nocursorcolumn
set expandtab
"set list listchars=tab:^\ ,trail:~ expandtab
"set list listchars=tab:\?\- expandtab
"hi Comment ctermfg=3
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
"syntax on
set nrformats=

set clipboard+=unnamed
set clipboard+=autoselect
set number ruler

nnoremap Y y$
set wrap
set pumheight=10
set showtabline=1

set undodir=./_vimundo,~/vimfiles/undo
set undofile

set browsedir=buffer
cd ~/Documents
"if isdirectory( $HOME . "/Desktop" )
"	cd $HOME/Desktop
"elseif isdirectory( $HOME . "/デスクトップ" )
"	cd $HOME/デスクトップ
"endif

"----------------------------------------
" AutoSave
let g:auto_save = 1  "enable AutoSave on Vim startup
"let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
let g:auto_save_silent = 1  " do not display the auto-save notification

"----------------------------------------
" セッション情報を保存と復元:
"au VimLeave * mks! ~/vimfiles/Session.vim
augroup SessionAutocommands
   autocmd!
   autocmd VimEnter * nested call <SID>RestoreSessionWithConfirm()
   autocmd VimLeave * execute 'SaveSession'
augroup END
 
command! RestoreSession :source     ~/vimfiles/Session.vim
command! SaveSession    :mksession! ~/vimfiles/Session.vim
 
" Restore session with confirm
function! s:RestoreSessionWithConfirm()
  let msg = 'Do you want to restore previous session?'

  if !argc() && confirm(msg, "&Yes\n&No", 1, 'Question') == 1
    execute 'RestoreSession'
  endif
endfunction

"----------------------------------------
" eSKK.vim
"
let g:eskk#directory = "~/vimfiles/eskk"
let g:eskk#dictionary = { 'path': "~/vimfiles/eskk/skk-jisyo", 'sorted': 0, 'encoding': 'utf-8', }
let g:eskk#large_dictionary = { 'path': "~/vimfiles/eskk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp', }
let g:eskk#keep_state = 1
let g:eskk#keep_state_beyond_buffer = 1
let g:eskk#egg_like_newline = 1
set noimdisable

let g:lightline = {
      \ 'colorscheme': 'solarized',
      "\ 'colorscheme': 'molokai',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste', 'skkmode' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'skkmode': 'SkkMode'
      \ },
      \ }

function! SkkMode()
	if eskk#is_enabled()
		return substitute(eskk#statusline(),"[eskk:","[skk:","")
	else
		return eskk#statusline()
	endif
endfunction

augroup eskk
	autocmd!
	autocmd User eskk-enable-pre set imdisable
	autocmd User eskk-disable-post set noimdisable
augroup END
 
"----------------------------------------
"eskkの初期状態がおかしいので明示して関数を呼ぶ
"inoremap <C-^> <C-o>:call eskk#toggle()<CR>
imap <C-^> <C-j>

"----------------------------------------
"Insertmodeで<C-C>でESCと同義
"
inoremap <C-C> <ESC>

"<S+TAB>でexpandtabをトグル
function Tab_switch()
    if &expandtab =='1'
        set noexpandtab
    else
        set expandtab
    endif
endfunction
nmap <S-TAB> :call Tab_switch()<CR>

"<ESC>wでnowrapをトグル
function Wrap_switch()
    if &wrap =='1'
        set nowrap
    else
        set wrap
    endif
endfunction
nmap <ESC>w :call Wrap_switch()<CR>

"----------------------------------------
" デフォルトvimrc_exampleのtextwidth設定上書き
autocmd FileType text setlocal textwidth=0

"----------------------------------------
"文字列grepを含むコマンドを実行したらQuickfix windowを開く
"https://qiita.com/yuku_t/items/0c1aff03949cb1b8fe6b
autocmd QuickFixCmdPost *grep* cwindow

"----------------------------------------
" コマンドラインモードでemacsキーバインド
"
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
" http://vim.g.hatena.ne.jp/tyru/20100116
inoremap <expr> <C-k> "\<C-g>u".(col('.') == col('$') ? '<C-o>gJ' : '<C-o>D')
cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>

"----------------------------------------
"" http://d.hatena.ne.jp/hyuki/20130714/vim
"" Ctrl-oを2回で日時を挿入
"nnoremap <C-o><C-o> <ESC>i<C-r>=strftime("# %Y/%m/%d %H:%M")<CR><CR>
"inoremap <C-o><C-o> <C-r>=strftime("# %Y/%m/%d %H:%M")<CR><CR>
""nnoremap <C-o><C-o> <ESC>i<C-r>=strftime("# %Y/%m/%d %H:%M:%S")<CR><CR>
""inoremap <C-o><C-o> <C-r>=strftime("# %Y/%m/%d %H:%M:%S")<CR><CR>

"----------------------------------------
"memolist.vm
let g:memolist_path = "~/memo"
nnoremap <Leader>mn  :MemoNew<CR>
nnoremap <Leader>ml  :MemoList<CR>
nnoremap <Leader>mg  :MemoGrep<CR>

" suffix type (default markdown)
let g:memolist_memo_suffix = "txt"
" date format (default %Y-%m-%d %H:%M)
"let g:memolist_memo_date = "%Y-%m-%d %H:%M"
"let g:memolist_memo_date = "epoch"
let g:memolist_memo_date = "%D %T"
" tags prompt (default 0)
let g:memolist_prompt_tags = 1
" categories prompt (default 0)
let g:memolist_prompt_categories = 1
" use qfixgrep (default 0)
let g:memolist_qfixgrep = 0
" use vimfiler (default 0)
let g:memolist_vimfiler = 0
" use fzf (default 0)
let g:memolist_fzf = 1
" remove filename prefix (default 0)
let g:memolist_filename_prefix_none = 0
" use unite (default 0)
let g:memolist_unite = 0
" use arbitrary unite source (default is 'file')
"let g:memolist_unite_source = "file_rec"
" use arbitrary unite option (default is empty)
"let g:memolist_unite_option = "-auto-preview -start-insert"
" use denite (default 0)
let g:memolist_denite = 0
" use arbitrary denite source (default is 'file_rec')
"let g:memolist_denite_source = "anything"
" use arbitrary denite option (default is empty)
"let g:memolist_denite_option = "anything"
" use various Ex commands (default '')
"let g:memolist_ex_cmd = 'CtrlP'
"let g:memolist_ex_cmd = 'NERDTree'
" use delimiter of array in yaml front matter (default is ' ')
let g:memolist_delimiter_yaml_array = ','
" use when get items from yaml front matter
" first line string pattern of yaml front matter (default "==========")
let g:memolist_delimiter_yaml_start = "---"
" last line string pattern of yaml front matter (default "- - -")
let g:memolist_delimiter_yaml_end  = "---"


"----------------------------------------
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"" auto reload .vimrc
"augroup source-vimrc
"  autocmd!
"  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
"  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
"augroup END
"
"" auto comment off
"augroup auto_comment_off
"  autocmd!
"  autocmd BufEnter * setlocal formatoptions-=r
"  autocmd BufEnter * setlocal formatoptions-=o
"augroup END
"
"augroup MyXML
"  autocmd!
"  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
"  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
"augroup END

"if has("autocmd")
"  augroup redhat
"    " In text files, always limit the width of text to 78 characters
"    autocmd BufRead *.txt set tw=78
"    " When editing a file, always jump to the last cursor position
"    autocmd BufReadPost *
"    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
"    \   exe "normal! g'\"" |
"    \ endif
"  augroup END
"endif

"============================================
" https://qiita.com/kotashiratsuka/items/dcd1f4231385dc9c78e7
"
"Tipsメモ
"
"http://www.ac.cyberhome.ne.jp/~yakahaira/vimdoc/windows.html
"分割
"C-W,s
"縦分割
"C-W,v
"分割ウインドウ移動
"C-W,C-W
"分割ウインドウカーソル移動
"C-W,hjkl
"分割ウインドウ移動
"C-W,HJKL
"いま開いている分割ウインドウ以外を閉じる
"C-W,C-o
"ウインドウを入れ替える"
"C-W,x
"ウインドウサイズ調整
"C-W,+-=
"
"カーソルを一個前の場所(ファイル)に戻す
"C-O
"
"カーソルを一個先の場所(ファイル)に進める
"C-I
"
"カーソル下のファイル名を開く
"gf
"
"現在検索している単語をペースト
"<C-R>/
"
"\di to start DrawIt and
"\ds to stop  DrawIt.
"
"そのままペースト
":a! <Paste>
"
"カレントバッファをBashなどで実行
"w !bash
"
"検索履歴を参照
":<C-F>
"or
"逆から
":?
"履歴を送る
"C-C
"コマンド履歴を参照
"q:
"逆から
"q?
"
"レジスタの中身をコマンドラインへペースト
":<C-R>"
":<C-R><C-W>
"
"レジスタリスト
"0 最後に yank したテキスト
"- 最後の細かい削除
". 最後に挿入したテキスト
"% 現在のファイル名
"# 代替ファイル名
"/ 最後に検索した文字列
": 最後に実行した:
"_ ブラックホール
"= 計算式
"* マウスで選択されたテキスト
"
"指定エンコードで開きなおす
":e ++enc=euc-jp
":e ++ff=unix
"
"上下の行を現在行へコピー
"<C-E> or <C-Y>
"
"uniqやgrepでフィルタ
":%!uniq
":%!grep
"
":eで開くパスの追加
"let &path += "/etc,/var/log,/var/log/httpd"
"
"Bookmark
"http://nanasi.jp/articles/vim/bookmarks_vim.html
"b
"B
"q
"
"DrawItPlugin.vim
"\di
"\ds
"
"インサートモードでインデントする
"<C-T> or <C-D>
"
"EnhCommentify.vim
"\xでコメントアウト/解除
"
"VisualMode再選択
"gv
"
"カーソル上の単語を全体からリストアップ
"[I
"
"大文字<->小文字変換
"gu<select>
"gU<select>
"
"1ライン上方スクロール
"^y
"ウィンドウの先頭から数えて[count]行目から再描画
"z
"現在行をウィンドウの最上位置にして再描画(位置変化無)
"zt
"ウィンドウの高さを{height}にして再描画
"z{height}<CR>
"現在位置を最上にしてウィンドウを再描画(カーソル現在位置)
"z<CR>
"現在位置を中心にしてウィンドウを再描画(カーソル最左非空白へ)
"z.
"現在位置を中心にしてウィンドウを再描画(カーソル現在位置)
"zz
"現在位置を最下にしてウィンドウを再描画(カーソル最左非空白へ)
"z-
"現在位置を最下にしてウィンドウを再描画(カーソル現在位置)
"zb
"wrap off時: [count]文字左にスクロール
"z<right>
""z<right>" と同じ
"zl
"wrap off時: [count]文字右にスクロール
"z<Left>
""z<Left>" と同じ
"zh
"スクリーン幅の半分左スクロール
"zL
"
"カーソルを画面の上、中、下に移動
"H,M,L
"
"直前操作繰り返し
".
"
"現在行の検索
"f<word>
"現在行の検索（後方）
"F<word>
"
"現在行のワード検索
"f<word>
"現在行の検索（後方）
"F<word>
"現在行の次検索
",
"
"検索、置き換え簡単方法
"置き換えたいワードの上にカーソル移動->'*'->cw->入力->n->.->n->.->繰り返し
"
"コントロールコードの入力
"C-V<>
"
"計算結果の入力
"Insterモード->C-R=->2*2*2->Return
"
"コマンドラインでバッファ番号を指定する
"#バッファ番号
"
"多段Undo
"http://www.ac.cyberhome.ne.jp/~yakahaira/vimdoc/usr_32.html
"Undoで前のツリーへ戻る
"g-
"Redoで次のツリーへ戻る
"g+
"
"10分前に戻る
":earlier 10s
"
"一分後に進む
":later 1m
"
"コマンドライン操作
"http://www.kaoriya.net/vimdoc_j/cmdline.txt
"C-R....
"
"名前のない登録、最後の削除やヤンクを含む。
"'"'
"カレントファイル名
"'%'
"代替ファイル名
"'#'
"最後の検索パターン
"'/'
"クリップボードの内容
"'*'
"最後のコマンドライン
"':'
"最後の小さな削除(行単位未満)
"'-'
"最後に挿入されたテキスト
"'.'
"式の登録: 式を入力するよう要求される
"'='
"
"ファイル名補完
"CTRL-X CTRL-F
"行全補完
"CTRL-X CTRL-L
"マクロ定義 (インクルードファイルの中も探す)
"CTRL-X CTRL-D
"カレントファイルとインクルードファイ補完
"CTRL-X CTRL-I
"辞補完
"CTRL-X CTRL-K
"同義語辞書 (シソーラス)
"CTRL-X CTRL-T
"タ補完
"CTRL-X CTRL-]
"Vim のコマンドライ補完
"CTRL-X CTRL-V
"
"Window縦分割/横分割切替
"C-W,H
"C-W,J
"
"暗号化を解除する
":X
"
"空白を挿入しないでjoinする
"gJ
"
"最初の検索パターンが現れたところからもう一段検索する
"http://www.kaoriya.net/vimdoc_j/pattern.txt
":/patarn1/;/patarn2
"
"カーソル位置の単語をManpageで検索
"K
"
"カーソル位置の情報を詳細に表示
"g,C-G
"
"コマンドライン総合
"http://www.ac.cyberhome.ne.jp/~yakahaira/vimdoc/cmdline.html
"
"Fold関係
"foldenable をトグルで on off する
"zi
"fold を閉じる(close)
"zc
"fold を再帰的に閉じる(close)
"zC
"fold を開く(open)
"zo
"fold を再帰的に開く(open)
"zO
"foldlevel をインクリメント、 すなわちすべてのfoldを1level開く
"zr
"foldlevel を最大値にする、すなわちすべてのfoldを開く
"zR
"foldlevel をデクリメント、すんわちすべてのfoldを1level閉じる
"zm
"foldlevel を0にする、すなわちすべてのfoldを閉じる
"zM
"fold をカーソルから4行分設定する
"zf4j
"`a fold をカーソルからaのマーク位置まで設定する
"z
"設定された fold を削除
"zd
"設定された fold を再帰的に削除
"zD
"
"全文をソート
":%!sort
"
"バッファ全体に置き替えを適用
":bufdo %s/aaa/bbb/g
"
"バッファ全体に置き替えを適用して保存
":bufdo %s/aaa/bbb/g | wa!
"
"改行位置で整形
"gq
"
"sudoを忘れて権限のないファイルを編集した時
":w !sudo tee %
"
"カーソルの下の単語をさくっと拾って置換で使う
":%s//New York/g とかやると New York に置換
":%g//dすれば Massachusetts を含む行を削除
"%v//dすれば Massachusetts を含む行だけ残すことができる。
"
"Undo関連
"undolist Undo履歴を参照
"g-     古いテキストの状態戻る
"g+     新しいテキストの状態に戻る
":earlier {N}s   {N}秒前の状態に戻ります
":earlier {N}m  {N}分前の状態に戻ります
":earlier {N}h  {N}時間前の状態に戻ります
":later {N}s    {N}秒後の状態に戻ります
":later {N}m    {N}分後の状態に戻ります
":later {N}h    {N}時間後の状態に戻ります 
"
"Massachusetts の上で # を押して、 :%s//New York/g とかやると New York に置換
":%g//dすれば Massachusetts を含む行を削除
"%v//dすれば Massachusetts を含む行だけ残すことができる。
"
"文書中の全てのタブをスペースに変換
":set expandtab
":%retab
"
"文書中の全てのスペースをタブに変換
":set noexpandtab
":%retab!
"
"自動的に改行するようにする
"60文字の場合。 :set textwidth=60
"ただし、これだとスペースなどでしか改行されない。日本語では不便。
"
"日本語を textwidth 桁で折り返したい
"gq
"
"Align系
"<Leader>tsp    空白文字で分割して整形。各フィールドは左揃え。
"<Leader>Tsp    空白文字で分割して整形。各フィールドは右揃え。
"<Leader>tsq    空白文字で分割して整形。ダブルクォートで囲まれたフィールドをサポート。各フィールドは左揃え。
"<Leader>tab    TSVの整形。タブ文字で分割して整形。タブ文字は半角スペースに変換される。
"<Leader>t{セパレータ} 指定したセパレータで分割して整形。各フィールドは左揃え。
"<Leader>T{セパレータ} 指定したセパレータで分割して整形。各フィールドは右揃え。
"<Leader>tml    行末のバックスラッシュの位置の整形。シェルスクリプト用。
"<Leader>Htd    HTMLのテーブルの整形。
"<Leader>tt LaTexのテーブルの整形。
"
"surround系
"http://blog.scimpr.com/2012/09/08/surround-vimチュートリアルをためす/
"Change Surroucol("$")nd
"cs"'
"
"Change Surround x to Tag
"cs'<q>
"
"Change Surround Tag to x
"cst"
"
"Delete Surround
"ds"
"
"You Surround x
"ysiw]
"
"空白つきのカッコで囲む
"cs]{
"
"行全体を囲む
"yss)
"
"削除する
"ds{ds)
"
"You Surround x with Tag
"ysiw<pre>
"
"vim-easy-align
"https://github.com/junegunn/vim-easy-align
"
"texile table
"gaip*|
"
"Live
"gaip<C-P>*|<CR><CR>......|
"
"Mergin
"gaip<C-P>*|<C-R> or <C-L>|
"
"Alignment options in interactive mode
"CTRL-F filter  Input string ([gv]/.*/?)
"CTRL-I indentation shallow, deep, none, keep
"CTRL-L left_margin Input number or string
"CTRL-R right_margin    Input number or string
"CTRL-D delimiter_align left, center, right
"CTRL-U ignore_unmatched    0, 1
"CTRL-G ignore_groups   [], ['String'], ['Comment'], ['String', 'Comment']
"CTRL-A align   Input string (/[lrc]+\*{0,2}/)
"<Left> stick_to_left   { 'stick_to_left': 1, 'left_margin': 0 }
"<Right>    stick_to_left   { 'stick_to_left': 0, 'left_margin': 1 }
"<Down> *_margin    { 'left_margin': 0, 'right_margin': 0 }"
"
"Vimでヤンクした内容を複数行にペーストする
"Ctrl+v -> } -> I Ctrl+r -> " -> ESC
"
"その他
"http://www.kaoriya.net/testdir/command_list.txt
"http://www.c.csce.kyushu-u.ac.jp/kb/wiki/index.php?%A5%BD%A5%D5%A5%C8%A5%A6%A5%A8%A5%A2%2FVim%2FFAQ
"
"
"" Specify a directory for plugins
"" - For Neovim: ~/.local/share/nvim/plugged
"" - Avoid using standard Vim directory names like 'plugin'
"call plug#begin('~/.vim/plugged')
"
"" Make sure you use single quotes
"
"" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'
"
"" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"
"" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
"" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"
"" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"
"" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }
"
"" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"
"" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"
"" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'
"
"" Initialize plugin system
"call plug#end()
