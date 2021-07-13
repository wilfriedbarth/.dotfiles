" =============== "
" === PLUGINS === "
" =============== "

" Download vim-plug or packages if missing
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent! execute '!curl --create-dirs -fLo ~/.config/nvim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall --sync | source ~/.config/nvim/init.vim
endif

" Plugin list
call plug#begin('~/.config/nvim/plugged')
Plug 'trevordmiller/nova-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'olical/conjure', { 'tag': 'v4.12.0' }
Plug 'vimwiki/vimwiki'
call plug#end()

" ------------------------------ "
" --- trevordmiller/nova-vim --- "
" ------------------------------ "

" Set colorscheme to nova
colorscheme nova

" ------------------------------ "
" --- ryanoasis/vim-devicons --- "
" ------------------------------ "

" Set gui font to support devicons
set guifont=Droid\ Sans\ Mono\ Nerd\ Font\ Complete\

" ------------------------------- "
" --- vim-airline/vim-airline --- "
" ------------------------------- "

" Enable tab line for vim-airline
let g:airline#extensions#tabline#enabled = 1
    
" ------------------------ "
" --- junegunn/fzf.vim --- "
" ------------------------ "

" Modify ripgrep colors to match nova-vim colorscheme
let g:rg_command = 'rg --follow --smart-case --no-heading --line-number --color=always --colors "path:fg:white" --colors "line:fg:cyan" '
command! -bang -nargs=* Rg call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

" ------------------------- "
" --- neoclide/coc.nvim --- "
" ------------------------- "

" Configure standard coc extensions for any project 
let g:coc_global_extensions = [
      \ 'coc-css',
      \ 'coc-eslint',
      \ 'coc-highlight',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-pairs',
      \ 'coc-prettier',
      \ 'coc-snippets',
      \ 'coc-tsserver',
      \ 'coc-yaml',
      \ 'coc-conjure'
      \ ]

" Set coc diagnostic signs to match nova-vim colorscheme
highlight CocErrorSign ctermfg=Red guifg=#DF8C8C
highlight CocWarningSign ctermfg=Brown guifg=#F2C38F
highlight CocInfoSign ctermfg=Yellow guifg=#DADA93
highlight CocHintSign ctermfg=Blue guifg=#7FC1CA

" Custom mappings to coc interface
nmap <silent> cdi <Plug>(coc-diagnostic-info)
nmap <silent> cdn <Plug>(coc-diagnostic-next)
nmap <silent> cdp <Plug>(coc-diagnostic-prev)
" nmap <silent> cdne <Plug>(coc-diagnostic-next-error)
" nmap <silent> cdpe <Plug>(coc-diagnostic-prev-error)
nmap <silent> cdf <Plug>(coc-definition)
nmap <silent> cdc <Plug>(coc-declaration)
nmap <silent> ci <Plug>(coc-implementation)
nmap <silent> ct <Plug>(coc-type-definition)
nmap <silent> cre <Plug>(coc-references)
" nmap <silent> cfs <Plug>(coc-format-selected)
" vmap <silent> cfs <Plug>(coc-format-selected)
" nmap <silent> cf <Plug>(coc-format)
nmap <silent> crn <Plug>(coc-rename)
nmap <silent> ca <Plug>(coc-codeaction)
" nmap <silent> cas <Plug>(coc-codeaction-selected)
" vmap <silent> cas <Plug>(coc-codeaction-selected)
" nmap <silent> co <Plug>(coc-openlink)
" nmap <silent> cla <Plug>(coc-codelens-action)
" nmap <silent> cfc <Plug>(coc-fix-current)
" nmap <silent> cfh <Plug>(coc-float-hide)
" nmap <silent> cfj <Plug>(coc-float-jump)
nmap <silent> crf <Plug>(coc-refactor)
" nmap <silent> crs <Plug>(coc-range-select)
" vmap <silent> crs <Plug>(coc-range-select)
" nmap <silent> crsb <Plug>(coc-range-select-backward)
" vmap <silent> crsb <Plug>(coc-range-select-backward)
" nmap <silent> cfi <Plug>(coc-funcobj-i)
" vmap <silent> cfi <Plug>(coc-funcobj-i)
" nmap <silent> cfa <Plug>(coc-funcobj-a)
" vmap <silent> cfa <Plug>(coc-funcobj-a)

" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Set up autocommands
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"vimwiki
let g:vimwiki_list = [{
\'path': '~/vimwiki/', 
\'auto_diary_index': 1, 
\'auto_tags': 1, 
\'auto_generate_tags': 1,
\'syntax': 'markdown', 
\'ext': '.md'
\}]
autocmd BufEnter diary.md :VimwikiDiaryGenerateLinks

