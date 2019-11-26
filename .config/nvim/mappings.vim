"KEY REMAPPINGS
"move vertically by visual line
nnoremap j gj
nnoremap k gk
"- moves line down, _ moves line up
nnoremap - :m .+1<CR>==
nnoremap _ :m .-2<CR>==
vnoremap - :m '>+1<CR>gv=gv
vnoremap _ :m '<-2<CR>gv=gv
"= inserts blank line below, + inserts blank line above
noremap = o<esc>
"removes movement with arrow keys
noremap + O<esc>
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Right> <nop>
inoremap <Left> <nop>
"indentation mappings
nnoremap <Left> <<
nnoremap <Right> >>
nnoremap <Up> [ e
nnoremap <Down> ] e
vnoremap <Left> <gv
vnoremap <Right> >gv
vnoremap <Up> [egv
vnoremap <Down> ]egv
