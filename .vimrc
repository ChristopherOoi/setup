set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'sheerun/vim-polyglot'
Plugin 'junegunn/seoul256.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set encoding=utf-8
set nu


" Enable code folding
set foldmethod=indent
set foldlevel=99
" set foldcolumn=2
nnoremap <space> za

" Python stuff
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=99 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" add mapping for auto closing
function! Close(open, close)
    return a:open .  a:close . "\<Left>"
endfunction

function! CloseNL(open, close)
    return a:open . "\<CR>\<CR>" . a:close . "\<Up>"
endfunction

" close brackets and quotes and stuff
inoremap <expr> '<tab> Close("'", "'")
inoremap <expr> "<tab> Close('"', '"')
inoremap <expr> (<tab> Close("(", ")")
inoremap <expr> [<tab> Close("[", "]")
inoremap <expr> {<tab> Close("{", "}")

" close brackets with nl
" so (<CR>
" becomes
" (
"
" )
inoremap <expr> (<CR> CloseNL("(", ")")
inoremap <expr> [<CR> CloseNL("[", "]")
inoremap <expr> {<CR> CloseNL("{", "}")
inoremap <expr> """<CR> CloseNL('"""','"""')


syntax on
let python_highlight_all=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_autoclose_preview_window_after_completion=1
let g:python_highlight_space_errors=0

let g:seoul256_background=236
colorscheme seoul256

" Other file formats
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" For YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_enable_semantic_highlighting=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
