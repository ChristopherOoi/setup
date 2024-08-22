set nocompatible              " required
filetype off                  " required



" to get backspace working properly
set backspace=indent,eol,start
" show current cmd in bottom left
set showcmd
" open vimrc from anywhere by typing \vimrc
map <leader>vimrc :tabe ~/.vimrc<cr>
" automatically source ~/.vimrc when .vimrc is written
autocmd bufwritepost .vimrc source ~/.vimrc
" disable auto comment from newline :h formatoptions
set formatoptions-=cro


"
" autocmd to download and install vim-plug and then install plugins
"
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif



"
" list plugins here
"
call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'psf/black'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()            " required
filetype plugin indent on    " required



"
" personalised keymappings
"
" open buffers
"
" vertical
nnoremap <leader>s <C-W>s
" horizontal
nnoremap <leader>v <C-W>v
"
" resize split buffers
"
" vertical
nnoremap <leader>- <C-W>-
nnoremap <leader>= <C-W>+
" horizontal
nnoremap <leader>[ <C-W><
nnoremap <leader>] <C-W>>
" 
" open terminal below
"
" set terminal window to be 20 rows high
set termwinsize=20x0
nnoremap <leader>` :bot term<CR>



"
" some encoding stuff for plugins to work consistently
"
set encoding=utf-8
"
" get hybrid line numbers by setting both
"
set nu
set relativenumber



"
" python file settings
"
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix



"
" colouring stuff
"
syntax on
let python_highlight_all=1
let g:python_highlight_space_errors=0
let g:seoul256_background=236
colorscheme seoul256



"
" fzf keybinds
"
" find files with fzf
nnoremap <leader>f :Files<CR>
" find in loaded buffers with fzf
nnoremap <leader>l :Lines<CR>
" find in current buffer with fzf
nnoremap <leader>b :BLines<CR>



"
" black settings
"
" don't use venv
let g:black_use_virtualenv=0
" format with black on write
autocmd BufWritePre *.py execute ':Black'



"
" coc settings
"
" \k to toggle inlays
nnoremap <leader>k :CocCommand document.toggleInlayHint<CR><Esc>
" enter confirms selection
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" tab to cycle forward in list, shift tab to cycle back
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
" Use `:CocDiagnostics` or \g to get all diagnostics of current buffer in location list
nmap <silent> <leader>g :CocDiagnostics<CR>
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>
" show documentation function
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
