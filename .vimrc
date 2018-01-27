"set tabstop=2
"set shiftwidth=2
"set number
"set expandtab
"set softtabstop=2
"set smartindent
"autocmd ColorScheme * highlight LineNr guifg=#000000
""set background dark
"syntax on
"set fileencoding=utf-8
"colorscheme hybrid

" ** system configuration
set backupdir=~/.vimbackup                              "バックアップを作るディレクトリ
set directory=~/.vimbackup                              "スワップファイル用ディレクトリ

" ** code configuration
set encoding=utf-8                                      "文字コードを指定
set fileencodings=utf-8                                 "ファイルエンコードを指定

" ** display configuration
set number                                              "行番号を表示
set guifont=Monospace\ 11                               "フォントとサイズを設定
autocmd ColorScheme * highlight LineNr guifg=#CCCCCC    "行番号の色付け
autocmd ColorScheme * highlight Comment guifg=#888888   "コメント行の色を設定

" ** Tab Space configuration
set expandtab                                           "タブの代わりに空白文字を挿入
set tabstop=2                                           "ファイル内のタブが対応する空白の数
set shiftwidth=2                                        "シフト移動幅を設定
set smarttab                                            "行頭の余白内でタブを打ち込むと'shiftwidth'の数だけインデントする
autocmd FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
                                                        "Pythonの場合、スマートインデントする
autocmd FileType ruby set smartindent cinwords=if,elsif,else,for,while,def,class,begin,do,ensure,module,rescue,unless,public,protected,private
                                                        "Rubyの場合、スマートインデントする

" ** ColorScheme configuration
colorscheme hybrid                                      "カラースキーマを指定
set background=dark                                     "背景を暗くする

" **NeoBundle
if &compatible
  set nocompatible
endif

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'jeetsukumaran/vim-indentwise'
NeoBundle 'scrooloose/nerdtree'

" emmet-vim
NeoBundle 'mattn/emmet-vim'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

" ** vim-indent-guides configuration
"let g:indent_guides_enable_on_vim_startup = 1

" ** vim-indentwise configuration
"    Key Mapping
map <M-j> <Plug>(IndentWiseNextEqualIndent)
map <M-k> <Plug>(IndentWisePreviousEqualIndent)

" start NERDTree automatically
if !argc()
  autocmd vimenter * NERDTree|normal gg3j
endif

" emmet-vim key-binding
let g:user_emmet_leader_key = '<C-E>'
