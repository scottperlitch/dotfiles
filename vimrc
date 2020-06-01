" ------------------------------------------------
" Options
" ------------------------------------------------

" 0 Defaults
unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

" 3 tags
set tags^=.git/tags

" ------------------------------------------------
" Mappings
" ------------------------------------------------

" Set leader key
let mapleader=','

" Paste and indent
nnoremap p p=`]

" Yank to system clipboard
vnoremap <leader>y "*y
nnoremap <leader>y viw"*y

" Cut to system clipboard
vnoremap <leader>d "*d

" Paste from system clipboard and indent
nnoremap <leader>p "*p=`]

" Write Buffer
inoremap ,w <esc>:write<cr>
nnoremap <leader>w :write!<cr>
vnoremap <leader>w :write!<cr>

" Quit Buffer
nnoremap <leader>q :quit<cr>
nnoremap <leader>Q :quitall<cr>

" yank until end of line
nnoremap Y y$
nnoremap <leader>Y "*y$

" Auto close brackets on carriage return
inoremap {<cr> {<cr>}<esc>O

" search buffer for visually selected text
vnoremap // y/<c-r>"<cr>

" Reload vimrc
nnoremap <leader>r :source $MYVIMRC<cr>

" edit vimrc
nnoremap <leader>e :edit $MYVIMRC<cr>

" alernate file
nnoremap <leader>d :edit #<cr>

" open project root directory
nnoremap <leader>o :!open .<cr>

" open current files parent directory
nnoremap <leader>O :!open %:h<cr>

" buffer next
nnoremap <leader>l :bnext<cr>

" buffer previous
nnoremap <leader>h :bprevious<cr>

" ------------------------------------------------
" Plugins
" ------------------------------------------------

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'tomtom/tcomment_vim'
call plug#end()

" vim-polyglot
let g:vue_pre_processors = []

" fzf.vim
nnoremap <leader>a :Files!<cr>
nnoremap <leader>s :History!<cr>
nnoremap <leader>t yiw:Tags <c-r>" <cr>
nnoremap <leader>f :Rg!<Space>
nnoremap <leader>F yiw:Rg! <c-r>"
vnoremap <leader>F y:Rg! <c-r>"
nnoremap <leader>x yiw:Rg! function <c-r>"(
