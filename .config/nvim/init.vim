" [ General settings ]
set number relativenumber nohlsearch mouse=nv completeopt-=preview
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set encoding=utf-8 nobomb
set ignorecase smartcase gdefault
set undofile wildignore=*.o,*.obj,*.bak,*.exe,*.swp,*.pyc,**/node_modules/*,**/.git/*
set signcolumn=yes
set splitright splitbelow nowrap
set path+=** tags=./tags
set noshowmode
set cmdheight=1
set noswapfile nobackup

" keep cursor in center of screen
set scrolloff=40 showcmd hidden wildmode=list:longest


" [ Plugins ]

call plug#begin('~/.local/share/nvim/plugged')

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'nvim-treesitter/nvim-treesitter', { 'do': 'TSUpdate' }
Plug 'nvim-treesitter/playground'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'

"   [color scheme]
Plug 'doums/darcula'
Plug 'briones-gabriel/darcula-solid.nvim' " Jetbrains like
Plug 'rktjmp/lush.nvim'
Plug 'crusoexia/vim-monokai' " Sublime-text like
Plug 'morhetz/gruvbox'

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
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescriptreact' }
Plug 'peitalin/vim-jsx-typescript', { 'for': 'typescriptreact' }

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
" Plug 'vim-syntastic/syntastic', { 'for': ['python'] }
Plug 'dense-analysis/ale', { 'for': ['c', 'cpp', 'html', 'javascript', 'asm', 'make', 'plaintex'] }

call plug#end()

"   [ coloring ]
set termguicolors
syntax on
colorscheme darcula-solid
set colorcolumn=100
set cursorline
highlight ColorColumn   ctermbg=235 guibg=#242331
highlight CursorLine    ctermbg=235 guibg=#242331 cterm=none
highlight CursorLineNr  cterm=none  ctermfg=11    gui=bold      guifg=Yellow
highlight Normal        ctermfg=254 ctermbg=0     guifg=#A9B7C6 guibg=#000000
highlight clear SignColumn
highlight clear LineNr


" [ Coc ]
highlight CocErrorSign   ctermfg=9  guifg=#ff0000
highlight CocHintSign    ctermfg=39 guifg=#00afff
highlight CocWarningSign ctermfg=11 guifg=#fffd00
highlight CocInfoSign    ctermfg=15 guifg=#ffffff

" [ treesitter ]
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}
" highlight String ctermfg=113 guifg=#87ff5f

" [ misc ]
autocmd FileType html let b:delimitMate_matchpairs = "(:),[:],{:}" "delimitMate clash with autocloseit, disable matching <:>
let delimitMate_expand_cr = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
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
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 2
let g:syntastic_auto_jump = 3
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "\u2717"
let g:syntastic_warning_symbol = "\u26A0"
let g:syntastic_asm_compiler = "nasm"
" let g:syntastic_ignore_files = ["java", "c", "md"] " Disable java syntax check, causing crippling delay
let g:syntastic_ignore_extensions="\c\v^([gx]?z|lzma|bz2|c|java|md)$"

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
map <silent> <F3> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowLineNumbers = 1
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeCustomOpenArgs={'file': {'reuse':'currenttab', 'where':'p', 'keepopen':1, 'stay':1}}


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

" [ supertab ]
"let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabDefaultCompletionType = "<c-n>"

" [ glaive + codefmt ]
call glaive#Install()

Glaive codefmt google_java_executable="java -jar /home/zeheater/Tools/google-java-format/core/target/google-java-format-1.8-SNAPSHOT-all-deps.jar"

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType proto,javascript AutoFormatBuffer js-beautify
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

nmap <silent> gd <Plug>(coc-definition)
"nmap <C-n> <Plug>(coc-diagnostic-prev)
nmap <C-m> <Plug>(coc-diagnostic-next)

" old habbit
nmap <C-a> gg0vG$

" buffer walking
" note C-[ is <Esc>
"nmap <silent> <C-[> :bp<CR>
" note C-m is enter
nmap <silent> <C-]> :bn<CR>

" keeping it center
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" undo break points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap } }<ESC>=iB<C-o>i

" copying text
vnoremap <leader>y "+y
nnoremap <leader>y "+y

" pasting text
nnoremap <leader>p "+P
xnoremap <leader>p "_dP

" moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <ESC>:m .+1=<CR>==i
inoremap <C-k> <ESC>:m .-2=<CR>==i
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" deleting text
" nnoremap d "_d
vnoremap x "_d

" selecting text
nnoremap <leader>v ^v$

" move path to cwd
nnoremap <silent> <F2> :lchdir %:p:h<CR>:pwd<CR>

" easier buffer walking
nnoremap <silent> <C-H> <C-W><C-H>
nnoremap <silent> <C-L> <C-W><C-L>
nnoremap <silent> <C-J> <C-w><Down>
nnoremap <silent> <C-K> <C-w><Up>

" use tabs as well as %s for matching brackets
" nnoremap <tab> %
" vnoremap <tab> %

" remap ; to : to save on hitting shift
nnoremap ; :

" map PageUp,PageDwn to Ctrl-D
nnoremap <PageUp> <C-u>
nnoremap <PageDown> <C-d>

" move entire line to null register, deleting it
imap <C-d> <C-o>"_dd

" duplicate line
imap <C-l> <C-o>:t.<CR>
vmap <C-l> :t'><CR>

" disable arrow keys
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" vertical resize
nnoremap <silent> <leader>- :vertical resize +5<CR>
nnoremap <silent> <leader>= :vertical resize -5<CR>

" shorthand to search-replace word under cursor
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" shorthand to create new buffer on right
nnoremap <C-w>n :vertical new<CR>

" git blame
vmap gl :Gblame<CR>

" codefmt
nnoremap <leader>g= :FormatCode<CR>

" ALE
" nmap <silent> <C-j> <Plug>(ale_next)
" nmap <silent> <C-k> <Plug>(ale_previous)

" Snippets
nnoremap <silent> ,mitm :-read $HOME/.config/nvim/.skeleton_mitm.py<CR>
nnoremap <silent> ,ansc :-read $HOME/.config/nvim/.skeleton_android_network_security_config.xml<CR>
nnoremap <silent> ,sysd :-read $HOME/.config/nvim/.skeleton_systemd.service<CR>gg1j12la
nnoremap <silent> ,syst :-read $HOME/.config/nvim/.skeleton_systemd.timer<CR>
nnoremap <silent> ,nasm :-read $HOME/.config/nvim/.skeleton_nasm.asm<CR>gg6jA
nnoremap <silent> ,cc :-read $HOME/.config/nvim/.skeleton_c.c<CR>gg4jA
nnoremap <silent> ,jss :-read $HOME/.config/nvim/.skeleton_scrape.js<CR>
nnoremap <silent> ,pys :-read $HOME/.config/nvim/.skeleton_scrape.py<CR>gg9jf'a

" Terminal map
tnoremap <Esc> <C-\><C-n>

" [ strip trailing whitespace ]
autocmd FileType cmake,c,cs,cpp,gradle,groovy,java,cql,sql,vcl,ice,php,javascript,css,html,perl,ruby,sh,python,gitcommit,gitconfig,git,xml,yml,yaml,nginx autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" [ override file settings ]
autocmd FileType c,cpp,markdown,html,xml,ruby,sh,javascript,javascript.jsx,jsx,typescriptreact,json,yaml,sql,vim,cmake,proto,typescript,ps1,anko,bzl,dart setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType gitconfig setlocal tabstop=2 shiftwidth=2 softtabstop=2 noexpandtab
autocmd FileType nginx setlocal tabstop=3 shiftwidth=3 softtabstop=3 noexpandtab

" [ run python ]
" autocmd FileType python hi Pmenu ctermbg=8
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!env python' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <C-o>:w<CR><C-o>:exec '!env python' shellescape(@%, 1)<CR>

" [ run nasm ]
autocmd BufNewFile,BufRead *.nasm set filetype=asm shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" [ run rust ]
autocmd FileType rust map <buffer> <F9> :w<CR>:exec '!cargo run' <CR>

" [ run markdown ]
autocmd FileType markdown map <buffer> <F9> :w<CR>:MarkdownPreview<CR>

" [ nginx filetype helper ]
autocmd BufRead,BufNewFile /etc/nginx/*,/etc/nginx/conf.d/*,/usr/local/nginx/conf/*,$HOME/var/www/conf/* if &ft == '' | set filetype=nginx | endif

" [ latex ]
autocmd FileType tex nnoremap <F9> :!make<CR>
autocmd FileType tex nnoremap <F11> :!zathura %:r.pdf<CR>

" [ php ]
autocmd FileType php set autoindent

"
"
"
"
" if (!exists('*Refresh'))
"   function! Refresh(args) abort
"     exec 'colorscheme '. a:args
"     AirlineRefresh
"     set colorcolumn=100
"     set cursorline
"     highlight ColorColumn   ctermbg=235 guibg=#242331
"     highlight CursorLine    ctermbg=235 guibg=#242331 cterm=none
"     highlight CursorLineNr  cterm=none  ctermfg=11    gui=bold      guifg=Yellow
"     highlight Normal        ctermfg=254 ctermbg=0     guifg=#A9B7C6 guibg=#000000
"     highlight clear SignColumn
"     highlight clear LineNr
"   endfunction
" endif

