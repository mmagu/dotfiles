filetype off
"--------------------------------------------------------------"
"                  エディタの設定                               
"--------------------------------------------------------------"
"行番号を表示
set nu
"インデント
set autoindent
"バックアップファイルディレクトリ
set backupdir=~/dotfiles/vimbackup
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer
"Vi互換をオフ
set nocompatible
"スワップファイル用のディレクトリ
set directory=~/dotfiles/vimbackup
" undo用のディレクトリ
set undodir=~/dotfiles/vimbackup/undo
"タブの代わりに空白文字を挿入する
set expandtab
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"インクリメンタルサーチ
set incsearch
"タブ文字、行末文字など不可視文字を表示する
set list
"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<
"シフト移動幅
set shiftwidth=2
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内でtabを打ち込むと、'shiftwidth'の数だけインデントする
set smarttab
"ファイルないの<tab>が対応する空白の数
set tabstop=2
" タブを常に表示
set showtabline=2

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"検索をファイルの先頭へループしない
set nowrapscan
"横スクロールさせる設定
set nowrap
"入力中のコマンドを表示する
set showcmd
" カーソル行をハイライト
set cursorline
syntax on
