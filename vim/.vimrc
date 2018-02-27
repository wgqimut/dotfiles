" modify the leader key
let mapleader = ','
let g:mapleader = ','
"set csprg=gtags-cscope " set cscope as the gtags client

syntax on
set noswapfile
set autoread
set scrolloff=7
set number
set showmatch
set hlsearch
set incsearch
set autoindent
set wildmode=list:longest
set wildmenu

"about tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set shiftround

" about file encoding
set encoding=utf-8
set ffs=unix,mac,dos


" cancle the ring bell when error occus.
set novisualbell
set noerrorbells
set t_vb=
set tm=500


"install bundles
if filereadable(expand("~/.vimrc.bundles"))
	source ~/.vimrc.bundles
endif
filetype plugin indent on


" autoload when vimrc modifed
autocmd! bufwritepost .vimrc source %

" F2 for hidden line number when copy code
function! HideNumber()
    if(&relativenumber == &number)
        set number!
    elseif(&number)
		set number!
	endif
	set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>
nnoremap <Leader><space> :noh<cr>


"let g:Lf_Ctags = '/usr/local/bin/global'
