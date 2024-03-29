set t_Co=256
set number
set linebreak
set showbreak=+++ 
set textwidth=100
set showmatch
"set visualbell
set hlsearch
set smartcase
set ignorecase
set incsearch
set autoindent
set nowrap
set cindent
set shiftwidth=4
"set smartindent
"set smarttab
set softtabstop=4
set ruler
set undolevels=1000
set backspace=indent,eol,start
syntax enable
set clipboard=unnamed "在Vim中copy的所有内容都会上系统剪切板。
set completeopt-=preview
set encoding=utf-8

set bg=dark
set incsearch

set whichwrap=b,s,<,>,[,] "讓方向鍵通過斷行

"摺疊原始碼
set foldmethod=marker
"au BufWinLeave * silent mkview  " 保存文件的折叠状态
"au BufRead * silent loadview    " 恢复文件的折叠状态
nnoremap <space> za
" 用空格来切换折叠状态


"滑鼠
set mouse=a


" vim色彩"
colorscheme blackboard
set cursorline
set cursorcolumn
"highlight CursorLine cterm=bold ctermbg=DarkGray ctermfg=Yellow
"highlight CursorColumn cterm=bold ctermbg=DarkGray 
"YCM
"let g:ycm_global_ycm_extra_conf= '~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf=0 
"let g:ycm_show_diagnostics_ui=0
"let g:ycm_enable_diagnostic_signs=0
"let g:ycm_enable_diagnostic_highlighting=0
""let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_semantic_triggers =  {
"			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
"			\ 'cs,lua,javascript': ['re!\w{2}'],
"			\ }
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
let g:ycm_add_preview_to_completeopt = 0

"
set nocompatible              " be iMproved, required

"ALE config
let g:ale_completion_enabled = 0

let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'

let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\}
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

"vim-airline config for ALE
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='wombat'
"status bar
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
"tabline
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

"Rainbow indent
"let g:indent_guides_enable_on_vim_startup = 1


"USE vim-plug INSTEAD !!!
call plug#begin('~/.vim/plugged')
"Plug 'Valloric/YouCompleteMe'
"Plug 'mjbrownie/browser.vim'
"Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
"Plugin 'tmhedberg/SimpylFold'
"Plugin 'vhda/verilog_systemverilog.vim'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'gilligan/vim-lldb'
Plug 'skywind3000/asyncrun.vim'
" Plug 'zxqfl/tabnine-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'ryanoasis/vim-devicons'

call plug#end()
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
"
"
"
" Setting for Coc
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


"Setting for asyncrun 
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 8
" 任务结束时候响铃提醒
"let g:asyncrun_bell = 1
" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>


"powline rc

"set guifont=Inconsolata\ for\ Powerline:h15
"let g:Powerline_symbols = 'fancy'
"set encoding=utf-8
"set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8


"括號自動對齊
inoremap ( ()<Esc>i
"上面：()
inoremap " ""<Esc>i
"上面： 
inoremap ' ''<Esc>i
"上面： ''
inoremap [ []<Esc>i
"上面： []
inoremap {<CR> {<CR>}<Esc>ko 
"上面： {}

inoremap {{ {}<ESC>i 
"上面：陣列的宣告,需一次輸入兩個{{再按Enter


"Set to use Ctrl to skip one word by click ctrl-arrow
execute "set <xUp>=\e[1;*A" 
execute "set <xDown>=\e[1;*B"
execute "set <xRight>=\e[1;*C"
execute "set <xLeft>=\e[1;*D"
