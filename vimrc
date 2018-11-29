"
"      //                      o        _/_
"  _  //    _,  . . _    ______' _  _   /
" </_</_   (_)_(_/_</_  / / / <_</_/_)_<__
"           />
"          |/
"
set runtimepath^=~/.vim/plugins/papercolor-theme
set runtimepath^=~/.vim/plugins/gruvbox
set runtimepath^=~/.vim/plugins/nord-vim
set runtimepath^=~/.vim/plugins/vim-one
set runtimepath^=~/.vim/plugins/ayu-vim
set runtimepath^=~/.vim/plugins/material.vim
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
set runtimepath^=~/.vim/plugins/vim-airline
set runtimepath^=~/.vim/plugins/vim-airline-themes
set runtimepath^=~/.vim/plugins/vim-fugitive
set runtimepath^=~/.vim/plugins/vim-graphql
set runtimepath^=~/.vim/plugins/tabline.vim

let mapleader=','
set backspace=

" ┌─┐┌─┐┬  ┌─┐┬─┐┌─┐
" │  │ ││  │ │├┬┘└─┐
" └─┘└─┘┴─┘└─┘┴└─└─┘
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
func! SetColorSchemeTo(colorscheme)
  if a:colorscheme == 'papercolor-dark'
    set background=dark
    colorscheme PaperColor
  elseif a:colorscheme == 'papercolor-light'
    set background=light
    colorscheme PaperColor
  elseif a:colorscheme == 'gruvbox-dark'
    set background=dark
    colorscheme gruvbox
  elseif a:colorscheme == 'gruvbox-light'
    set background=light
    colorscheme gruvbox
  elseif a:colorscheme == 'nord'
    colorscheme nord
  elseif a:colorscheme == 'one-dark'
    set background=dark
    colorscheme one
  elseif a:colorscheme == 'ayu-dark'
    let g:ayucolor='dark'
    colorscheme ayu
  elseif a:colorscheme == 'ayu-mirage'
    let g:ayucolor='mirage'
    colorscheme ayu
  elseif a:colorscheme == 'material-palenight'
    set background=dark
    let g:material_theme_style='palenight'
    colorscheme material
  endif
endfunc
call SetColorSchemeTo('papercolor-light')

" ┌─┐┬ ┬┌┐┌┌┬┐┌─┐─┐ ┬
" └─┐└┬┘│││ │ ├─┤┌┴┬┘
" └─┘ ┴ ┘└┘ ┴ ┴ ┴┴ └─
syntax on
let g:javascript_plugin_flow=1
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
if !exists('g:airline_symbols')
  let g:airline_symbols={}
endif
let g:airline_symbols.branch=''
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
set path+=**
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
