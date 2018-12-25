"
"      //                      o        _/_
"  _  //    _,  . . _    ______' _  _   /
" </_</_   (_)_(_/_</_  / / / <_</_/_)_<__
"           />
"          |/
"
set runtimepath^=~/.vim/plugins/vim-one
set runtimepath^=~/.vim/plugins/vim-javascript
set runtimepath^=~/.vim/plugins/vim-jsx
set runtimepath^=~/.vim/plugins/auto-pairs
set runtimepath^=~/.vim/plugins/vim-endwise
set runtimepath^=~/.vim/plugins/vim-slim
set runtimepath^=~/.vim/plugins/vim-markdown
set runtimepath^=~/.vim/plugins/vim-matchup
set runtimepath^=~/.vim/plugins/ale
set runtimepath^=~/.vim/plugins/vim-tmux-navigator
set runtimepath^=~/.vim/plugins/vim-git-blame
set runtimepath^=~/.vim/plugins/lightline.vim
set runtimepath^=~/.vim/plugins/lightline-ale
set runtimepath^=~/.vim/plugins/vim-fugitive
set runtimepath^=~/.vim/plugins/vim-graphql

let mapleader=','
set backspace=
set complete-=i

" ┌─┐┌─┐┬  ┌─┐┬─┐┌─┐
" │  │ ││  │ │├┬┘└─┐
" └─┘└─┘┴─┘└─┘┴└─└─┘
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set background=dark
colorscheme one

" ┌─┐┬ ┬┌┐┌┌┬┐┌─┐─┐ ┬
" └─┐└┬┘│││ │ ├─┤┌┴┬┘
" └─┘ ┴ ┘└┘ ┴ ┴ ┴┴ └─
syntax on
let g:javascript_plugin_flow=1
let g:ale_open_list = 1
augroup filetypedetect
  au BufRead,BufNewFile *.js,*.jsx set filetype=javascript.jsx
  au BufRead,BufNewFile *.slim set filetype=slim
  au BufRead,BufNewFile *.graphql set filetype=graphql
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
set colorcolumn=80
func! LightlineGitBranch()
  return exists('*fugitive#head') ? ' '.fugitive#head() : ''
endfunc
set laststatus=2
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c"
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [
      \     ['mode', 'paste'],
      \     ['gitbranch', 'readonly', 'filename', 'modified'],
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
      \ 'component_function': {
      \   'gitbranch': 'LightlineGitBranch',
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
set path=.,**
set wildignore+=**/node_modules/**
nnoremap <leader><space> :nohlsearch<CR>

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

let g:skipview_files = []
function! MakeViewCheck()
  if has('quickfix') && &buftype =~ 'nofile'
    " Buffer is marked as not a file
    return 0
  endif
  if empty(glob(expand('%:p')))
    " File does not exist on disk
    return 0
  endif
  if len($TEMP) && expand('%:p:h') == $TEMP
    " We're in a temp dir
    return 0
  endif
  if len($TMP) && expand('%:p:h') == $TMP
    " Also in temp dir
    return 0
  endif
  if index(g:skipview_files, expand('%')) >= 0
    " File is in skip list
    return 0
  endif
  return 1
endfunction

augroup vimrcAutoView
  au BufWritePost,BufLeave,WinLeave ?* if MakeViewCheck() | mkview | endif
  au BufWinEnter ?* if MakeViewCheck() | silent loadview | endif
augroup end

if has('autocmd')
  autocmd BufReadPost fugitive://* set bufhidden=delete
endif
