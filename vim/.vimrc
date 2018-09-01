" modify the leader key
let mapleader = ","
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


let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'

" before plug#begin() call
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" for vim-plug plugin manager
call plug#begin('~/.vim/plugged')

" manage the many kinds of 'tags' file
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/vim-preview'
Plug 'Yggdroot/LeaderF', {'do': './install.sh'}

call plug#end()

noremap <c-n> :LeaderfMru<cr>
noremap <m-p> :LeaderfFunction!<cr>
noremap <m-n> :LeaderfBuffer<cr>
noremap <m-m> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}




"config for vim-gutentags

" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
"if executable('ctags')
"let g:gutentags_modules += ['ctags']
"endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(g:gutentags_cache_dir)
   silent! call mkdir(g:gutentags_cache_dir, 'p')
endif

"for cscope tags
let g:gutentags_plus_nomap = 1
noremap <silent> <leader>gd :GscopeFind g <C-R><C-W><cr>
noremap <silent> <leader>gr :GscopeFind c <C-R><C-W><cr>
"下面其实不常用
noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>






"install bundles
"if filereadable(expand("~/.vimrc.bundles"))
	"source ~/.vimrc.bundles
"endif
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
nnoremap <Leader>w :w<CR>
nnoremap <Leader>s :wq<CR>

" remove trailing whitespaces
noremap <silent> <Leader><Space> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:w<CR>


let g:gutentags_define_advanced_commands = 1
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
noremap <F4> :PreviewSignature!<cr>
inoremap <F4> <c-\><c-o>:PreviewSignature!<cr>


"let g:Lf_Ctags = '/usr/local/bin/global'
