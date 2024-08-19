set nocompatible              " required
filetype off                  " required
set backspace=indent,eol,start
set showcmd

map <leader>vimrc :tabe ~/.vimrc<cr>
autocmd bufwritepost .vimrc source ~/.vimrc

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'neoclide/coc.nvim'
Plugin 'junegunn/seoul256.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'

call vundle#end()            " required
filetype plugin indent on    " required

set encoding=utf-8
set nu
set relativenumber

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

syntax on
let python_highlight_all=1
let g:python_highlight_space_errors=0

let g:seoul256_background=236
colorscheme seoul256

" find files with fzf
nnoremap <leader>f :Files<CR>

" find in loaded buffers with fzf
nnoremap <leader>l :Lines<CR>

" find in current buffer with fzf
nnoremap <leader>b :BLines<CR>

" coc settings

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> <leader>g <Plug>(coc-list-diagnostics)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
