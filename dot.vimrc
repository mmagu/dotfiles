"------------------------------------------------------------------------------"
" Vimの基本設定                                                                "
"------------------------------------------------------------------------------"
" Vi互換ではなくVimのデフォルトとして動作させる設定
set nocompatible
filetype off

"------------------------------------------------------------------------------"
" プラグインの設定                                                             "
"------------------------------------------------------------------------------"

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

"オートコンプリート関連のプラグイン
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

" Unite.vim
NeoBundle 'Shougo/unite.vim'
" Vimfiler
NeoBundle 'Shougo/vimfiler'
" vimshell
NeoBundle 'Shougo/vimshell'

" UniteRake
NeoBundle 'The-NERD-tree'
NeoBundle 'The-NERD-Commenter'

NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'

NeoBundle 'dbext.vim'

" vimからレファレンスを参照
NeoBundle 'thinca/vim-ref'
" vimからコードを実行
NeoBundle 'thinca/vim-quickrun'

" non github repos
NeoBundle 'wincent/command-t'

"テキストオブジェクト関連のプラグイン
NeoBundle 'surround.vim' 

" git plugin
" NeoBundle 'tpope/vim-fugitive'
" vim-railsの補助的に利用
NeoBundle 'basyura/unite-rails'

" ヤンクの履歴管理プラグイン
NeoBundle 'YankRing.vim'

" Ruby
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-cucumber'
" NeoBundle 'todesking/ruby_hl_lvar.vim'

" Javascript
NeoBundle 'JavaScript-syntax'
NeoBundle 'itspriddle/vim-javascript-indent'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundle 'maksimr/vim-jsbeautify'
NeoBundle 'kchmck/vim-coffee-script'
" PHP
NeoBundle 'violetyk/cake.vim'
NeoBundle 'violetyk/neocomplete-php.vim'

" twig
NeoBundle 'evidens/vim-twig'

" ctagsで作成されたタグ情報を元にメソッド一覧を表示するプラグイン
NeoBundle 'taglist.vim'
set tags=tags

call neobundle#end()
NeoBundleCheck

"--------------------------------------------------------------"
"                  vimの基本キーマッピング関連の初期設定
"--------------------------------------------------------------"
map ¥ <leader>
"--------------------------------------------------------------"
"                  vimの基本キーマッピング関連の初期設定
"--------------------------------------------------------------"
colorscheme torte
"--------------------------------------------------------------"
"                  プラグイン関連の初期設定
"--------------------------------------------------------------"
filetype plugin indent on
let g:acp_enableAtStartup = 0
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'




" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
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

" カレントウィンドウのみハイライトするように設定
augroup cch
autocmd! cch
autocmd WinLeave * set nocursorline
autocmd WinEnter,BufRead * set cursorline
augroup END

:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

"***************************************************************
"*                  キーマッピング設定
"***************************************************************
".vimrcと.gvimrcをすぐに編集できるようにしたキーマッピング
"nnoremap <silent> <Space>ev  :<C-u>edit $MYVIMRC<CR>
"nnoremap <silent> <Space>eg  :<C-u>edit $MYGVIMRC<CR>
nnoremap <silent> ,ev  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> ,eg  :<C-u>edit $MYGVIMRC<CR>
".vimrcと.gvimrcへの変更を反映するためのキーマッピング
"nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
"nnoremap <silent> <Space>rg :<C-u>source $MYGVIMRC<CR>
nnoremap <silent> ,rv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
nnoremap <silent> ,rg :<C-u>source $MYGVIMRC<CR>


"***************************************************************
"unite.vim
"***************************************************************
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

"------------------------------------
" Unite-rails.vim
"------------------------------------
"{{{
function! UniteRailsSetting()
  nnoremap <buffer><C-H><C-H><C-H>  :<C-U>Unite rails/view<CR>
  nnoremap <buffer><C-H><C-H>       :<C-U>Unite rails/model<CR>
  nnoremap <buffer><C-H>            :<C-U>Unite rails/controller<CR>

  nnoremap <buffer><C-H>c           :<C-U>Unite rails/config<CR>
  nnoremap <buffer><C-H>s           :<C-U>Unite rails/spec<CR>
  nnoremap <buffer><C-H>m           :<C-U>Unite rails/db -input=migrate<CR>
  nnoremap <buffer><C-H>l           :<C-U>Unite rails/lib<CR>
  nnoremap <buffer><expr><C-H>g     ':e '.b:rails_root.'/Gemfile<CR>'
  nnoremap <buffer><expr><C-H>r     ':e '.b:rails_root.'/config/routes.rb<CR>'
  nnoremap <buffer><expr><C-H>se    ':e '.b:rails_root.'/db/seeds.rb<CR>'
  nnoremap <buffer><C-H>ra          :<C-U>Unite rails/rake<CR>
  nnoremap <buffer><C-H>h           :<C-U>Unite rails/heroku<CR>
endfunction
aug MyAutoCmd
  au User Rails call UniteRailsSetting()
aug END
"}}}

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q


"***************************************************************
"Vimfiler.vim
"***************************************************************
let g:vimfiler_as_default_explorer=1


silent! nmap <unique> <Space>r <Plug>(quickrun)
let g:quickrun_config = {}
let g:quickrun_config['ruby.rspec'] = {'command': 'bundle exec rspec'}
augroup UjihisaRSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Gist.vim
" ファイルタイプを自動で判別する
let g:gist_detect_filetype = 1

" YankRIng.vim 設定
nmap ,y :YRShow<CR>

" vimを閉じずにファイル名を変更する
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))

"--------------------------------------------------------------------------------
" AlpacaTags ここから
"--------------------------------------------------------------------------------
" NeoBundleの設定
"NeoBundleLazy 'alpaca-tc/alpaca_tags', {
"      \ 'rev' : 'development',
"     \ 'depends': ['Shougo/vimproc', 'Shougo/unite.vim'],
"      \ 'autoload' : {
"      \   'commands' : ['Tags', 'TagsUpdate', 'TagsSet', 'TagsBundle', 'TagsCleanCache'],
"      \   'unite_sources' : ['tags']
"      \ }}

" ~/.ctagsにctagsの設定ファイルを設置します。現在無い人は、このディレクトリ内の.ctagsをコピーしてください。
" 適切なlanguageは`ctags --list-maps=all`で見つけてください。人によりますので。
" let g:alpaca_update_tags_config = {
"      \ '_' : '-R --sort=yes --languages=-js,html,css',
"      \ 'ruby': '--languages=+Ruby',
"      \ }

"augroup AlpacaTags
"  autocmd!
"  if exists(':Tags')
"    autocmd BufWritePost * TagsUpdate ruby
"    autocmd BufWritePost Gemfile TagsBundle
"    autocmd BufEnter * TagsSet
"  endif
"augroup END

nnoremap <expr>tt  ':Unite tags -horizontal -buffer-name=tags -input='.expand("<cword>").'<CR>'

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_javascript_checker = "jshint"
let g:userd_javascript_libs = 'underscore,jquery,angularjs,angularui,jasmine'

" Highligt group name for local variable
" Default: 'Identifier'
" let g:ruby_hl_lvar_hl_group = 'RubyLocalVariable'

syntax on
