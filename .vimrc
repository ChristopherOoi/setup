"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Base
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
set nocompatible
set foldmethod=indent
set nofoldenable
set backspace=indent,eol,start
set showcmd
set formatoptions-=cro
set encoding=utf-8
	""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" Visual
	""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	syntax on
	set nu
	set relativenumber
	set laststatus=2
	set statusline=%f\ %y\ %m\ %r\ %=\ %l\ of\ %L\ lines\ (%p%%)\ Col\ %c
	let python_highlight_all=1
	let g:python_highlight_space_errors=0
	let &colorcolumn=join(range(81,999),',')
	let g:netrw_banner = 0

	""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" Tmux window title
	""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	autocmd BufEnter * call system("tmux rename-window " . expand("%:t"))
	autocmd VimLeave * call system("tmux setw automatic-rename")
	autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
	set title



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BINDINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" Open terminal
	""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	set termwinsize=20x0
	nnoremap <leader>` :bot term<CR>

	""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" Clipboard
	""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	nnoremap <leader>c "+y
	nnoremap <leader>p "+p


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" Python
	""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	au BufNewFile,BufRead *.py
	    \ set tabstop=4 |
	    \ set softtabstop=4 |
	    \ set shiftwidth=4 |
	    \ set expandtab |
	    \ set autoindent |
	    \ set fileformat=unix








""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'psf/black'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'github/copilot.vim'

call plug#end()            " required
filetype plugin indent on    " required

	""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" seoul256
	""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	colorscheme seoul256
	let g:seoul256_background=236

	""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" fzf - fuzzy finder
	""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" find files with fzf
	nnoremap <leader>f :Files<CR>
	" find in loaded buffers with fzf
	nnoremap <leader>l :Lines<CR>
	" find in current buffer with fzf
	nnoremap <leader>b :BLines<CR>

	""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" Black - python formatter
	""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	let g:black_use_virtualenv=0
	autocmd BufWritePre *.py execute ':Black'

	""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" CoC - LSP
	""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
