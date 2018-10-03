" el que m'est (@elquimista)
set runtimepath^=~/.vim/plugins/vim-code-dark
set runtimepath^=~/.vim/plugins/vim-javascript
set runtimepath^=~/.vim/plugins/vim-jsx
set runtimepath^=~/.vim/plugins/auto-pairs
set runtimepath^=~/.vim/plugins/vim-endwise
set runtimepath^=~/.vim/plugins/vim-slim
set runtimepath^=~/.vim/plugins/vim-markdown

let mapleader=','

" Colors
colorscheme codedark
syntax on

" Spaces And Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" UI Config
set number
set showcmd
set cursorline
filetype plugin indent on
set wildmenu
set showmatch
set colorcolumn=80

" Searching
set incsearch
set hlsearch
set path+=**
set wildignore+=**/node_modules/**
nnoremap <leader><space> :nohlsearch<CR>

" Folding
set foldenable
set foldmethod=indent
set foldlevelstart=10
set foldnestmax=10

" Custom Movements
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

" Backups
set backup
set backupdir=~/.vimtemp
set writebackup
set noundofile

" Custom Functions
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
