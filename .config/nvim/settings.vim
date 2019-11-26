" ================ "
" === SETTINGS === "
" ================ "

let mapleader = ","
set clipboard+=unnamedplus
set cmdheight=2
set cursorline
  highlight ColorColumn guibg=#899BA6
  call matchadd('ColorColumn', '\%100v', 100)
set hidden
set inccommand=nosplit
set mouse=a
set number
set nobackup
set nowritebackup
set nohlsearch
set noshowmode
set nowrap
  autocmd FileType markdown setlocal wrap
set shortmess+=c
set signcolumn=yes
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set termguicolors
set updatetime=300
