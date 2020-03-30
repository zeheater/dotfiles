call plug#begin('~/.local/share/nvim/plugged')

Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'fs111/pydoc.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vim-python/python-syntax'
"Plug 'vimwiki/vimwiki'
"Plug 'artur-shaik/vim-javacomplete2'
Plug 'tpope/vim-fugitive'
call plug#end()

let g:powerline_pycmd="py3"
let g:deoplete#enable_at_startup = 1
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='angr'

"vim-jedi configuration
"----------------------
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 0
"let g:jedi#use_tabs_not_buffers = 1
let g:jedi#use_splits_not_buffers = "right"
"let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = "2"
"----------------------

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰ '
"let g:airline_symbols.linenr = 'Ξ'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncomment to autostart the NERDTree
" autocmd vimenter * NERDTree
map <F3> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1

let g:python_highlight_all = 1

syntax on
filetype plugin indent on
set title
set nocompatible
set hidden
set path+=**
set wildmenu
set mouse=a
set encoding=utf-8 nobomb
set nowrap
set noshowmode
set number relativenumber
set nohlsearch
set tabstop=5 shiftwidth=5 expandtab
set ignorecase smartcase gdefault
set scrolloff=40 showcmd hidden wildmode=list:longest
set laststatus=2
set splitright
"set completeopt+=menuone,preview,noinsert
"set completeopt-=preview
set completeopt=longest
set tags=./tags;


:nnoremap <C-d> "_dd
:nnoremap <C-l> :co.<CR>
:nnoremap <F7> mzgg=G`z
:nmap <Tab> gt
:nmap <S-Tab> gT
:nmap <C-x> 0ddk
:map <C-a> <esc>ggVG<CR>
:map <C-f> :%!python -m json.tool<CR>

:imap <C-x> <C-o>dd
:imap <C-v> <C-o>p
:imap <S-Tab> <C-o>gt
:imap <C-d> <C-o><C-d>
:imap <C-l> <C-o><C-l>
:imap <C-s> <C-o>:%s/\s\+$//e<CR><C-o>:w<CR>
":imap <C-s> <C-o>:w<CR>
:imap <S-Home> <C-o>v^
":imap <Nul> <C-x><C-o>
:imap <Nul> <Nop>
:imap <C-f> <C-o><C-f>
":imap <F2> <C-o>:call jedi#rename()<CR>

:vnoremap <C-c> "+y

" disable arrow keys
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" Snippets
nnoremap ,mitm :-read $HOME/.vim/.skeleton_mitm.py<CR>
nnoremap ,ansc :-read $HOME/.vim/.skeleton_android_network_security_config.xml<CR>

" Highlight trailing space
map <F5> /\S\zs\s\+$<CR>

autocmd! BufWritePost $MYVIMRC source $MYVIMRC

" If python script map F2 to rename function
autocmd Filetype python inoremap <buffer> <F2> <C-o>:call jedi#rename()<CR>
