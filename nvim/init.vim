:set number
:set relativenumber
:set scrolloff=7
:set nowrap

:set tabstop=2
:set shiftwidth=2
:set smarttab
:set softtabstop=2
:set mouse=a
:set encoding=UTF-8

:let mapleader = ","

inoremap jk <esc>

call plug#begin()

Plug 'mhartington/oceanic-next'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/neoclide/coc.nvim'
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'https://github.com/mxw/vim-jsx'
Plug 'https://github.com/maxmellon/vim-jsx-pretty'
Plug 'ayu-theme/ayu-vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'sbdchd/neoformat'

"Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

let g:neoformat_try_node_exe = 1
autocmd BufWritePre *.js Neoformat

set termguicolors
let ayucolor="dark"
colorscheme ayu

nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap <silent> <leader>t :tabnew<CR>
nnoremap <silent> <leader>tn :tabnext<CR>
nnoremap <silent> <leader>tp :tabprev<CR>
let g:coc_global_extensions=[
	\'coc-css',
	\'coc-json',
	\'coc-tsserver',
	\'coc-pyright',
	\'coc-snippets',
	\'coc-pairs',
	\'coc-tailwindcss',
	\'coc-vetur',
	\]

source ~\AppData\Local\nvim\coc-mappings.vim
source ~\AppData\Local\nvim\telescope-mappings.vim

map sh :call WinMove('h')<CR>
map sj :call WinMove('j')<CR>
map sk :call WinMove('k')<CR>
map sl :call WinMove('l')<CR>

function! WinMove(key) 
	let t:curwin = winnr()
	exec "wincmd ".a:key
	if (t:curwin == winnr())
		if (match(a:key, '[jk]'))
			wincmd v
		else
			wincmd s
		endif
		exec "wincmd ".a:key
	endif
endfunction
