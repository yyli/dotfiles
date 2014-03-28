set nocompatible

set hidden 


" From vimrc_example
if has("autocmd")
	filetype plugin indent on

	augroup vimrcEx
	au!

	" For all text files set 'textwidth' to 78 characters.
	autocmd FileType text setlocal textwidth=78

	" Enable folding for C and C++ files
	autocmd Syntax c,cpp setlocal foldmethod=syntax
	autocmd Syntax c,cpp set comments-=://

	autocmd BufReadPost *
	  \ if line("'\"") > 1 && line("'\"") <= line("$") |
	  \   exe "normal! g`\"" |
	  \ endif

	augroup END
else
	set autoindent		" always set autoindenting on
endif

if !&diff
	au VimEnter * exe "normal zR" | au BufReadPost * exe "normal zR"
end

inoremap <Nul> <C-n>

set t_Co=256
"set background=dark
syntax on
colorscheme elflord
set number
set ruler

"highlight OverLength ctermbg=DarkRed ctermfg=white guibg=#592929
"match Error /\%81v.\+/

set wildmenu

set showcmd

set hlsearch

set backspace=indent,eol,start

set nostartofline

" Indentation options
set shiftwidth=4
set tabstop=4
set noet sts=0 sw=4 ts=4
set cindent
set cinoptions=(0,u0,U0
set expandtab

set ssop-=options


map <F7> :tabp<CR>
map <F8> :tabn<CR>

map <F9>  :cn<CR>
map <F10> :cp<CR>


" From vimrc_example
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
