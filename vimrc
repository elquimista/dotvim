"
"      //                      o        _/_
"  _  //    _,  . . _    ______' _  _   /
" </_</_   (_)_(_/_</_  / / / <_</_/_)_<__
"           />
"          |/
"
" Prerequisites:
"
" brew install fzf
" brew install fd
" brew install ripgrep

call plug#begin('~/.vim/plugins')
  Plug '$FZF_BASE'
  Plug 'junegunn/fzf.vim'
  Plug 'mhinz/vim-grepper'
  " Plug 'NLKNguyen/papercolor-theme'
  Plug 'morhetz/gruvbox'
  Plug 'itchyny/lightline.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'kchmck/vim-coffee-script'
  Plug 'MaxMEllon/vim-jsx-pretty'
  Plug 'plasticboy/vim-markdown'
  Plug 'slim-template/vim-slim'
  Plug 'jparise/vim-graphql'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-endwise'
  Plug 'andymass/vim-matchup'
  Plug 'w0rp/ale'
  Plug 'maximbaz/lightline-ale'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'
  Plug 'tpope/vim-commentary'
  Plug 'yssl/QFEnter'
  Plug 'junegunn/limelight.vim'
  Plug 'edkolev/tmuxline.vim'
  Plug 'guns/xterm-color-table.vim'
  Plug 'leafOfTree/vim-svelte-plugin'
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'stefandtw/quickfix-reflector.vim'
call plug#end()

let mapleader=','
set backspace=
set complete-=i
set exrc " allows per-project vimrc files

" ┌─┐┌─┐┬  ┌─┐┬─┐┌─┐
" │  │ ││  │ │├┬┘└─┐
" └─┘└─┘┴─┘└─┘┴└─└─┘
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set background=dark
colorscheme gruvbox

" ┌─┐┬ ┬┌┐┌┌┬┐┌─┐─┐ ┬
" └─┐└┬┘│││ │ ├─┤┌┴┬┘
" └─┘ ┴ ┘└┘ ┴ ┴ ┴┴ └─
syntax on
let g:vim_svelte_plugin_use_sass = 1

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
" highlight Comment cterm=italic

let g:javascript_plugin_flow=1
let g:ale_open_list = 0
nmap <silent> <leader><C-k> <plug>(ale_previous_wrap)
nmap <silent> <leader><C-j> <plug>(ale_next_wrap)

augroup filetypedetect
  au BufRead,BufNewFile *.coffee set filetype=coffee
  au BufRead,BufNewFile *.slim set filetype=slim
  au BufRead,BufNewFile *.graphql set filetype=graphql
  au BufRead,BufNewFile *.svelte set filetype=html.svelte
augroup END

" ┌─┐┌─┐┌─┐┌─┐┌─┐┌─┐   ┬   ┌┬┐┌─┐┌┐ ┌─┐
" └─┐├─┘├─┤│  ├┤ └─┐  ┌┼─   │ ├─┤├┴┐└─┐
" └─┘┴  ┴ ┴└─┘└─┘└─┘  └┘    ┴ ┴ ┴└─┘└─┘
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" ┬ ┬┬  ┌─┐┌─┐┌┐┌┌─┐┬┌─┐
" │ ││  │  │ ││││├┤ ││ ┬
" └─┘┴  └─┘└─┘┘└┘└  ┴└─┘
set number
set showcmd
set cursorline
filetype plugin indent on
set wildmenu
set showmatch
set colorcolumn=81
set laststatus=2
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c"
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [
      \     ['mode', 'paste'],
      \     ['readonly', 'filename', 'modified'],
      \   ],
      \   'right': [
      \     ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'],
      \     ['percent', 'lineinfo'],
      \     ['fileformat', 'fileencoding', 'filetype'],
      \   ],
      \ },
      \ 'tabline': {
      \   'left': [['tabs']],
      \   'right': [],
      \ },
      \ 'component_expand': {
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \   'linter_checking': 'left',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'left',
      \ },
      \ }
set noshowmode
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_winsize=25

" ┌─┐┌─┐┬  ┬┌┬┐┌┬┐┬┌┐┌┌─┐
" └─┐├─┘│  │ │  │ │││││ ┬
" └─┘┴  ┴─┘┴ ┴  ┴ ┴┘└┘└─┘
set splitbelow
set splitright

" ┌─┐┌─┐┌─┐┬─┐┌─┐┬ ┬┬┌┐┌┌─┐
" └─┐├┤ ├─┤├┬┘│  ├─┤│││││ ┬
" └─┘└─┘┴ ┴┴└─└─┘┴ ┴┴┘└┘└─┘
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>
let g:grepper = {
    \ 'tools': ['rg', 'git'],
    \ }
nnoremap <leader>g :Grepper<CR>
nnoremap <leader>* :Grepper -cword -noprompt<CR>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
let g:qfenter_keymap = {
    \ 'vopen': ['<C-v>'],
    \ 'hopen': ['<C-x>'],
    \ 'topen': ['<C-t>'],
    \ }
let g:qfenter_enable_autoquickfix=0

" ┌─┐┌─┐┬  ┌┬┐┬┌┐┌┌─┐
" ├┤ │ ││   │││││││ ┬
" └  └─┘┴─┘─┴┘┴┘└┘└─┘
set foldenable
set foldmethod=indent
set foldlevelstart=10
set foldnestmax=10

" ┌─┐┬ ┬┌─┐┌┬┐┌─┐┌┬┐  ┌┬┐┌─┐┬  ┬┌─┐┌┬┐┌─┐┌┐┌┌┬┐┌─┐
" │  │ │└─┐ │ │ ││││  ││││ │└┐┌┘├┤ │││├┤ │││ │ └─┐
" └─┘└─┘└─┘ ┴ └─┘┴ ┴  ┴ ┴└─┘ └┘ └─┘┴ ┴└─┘┘└┘ ┴ └─┘
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]
nnoremap <Left>   :echoe "Use h"<CR>
nnoremap <Right>  :echoe "Use l"<CR>
nnoremap <Up>     :echoe "Use k"<CR>
nnoremap <Down>   :echoe "Use j"<CR>

inoremap jk <esc>
inoremap <esc> <nop>
nnoremap <leader>s :mksession!<CR>

" ┌┐ ┌─┐┌─┐┬┌─┬ ┬┌─┐┌─┐   ┬ ┬┌┐┌┌┬┐┌─┐┌─┐┬┬  ┌─┐┌─┐   ┌─┐┬ ┬┌─┐┌─┐  ┌─┐┬┬  ┌─┐┌─┐
" ├┴┐├─┤│  ├┴┐│ │├─┘└─┐   │ ││││ │││ │├┤ ││  ├┤ └─┐   └─┐│││├─┤├─┘  ├┤ ││  ├┤ └─┐
" └─┘┴ ┴└─┘┴ ┴└─┘┴  └─┘┘  └─┘┘└┘─┴┘└─┘└  ┴┴─┘└─┘└─┘┘  └─┘└┴┘┴ ┴┴    └  ┴┴─┘└─┘└─┘
set backup
set backupdir=~/.vim/tmp/backup
if !isdirectory(&backupdir) | call mkdir(&backupdir, 'p', 0700) | endif
set writebackup
set noundofile
set dir=~/.vim/tmp/swap
if !isdirectory(&dir) | call mkdir(&dir, 'p', 0700) | endif

" ┌─┐┬ ┬┌─┐┌┬┐┌─┐┌┬┐  ┌─┐┬ ┬┌┐┌┌─┐┌┬┐┬┌─┐┌┐┌┌─┐
" │  │ │└─┐ │ │ ││││  ├┤ │ │││││   │ ││ ││││└─┐
" └─┘└─┘└─┘ ┴ └─┘┴ ┴  └  └─┘┘└┘└─┘ ┴ ┴└─┘┘└┘└─┘
function! ToggleNumber()
  if (&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc

noremap <leader>tn :call ToggleNumber()<CR>

" let g:skipview_files = []
" function! MakeViewCheck()
"   if has('quickfix') && &buftype =~ 'nofile'
"     " Buffer is marked as not a file
"     return 0
"   endif
"   if empty(glob(expand('%:p')))
"     " File does not exist on disk
"     return 0
"   endif
"   if len($TEMP) && expand('%:p:h') == $TEMP
"     " We're in a temp dir
"     return 0
"   endif
"   if len($TMP) && expand('%:p:h') == $TMP
"     " Also in temp dir
"     return 0
"   endif
"   if index(g:skipview_files, expand('%')) >= 0
"     " File is in skip list
"     return 0
"   endif
"   return 1
" endfunction

" augroup vimrcAutoView
"   au BufWritePost,BufLeave,WinLeave ?* if MakeViewCheck() | mkview | endif
"   au BufWinEnter ?* if MakeViewCheck() | silent loadview | endif
" augroup end

if has('autocmd')
  autocmd BufReadPost fugitive://* set bufhidden=delete
endif

set secure " disables unsafe commands in per-project vimrc files
