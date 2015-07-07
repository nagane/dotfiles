""""""""""""""""
" base setting
""""""""""""""""

" Leaderをスペースに
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <CR> G
nnoremap <BS> gg
nmap <Leader><Leader> V

syntax on
"検索した単語をハイライト
set hlsearch
"カラースキーマを設定
colorscheme desert
"新しい行のインデントを現在行と同じにする
set autoindent
"タブの代わりに空白文字を挿入する
set expandtab
""変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"インクリメンタルサーチを行う
set incsearch
""タブ文字、行末など不可視文字を表示する
set list
""行番号を表示する
set number
"シフト移動幅
set shiftwidth=2
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
""検索時に大文字を含んでいたら大/小を区別
set smartcase
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
imap { {}<Left>
imap [ []<Left>
imap ( ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap < <><Left>

"for mac
set clipboard+=unnamed

"""""""""""""""""""""""""""
" ノーマルモードキーバインド
"""""""""""""""""""""""""""
"F5で文字をインサート
nnoremap <F9> :<C-u>tabedit $MYVIMRC<CR>
nnoremap <F10> :source  $MYVIMRC<CR>
nnoremap <Leader>p :setlocal number!<CR>
nnoremap <Leader>l :setlocal list!<CR>
nnoremap <Leader>p :setlocal paste!<CR>


map <F5> ggO#!/bin/bash<ESC>
map <F4> ggOrequire 'spec_helper'<ESC>


" バックスペースで特殊記号も削除可能に(mac vim7.4対応)
set backspace=indent,eol,start 

filetype off

"""""""""""""""""""""""""""
" golang 用設定
"""""""""""""""""""""""""""
set rtp +=$GOROOT/misc/vim
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
" 補完内容を詳細に表示
set completeopt=menu,preview

""""""""""""""""""""
" NeoBundle
""""""""""""""""""""
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  call neobundle#end()
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle "Shougo/neosnippet-snippets"
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'ervandew/supertab'
" Markdown Plugin
NeoBundle 'plasticboy/vim-markdown'
au BufRead,BufNewFile *.md set filetype=markdown
NeoBundle 'kannokanno/previm'
let g:previm_open_cmd = 'open -a Safari'
" ファイルオープンを便利にする
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようになる
NeoBundle 'Shougo/neomru.vim'
" ファイルのtree表示
NeoBundle 'scrooloose/nerdtree'
" rails plugin
NeoBundleLazy 'alpaca-tc/vim-endwise.git', {
      \ 'autoload' : {
      \   'insert' : 1,
      \ }}
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'
NeoBundle 'mattn/gist-vim'
let g:gist_show_privates = 1
let g:gist_post_private = 1
NeoBundle 'mattn/webapi-vim'
" for golang
NeoBundle 'Blackrush/vim-gocode'

filetype plugin indent on     " required!
filetype indent on



set nocompatible               " be iMproved

"""""""""""""""""""""""
" ligthline
"""""""""""""""""""""""

NeoBundle 'itchyny/lightline.vim'

" need brew install --use-gcc fontforge
let g:Powerline_symbols = 'fancy'

set laststatus=2
set t_Co=256 

let g:lightline = {
\ 'colorscheme': 'wombat'
      \ }


""""""""""""""""""""""""
"  Unit.vimの設定
""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-H> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

""""""""""""""""""""""""""""""
" vim mac導入
""""""""""""""""""""""""""""""
if has('gui_macvim')
  colorscheme desert
endif

" 80カラムの目安表示

if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=9
endif
