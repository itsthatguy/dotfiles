set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" BUNDLES
Bundle 'gmarik/Vundle'

" general vim/commands
Bundle 'tpope/vim-repeat'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'vim-scripts/vim-auto-save'

" syntax
Bundle 'kchmck/vim-coffee-script'
Bundle 'leshill/vim-json'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tdesikan/vim-tritium'
Bundle 'slim-template/vim-slim'
Bundle 'rylnd/vim-javascript-syntax'
Bundle 'lilydjwg/colorizer'
Bundle 'mtscout6/vim-cjsx'
Bundle 'wavded/vim-stylus'
Bundle 'scrooloose/syntastic'
Bundle 'dbakker/vim-lint'
Bundle 'nono/vim-handlebars'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'itspriddle/vim-marked'

" ruby
Bundle 'tpope/vim-endwise'
Bundle 'vim-ruby/vim-ruby'

" node
Bundle 'moll/vim-node'

" formatting
Bundle 'junegunn/vim-easy-align'
Bundle 'jgdavey/vim-blockle'
Bundle 'tpope/vim-commentary'
" Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'mattn/emmet-vim'

" files/search/buffers
Bundle 'scrooloose/nerdtree'
Bundle 'duff/vim-bufonly'
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
" Bundle 'ervandew/supertab'
Bundle 'bling/vim-airline'
Bundle 'edkolev/tmuxline.vim'
Bundle 'shougo/neocomplete'

" tags
Bundle 'tpope/vim-ragtag'

" git
" Bundle 'gregsexton/gitv'
" Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'

" rails
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'

" tmux
Bundle 'benmills/vimux'
Bundle 'jgdavey/vim-turbux'

" style
Bundle 'godlygeek/csapprox'

call vundle#end()

filetype plugin indent on

set guifont=Monaco\ for\ Powerline:h13
let g:airline_powerline_fonts = 1

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
