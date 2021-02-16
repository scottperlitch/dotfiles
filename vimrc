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
" systems).
"

" ------------------------------------------------
" Options
" ------------------------------------------------

" 0 Defaults
unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

" 8 terminal
set title

" 13 Editing text
set undofile
set undodir=~/.vim/undo

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
vnoremap <leader>c "*y
nnoremap <leader>c viw"*y

" Put and auto indent
nnoremap p p=`]

" Put from system clipboard and indent
nnoremap <leader>p "*p=`]
vnoremap <leader>p <esc>"*p=`]
inoremap <leader>p <esc>"*p=`]
nnoremap <leader>v "*p=`]
vnoremap <leader>v <esc>"*p=`]
inoremap <leader>v <esc>"*p=`]

" Jump to alternate file
nnoremap <leader>d :edit #<cr>

" Auto close brackets on carriage return
inoremap {<cr> {<cr>}<esc>O

" Auto close brackets on carriage return
" inoremap [<cr> [<cr>];<esc>O

" Quick arrow insert
inoremap <leader>. <space>=><space>

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

" Yank to end of line
nnoremap Y y$

" Toggle line number
nnoremap <leader>1 :set number!<cr>

" Remap 0 to first char of line
nnoremap 0 ^

" Re-indent file
nnoremap <leader>i  mzgg=G`z

" Center next element in a search
nnoremap n nzz
nnoremap N Nzz

" Center last and next jump
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

" ------------------------------------------------
" FileType Keywords
" ------------------------------------------------
autocmd FileType blade setlocal iskeyword+=-
autocmd FileType javascript setlocal iskeyword+=-
autocmd FileType vue setlocal iskeyword+=-

" ------------------------------------------------
" Commands
" ------------------------------------------------
com! XmlFormatter :%s/>\s*</>\r</g
com! CopyFilename :let @+=expand('%')

" ------------------------------------------------
" Plugins
" ------------------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'scottperlitch/editorconfig-vim', { 'branch' : 'keep-filename' }
Plug 'tomtom/tcomment_vim'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-abolish'
Plug 'godlygeek/tabular'
call plug#end()

" Polyglot
let g:vue_pre_processors = []

" PHP Namespace
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <leader>u <esc>:call IPhpInsertUse()<cr>
autocmd FileType php nnoremap <leader>u :call PhpInsertUse()<cr>

" Fzf
command! -bang -nargs=* Find call fzf#vim#grep("rg --fixed-strings --ignore-case --color=always -- ".shellescape(<q-args>),1,fzf#vim#with_preview(),<bang>0)
command! -bang -nargs=* FindRegex call fzf#vim#grep("rg --case-sensitive --color=always -- ".shellescape(<q-args>),1,fzf#vim#with_preview(),<bang>0)
command! -bang -nargs=* FindFile call fzf#vim#files('.',fzf#vim#with_preview({'options': ['--query', substitute(expand('<cword>'),'-','','g').'.']}),<bang>0)
command! -bang -nargs=* FindSource call fzf#vim#grep("rg --case-sensitive --color=always -- '(function|class|interface|trait) ".expand('<cword>')."(\\s|\\(|$)'",1,fzf#vim#with_preview(),<bang>0)

function! Tag()
    let l:attr = synIDattr(synID(line("."), col("."), 1), "name")
    let l:vueComponents = ['htmlTagName', 'jsModuleKeyword', 'jsObjectShorthandProp']
    let l:isVueComponent = index(l:vueComponents, l:attr) != -1
    if (l:isVueComponent)
        :FindFile!
    else
        :FindSource!
    endif
endfunction

nnoremap <leader>t :call Tag()<cr>
nnoremap <leader>a :Files!<cr>
nnoremap <leader>g :FindFile!<cr>
nnoremap <leader>s :Buffers!<cr>
nnoremap <leader>S :History!<cr>
nnoremap <leader>f :Find!<space>
vnoremap <leader>F y:Find! <c-r>"
nnoremap <leader>F :FindRegex! <c-r><c-w>
nnoremap <leader>x :Find! function<space>
" nnoremap <leader>t :FindRegex! (function\|class\|interface\|trait) <c-r><c-w>(\s\|\(\|$)<cr>
