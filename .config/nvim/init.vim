" [ General settings ]
set title number relativenumber nohlsearch mouse=n completeopt-=preview
set tabstop=5 shiftwidth=5 expandtab
set encoding=utf-8 nobomb
set ignorecase smartcase gdefault
set undofile wildignore=*.o,*.obj,*.bak,*.exe,*.swp
set signcolumn=yes
set splitright splitbelow nowrap
set path+=** tags=./tags
set noshowmode

" keep cursor in center of screen
set scrolloff=40 showcmd hidden wildmode=list:longest

syntax on
highlight clear SignColumn

" [ Plugins ]

call plug#begin('~/.local/share/nvim/plugged')

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif

"   [ status / side bar ]
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"   [ edit mode plugins ]
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'Raimondi/delimitMate'   " autoclose delimiters on open (quotes/brackets)
Plug 'tmhedberg/matchit'      " match brackets with %
Plug 'alvan/vim-closetag'     " auto close html tag

"   [ language plugins ]
Plug 'vim-python/python-syntax', {'for': 'python'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'zchee/deoplete-jedi', {'for': 'python'}
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'tweekmonster/deoplete-clang2', { 'for': ['c', 'cpp'] }
Plug 'sebastianmarkow/deoplete-rust', { 'for': 'rust' }
Plug 'deoplete-plugins/deoplete-asm', { 'for': 'asm' }

"   [ nginx conf ]
Plug 'chr4/nginx.vim'

"   [ mardown viewer ]
Plug 'iamcco/markdown-preview.nvim', { 'do' : 'cd app && yarn install' }

"   [ google codefmt ]
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

"   [ file manager plugin ]
Plug 'scrooloose/nerdtree'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"   [ other ]
"Plug 'godlygeek/tabular'
Plug 'editorconfig/editorconfig-vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'vim-syntastic/syntastic', { 'for': ['python'] }
Plug 'dense-analysis/ale', { 'for': ['c', 'cpp', 'html', 'javascript', 'asm', 'make', 'plaintex'] }

call plug#end()

" [ misc ]
autocmd FileType html let b:delimitMate_matchpairs = "(:),[:],{:}" "delimitMate clash with autocloseit, disable matching <:> 
let delimitMate_expand_cr = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='angr'
let g:deoplete#enable_at_startup = 1
let g:closetag_filetypes = 'html,xml,markdown'

" [ markdown-preview ]
let g:mkdp_refresh_slow = 1
let g:mkdp_browser = 'firefox'

" [ gitgutter ]
highlight GitGutterAdd    guifg=#009900 guibg=NONE ctermfg=2 ctermbg=NONE
highlight GitGutterChange guifg=#bbbb00 guibg=NONE ctermfg=3 ctermbg=NONE
highlight GitGutterDelete guifg=#ff2222 guibg=NONE ctermfg=1 ctermbg=NONE

" [ syntastic ]
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "\u2717"
let g:syntastic_asm_compiler = "nasm"
let g:syntastic_ignore_files = ["java","md"] " Disable java syntax check, causing crippling delay

" [ ALE ]
let g:airline#extensions#ale#enabled = 1
let g:ale_completion_enabled = 0
let g:ale_fix_on_save = 1
let g:ale_sign_error = "\u2717"
let g:ale_sign_warning = "\ue009"
let g:ale_sign_info = "\uf05a"
let g:ale_set_loclist = 0
let g:ale_fixers = { 'javascript': ['prettier'] }
let g:ale_linters = { 'make': ['checkmake'], 'asm': ['gcc'] }

" [ NERDTree ]
map <F3> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowLineNumbers = 1
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeCustomOpenArgs={'file': {'reuse':'currenttab', 'where':'p', 'keepopen':1, 'stay':1}}

" [ python-syntax ]
let g:python_highlight_all = 1

" [ jedi-vim ]
"let g:jedi#use_splits_not_buffers = "right"
let g:jedi#auto_vim_configuration = 1
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = 2
let g:jedi#completions_enabled = 0

" [ vim-go ]
let g:go_auto_type_info = 1
let g:go_fmt_command = 'gofumports'
let g:go_fmt_fail_silently = 1
"let g:go_gocode_autobuild = 1
"let g:go_gocode_propose_source = 1
"let g:go_gocode_unimported_packages = 1
let g:go_highlight_diagnostic_errors = 0
let g:go_highlight_diagnostic_warnings = 0
let g:go_list_type = 'quickfix'
let g:go_updatetime = 350

" [ deoplete-rust ]
let g:deoplete#sources#rust#racer_binary='/usr/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/zeheater/Sandbox/rust-src/src'
let g:deoplete#sources#rust#show_duplicates=1

" [ deoplete-clang2 ]
let g:deoplete#sources#clang#executable='/usr/bin/clang'
call deoplete#custom#source('clang2', 'min_pattern_length', 2)

" [ supertab ]
"let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabDefaultCompletionType = "<c-n>"

" [ glaive + codefmt ]
call glaive#Install()

Glaive codefmt google_java_executable="java -jar /home/zeheater/Tools/google-java-format/core/target/google-java-format-1.8-SNAPSHOT-all-deps.jar"

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType proto,javascript AutoFormatBuffer clang-format
  "autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  "autocmd FileType java AutoFormatBuffer google-java-format
  "autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

" [ custom key maps ]

" move path to cwd
nnoremap <silent> <F2> :lchdir %:p:h<CR>:pwd<CR>

" easier buffer walking
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <C-PageDown> :bn<CR>
nnoremap <silent> <C-PageUp> :bp<CR>

" use tabs as well as %s for matching brackets
nnoremap <tab> %
vnoremap <tab> %

" remap ; to : to save on hitting shift
nnoremap ; :

" map PageUp,PageDwn to Ctrl-D
nnoremap <PageUp> <C-u>
nnoremap <PageDown> <C-d>

" move entire line to null register, deleting it
imap <C-d> <C-o>"_dd

" duplicate entire line
nnoremap <C-l> :co.<CR>$
imap <C-l> <C-o>:co.<CR><C-o>$

" disable q keys
nnoremap q <Nop>
vnoremap q <Nop>

" disable arrow keys
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" git blame
vmap gl :Gblame<CR>

" codefmt
nnoremap <Leader>= :FormatCode<CR>

" ALE
nmap <silent> <C-j> <Plug>(ale_next)
nmap <silent> <C-k> <Plug>(ale_previous)

" Snippets
nnoremap <silent> ,mitm :-read $HOME/.config/nvim/.skeleton_mitm.py<CR>
nnoremap <silent> ,ansc :-read $HOME/.config/nvim/.skeleton_android_network_security_config.xml<CR>
nnoremap <silent> ,sysd :-read $HOME/.config/nvim/.skeleton_systemd.service<CR>gg1j12la
nnoremap <silent> ,syst :-read $HOME/.config/nvim/.skeleton_systemd.timer<CR>
nnoremap <silent> ,nasm :-read $HOME/.config/nvim/.skeleton_nasm.asm<CR>gg6jA
nnoremap <silent> ,cc :-read $HOME/.config/nvim/.skeleton_c.c<CR>gg4jA

" Terminal map
tnoremap <Esc> <C-\><C-n>

" [ strip trailing whitespace ]
autocmd FileType cmake,c,cs,cpp,gradle,groovy,java,cql,sql,vcl,ice,php,javascript,css,html,perl,ruby,sh,python,gitcommit,gitconfig,git,xml,yml,yaml,markdown,nginx autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" [ override file settings ]
autocmd FileType c,cpp,markdown,html,xml,ruby,sh,javascript,javascript.jsx,jsx,json,yaml,sql,vim,cmake,proto,typescript,ps1,anko,bzl,dart setlocal tabstop=2 shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType gitconfig setlocal tabstop=2 shiftwidth=2 softtabstop=2 noexpandtab
autocmd FileType nginx setlocal tabstop=3 shiftwidth=3 softtabstop=3 noexpandtab

" [ run python ]
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <C-o>:w<CR><C-o>:exec '!python3' shellescape(@%, 1)<CR>

" [ run go ]
autocmd FileType go let g:deoplete#sources#go#gocode_binary = '/home/zeheater/go/bin/gocode'
"autocmd FileType go call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*', })

" [ run nasm ]
autocmd BufNewFile,BufRead *.nasm set filetype=asm shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" [ run rust ]
autocmd FileType rust map <buffer> <F9> :w<CR>:exec '!cargo run' <CR>

" [ run markdown ]
autocmd FileType markdown map <buffer> <F9> :w<CR>:MarkdownPreview<CR>

" [ nginx filetype helper ]
autocmd BufRead,BufNewFile /etc/nginx/*,/etc/nginx/conf.d/*,/usr/local/nginx/conf/*,$HOME/var/www/conf/* if &ft == '' | set filetype=nginx | endif


"
"
"
"
"
"
