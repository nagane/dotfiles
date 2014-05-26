syntax on
"カラースキーマを設定
colorscheme desert
"新しい行のインデントを現在行と同じにする
set autoindent
""バックアップファイルを作るディレクトリ
"set backupdir=$HOME/vimbackup
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
"set browsedir=buffer 
"Vi互換をオフ
"set nocompatible
"タブの代わりに空白文字を挿入する
set expandtab
""変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"インクリメンタルサーチを行う
set incsearch
""タブ文字、行末など不可視文字を表示する
"set list
"listで表示される文字のフォーマットを指定する
"set listchars=eol:$,tab:>\ ,extends:<
""行番号を表示する
set number
"シフト移動幅
set shiftwidth=2
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
""検索時に大文字を含んでいたら大/小を区別
"set smartcase
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
""行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"ファイル内の <Tab> が対応する空白の数
set tabstop=2
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
""検索をファイルの先頭へループしない
set nowrapscan
" 'v'でファイルを開くときは右側に開く。(デフォルトが左側なので入れ替え)
let g:netrw_altv = 1
" " 'o'でファイルを開くときは下側に開く。(デフォルトが上側なので入れ替え)
let g:netrw_alto = 1
"関数補完キーバインド変更
imap <C-f> <C-x><C-o>
"括弧とか入れたら後ろの括弧が自動的に挿入されてカーソルが左に一個戻る
"imap { {}<Left>
"imap [ []<Left>
"imap ( ()<Left>
"imap "" ""<Left>
"imap '' ''<Left>
"imap < <><Left>

"for mac
set clipboard+=unnamed

"F5で文字をインサート
map <F5> ggO#!/bin/bash<ESC>

" バックスペースで特殊記号も削除可能に(mac vim7.4対応)
set backspace=indent,eol,start 