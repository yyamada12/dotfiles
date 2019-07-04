" escの割り当て
noremap <C-j> <esc>
noremap! <C-j> <esc>

" NERDTreeのショートカット
nnoremap <silent><c-n> :NERDTreeToggle<CR>

" BackSpaceの割り当て
set backspace=indent,eol,start

"macのショートカットキー
:imap <c-b> <Left>
:imap <c-n> <Down>
:imap <c-p> <Up>
:imap <c-f> <Right>
:imap <c-d> <Delete>
:imap <c-k> <Right><Esc>d$a
:imap <c-e> <Esc>$a
:imap <c-a> <Esc>^i

" CTRL-hjklでウィンドウ移動
nnoremap <C-h> ;<C-w>h
nnoremap <C-j> ;<C-w>j
nnoremap <C-k> ;<C-w>k
nnoremap <C-l> ;<C-w>l

"=を二回連続入力でバッファ全体をインデント整理
nnoremap == gg=G

