" Alchemist (@artificis)
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

au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview
