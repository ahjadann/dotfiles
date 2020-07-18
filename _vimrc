set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'morhetz/gruvbox'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" TODO
" :help 'list'
" :help folding

" safeguard for re-sourcing
autocmd!

" HACK: I don't want a .gvimrc but some stuff gets reset during GUI init,
" therefore re-source .vimrc at GUI start
if has("gui")
	autocmd GUIEnter * source <sfile>
endif

set ruler
set number
set showcmd
set linebreak
set laststatus=2
"set scrolloff=4
set noerrorbells visualbell t_vb= " no beeps of any kind
set winminheight=0
set splitbelow
set confirm
set history=2000 " 100x the default

set incsearch
set autoindent
set smartindent
set textwidth=0
set tabstop=4
set shiftwidth=4
set softtabstop=4
set isfname+=/,.
set backspace=2 " indent,eol,start
set nojoinspaces

"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-Tab> <C-w><C-w>

"if exists("&encoding")
"	set fileencodings=utf-8,iso-8859-1
"	if has("gui_running")
"		set encoding=utf-8
"	else
"		set encoding=iso-8859-1
"	endif
"endif

"if has("digraphs")
"	digraphs .. 8230 " …
"	digraphs -- 8212 " —
"endif

set mouse=a
set nomousehide

"if has("menu")
"	amenu Book&marks.&Plasmasturm.home :e scp://rice/plasmasturm.atom<CR>
"	amenu Book&marks.&Plasmasturm.links :e scp://rice/www/links/index.shtml<CR>
"	amenu Book&marks.&Plasmasturm.template :e scp://rice/www/template.shtml<CR>
"	amenu Book&marks.&Plasmasturm.css :e scp://rice/www/global.css<CR>
"	amenu Book&marks.MP&3 :e ~/mp3/LIST<CR>
"	amenu Book&marks.Lists :E ~/public_html/lists/<CR>
"endif

" current directory follows the file being edited, so long as it's not a remote file
"if exists(":lcd")
"	autocmd BufEnter * if bufname("") !~ '^[[:alnum:]]*://' | silent! lcd %:p:h | endif
"else
"	autocmd BufEnter * if bufname("") !~ '^[[:alnum:]]*://' | cd %:p:h | endif
"endif

if has("gui_running")
	set columns=140 lines=45
	if has("gui_gtk2")
"		set guioptions-=tT
"		set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
		set guifont=Monospace\ 8
		"colorscheme desert
		colorscheme evening
	elseif has("gui_win32")
		"set guioptions-=tT
		colorscheme desert
		set guifont=Consolas
	endif
else
	 "enable Xterm mouse wheel scrolling
	map  <xCSI>[62~ <MouseDown>
	map! <xCSI>[62~ <MouseDown>
	map  <xCSI>[63~ <MouseUp>
	map! <xCSI>[63~ <MouseUp>
	map  <xCSI>[64~ <S-MouseDown>
	map! <xCSI>[64~ <S-MouseDown>
	map  <xCSI>[65~ <S-MouseUp>
	map! <xCSI>[65~ <S-MouseUp>

	set background=dark
	if exists(":colorscheme")
		"colorscheme default
		colorscheme gruvbox
	endif
endif

syntax on
let g:airline#extensions#tabline#enabled = 1
"if exists(":filetype")
"	filetype plugin indent on
"	runtime ftplugin/man.vim " to have :Man available
"endif

" some servers refuse to respond to user agents they assume to be spiders
"let g:netrw_http_cmd  = \"wget -U 'Vim (netrw 6.2)' -O"

" for :TOhtml
"let g:html_use_css = 1
"let g:html_use_xhtml = 1
"let g:html_number_lines = 1

" FIXME: the following need a better solution

"autocmd BufNewFile *.html execute \"normal I<\!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">\<C-M><html>\<C-M><head>\<C-M><title>title</title>\<C-M><style type=\"text/css\"><!--\<C-M>\<C-M>--></style>\<C-M></head>\<C-M><body>\<C-M>\<C-M></body>\<C-M></html>\<ESC>{"

"autocmd BufNewFile *.pm,*.pl execute \"normal I#!/usr/bin/perl\<C-M>\<BS>use strict\;\<C-M>use warnings\;\<C-M>\<C-M>\<ESC>jo\<C-M>"
