" el que m'est (@elquimista)
set runtimepath^=~/.vim/plugins/vim-colors-solarized
set runtimepath^=~/.vim/plugins/vim-javascript
set runtimepath^=~/.vim/plugins/vim-jsx
set runtimepath^=~/.vim/plugins/auto-pairs
set runtimepath^=~/.vim/plugins/vim-endwise
set runtimepath^=~/.vim/plugins/vim-slim
set runtimepath^=~/.vim/plugins/vim-markdown

let mapleader=','
set backspace=

" Colors
set background=dark
colorscheme solarized
syntax on
augroup filetypedetect
  au BufRead,BufNewFile *.js,*.jsx set filetype=javascript.jsx
  au BufRead,BufNewFile *.slim set filetype=slim
augroup END

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

" Backups, undofiles, swap files
set backup
set backupdir=~/.vim/tmp/backup
if !isdirectory(&backupdir) | call mkdir(&backupdir, 'p', 0700) | endif
set writebackup
set noundofile
set dir=~/.vim/tmp/swap
if !isdirectory(&dir) | call mkdir(&dir, 'p', 0700) | endif

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
