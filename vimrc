" ------------------------------------------------
" Options
" ------------------------------------------------

" 0 Defaults
unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

" ------------------------------------------------
" Mappings
" ------------------------------------------------

" Set leader key
let mapleader=','

" Repeat last `f` in opposite direction
nnoremap \ ,

" Paste and indent
nnoremap p p=`]

" Yank to system clipboard
vnoremap <leader>y "*y
nnoremap <leader>y viw"*y

" Paste from system clipboard and indent
nnoremap <leader>p "*p=`]

" Write Buffer
inoremap ,w <esc>:write<cr>
nnoremap <leader>w :write!<cr>
vnoremap <leader>w :write!<cr>

" Quit Buffer
nnoremap <leader>q :quit<cr>
nnoremap <leader>Q :quitall<cr>

" Yank until end of line
nnoremap Y y$
nnoremap <leader>Y "*y$

" Auto close brackets on carriage return
inoremap {<cr> {<cr>}<esc>O

" Search buffer for visually selected text
vnoremap // y/<c-r>"<cr>

" Reload vimrc
nnoremap <leader>r :source $MYVIMRC<cr>

" Edit vimrc
nnoremap <leader>e :edit $MYVIMRC<cr>

" Alernate file
nnoremap <leader>d :edit #<cr>

" Open project root directory
nnoremap <leader>o :!open .<cr>

" Open current files parent directory
nnoremap <leader>O :!open %:h<cr>

" Buffer next
nnoremap <leader>l :bnext<cr>

" Buffer previous
nnoremap <leader>h :bprevious<cr>

" ------------------------------------------------
" Plugins
" ------------------------------------------------

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'scottperlitch/editorconfig-vim', { 'branch' : 'keep-filename' }
Plug 'tomtom/tcomment_vim'
call plug#end()

" Vim-polyglot
let g:vue_pre_processors = []

" Fzf.vim
nnoremap <leader>a :Files!<cr>
nnoremap <leader>s :Buffers!<cr>
nnoremap <leader>S :History!<cr>
nnoremap <leader>t yiw:Tags <c-r>" <cr>
nnoremap <leader>f :Rg!<Space>
nnoremap <leader>F yiw:Rg! <c-r>"
nnoremap <leader>x yiw:Rg! function <c-r>"(
