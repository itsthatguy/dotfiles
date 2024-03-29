set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" BUNDLES
Plugin 'gmarik/Vundle.vim'
Plugin 'rbtnn/vimconsole.vim'

Plugin 'CharTab'
Plugin 'cream-showinvisibles'

" general vim/commands
Plugin 'tpope/vim-repeat'
Plugin 'terryma/vim-multiple-cursors'

" syntax
Plugin 'vim-scripts/applescript.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-haml'
Plugin 'plasticboy/vim-markdown'
" Plugin 'mxw/vim-jsx'
Plugin 'isRuslan/vim-es6'
Plugin 'vim-scripts/nginx.vim'
" Plugin 'tpope/vim-markdown'
Plugin 'tdesikan/vim-tritium'
Plugin 'slim-template/vim-slim'
" Plugin 'rylnd/vim-javascript-syntax'
" Plugin 'othree/yajs.vim'
Plugin 'lilydjwg/colorizer'
Plugin 'wavded/vim-stylus'
Plugin 'scrooloose/syntastic'
Plugin 'dbakker/vim-lint'
Plugin 'nono/vim-handlebars'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'itspriddle/vim-marked'
Plugin 'digitaltoad/vim-jade'
Plugin 'kylef/apiblueprint.vim'

" ruby
Plugin 'tpope/vim-endwise'
Plugin 'vim-ruby/vim-ruby'

" node
Plugin 'moll/vim-node'

" formatting
" Plugin 'junegunn/vim-easy-align'
Plugin 'godlygeek/tabular'
Plugin 'jgdavey/vim-blockle'
Plugin 'tpope/vim-commentary'
" Plugin 'tomtom/tcomment_vim'
" Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'mattn/emmet-vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'ntpeters/vim-better-whitespace'

" files/search/buffers
" Plugin 'tpope/vim-vinegar'
Plugin 'moll/vim-bbye'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'duff/vim-bufonly'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
" Plugin 'ervandew/supertab'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'tpope/vim-abolish'

" tags
Plugin 'tpope/vim-ragtag'

" git
" Plugin 'gregsexton/gitv'
" Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" rails
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'

" tmux
" Plugin 'edkolev/tmuxline.vim'
" Plugin 'benmills/vimux'
" Plugin 'jgdavey/vim-turbux'

" tools
Plugin 'bartek/vim-draftin'

" style
Plugin 'godlygeek/csapprox'
Plugin 'kaicataldo/material.vim', { 'branch': 'main' }

call vundle#end()

filetype plugin indent on

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

if filereadable(expand('~/.vimrc.secret'))
  source ~/.vimrc.secret
endif
