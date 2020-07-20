"
" File: vimrc
" -----------
" The goal of this vim configuration is to stay as close to the defaults as
" possible and keep only the most used and beneficial additions.
" Default options in Vim 8+ are solid. Mappings try to use left half of
" keyboard for frequently used operations given that the map leader key (,)
" requires a right hand movement. Mappings for the home row on the left half
" of the keyboard (asdf) are further prioritized for the most frequent and/or
" important operations; in this case file browsing, file jumping and project
" wide search. Remapping Caps Lock to Escape is also ideal as it is in the
" home row and used frequently (this can be done through most operating
" systems). Tags are setup using git hooks and ctags.
"

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

" Write Buffer
inoremap ,w <esc>:write<cr>
nnoremap <leader>w :write!<cr>
vnoremap <leader>w :write!<cr>

" Quit Buffer
nnoremap <leader>q :quit<cr>
nnoremap <leader>Q :quitall<cr>

" Yank to system clipboard
vnoremap <leader>y "*y
nnoremap <leader>y viw"*y

" Put and auto indent
nnoremap p p=`]

" Put from system clipboard and indent
nnoremap <leader>p "*p=`]

" Jump to alternate file
nnoremap <leader>d :edit #<cr>

" Auto close brackets on carriage return
inoremap {<cr> {<cr>}<esc>O

" Edit vimrc
nnoremap <leader>e :edit $MYVIMRC<cr>

" Reload vimrc
nnoremap <leader>r :source $MYVIMRC<cr>

" Open project root directory in Finder
nnoremap <leader>o :!open .<cr>

" Open current file's parent directory in Finder
nnoremap <leader>O :!open %:h<cr>

" Search buffer for visually selected text
vnoremap // y/<c-r>"<cr>

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
nnoremap <leader>T :BTags!<cr>
nnoremap <leader>f :Rg!<Space>
nnoremap <leader>F yiw:Rg! <c-r>"
nnoremap <leader>x yiw:Rg! function <c-r>"(
