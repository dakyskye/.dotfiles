if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	:qa!
endif

call plug#begin('~/.config/nvim/bundle')

"""

" Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'kdheepak/lazygit.nvim'
" EditorConfig
Plug 'editorconfig/editorconfig-vim'
" NERDCommenter
Plug 'preservim/nerdcommenter'
" Which
Plug 'liuchengxu/vim-which-key'
" FZF
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" Maximizer
Plug 'szw/vim-maximizer'
" Surround
Plug 'tpope/vim-surround'
" Floaterm
Plug 'voldikss/vim-floaterm'
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSInstall all' }
" One
Plug 'kdheepak/vim-one'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Devicons
Plug 'ryanoasis/vim-devicons'
" Goyo
Plug 'junegunn/goyo.vim'
" Limelight
Plug 'junegunn/limelight.vim'
" Go
Plug 'fatih/vim-go'
" Vimspector
Plug 'puremourning/vimspector'
" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"""
call plug#end()

" config
"""

let mapleader="\<space>"

set syntax=on
set noswapfile
set nobackup
set nowritebackup
set confirm
set autoread
set lazyredraw
set iskeyword+=-
set exrc
set secure
set encoding=utf-8
set clipboard=unnamedplus
set mouse=a
set cursorline
set splitbelow splitright
set autoindent
set tabstop=4
set shiftwidth=4
set ignorecase
set smartcase
set incsearch
set hlsearch
set hidden
set cmdheight=1
set updatetime=100
set shortmess+=c
set signcolumn=number
set noshowmode
set number relativenumber
set t_Co=256
set termguicolors
set background=dark
colorscheme one

" keys

" which
nnoremap <silent><leader> :silent WhichKey '<space>'<cr>

" fzf list files
nnoremap <silent><leader>o :Files<cr>

" fzf list git files
nnoremap <silent><leader>g :GFiles<cr>

" fzf do ripgrep
nnoremap <leader>f :Rg!

" clear search results
nnoremap <silent><leader><bs> :nohlsearch<cr>

" open explorer
nnoremap <silent><leader>1 :CocCommand explorer<cr>

" open floaterm
nnoremap <silent><leader>2 :FloatermToggle<cr>

" show all diagnostics
nnoremap <silent><leader>3 :<c-u>CocList diagnostics<cr>

" show code actions
nnoremap <silent><leader>4 :CocAction<cr>

" open lazygit
nnoremap <silent><leader>5 :LazyGit<cr>

" open list of git commits
nnoremap <silent><leader>6 :LazyGitFilter<cr>

" open list of buffers
nnoremap <silent><leader><tab> :Buffers<cr>

" navigating buffers
nnoremap <silent><c-k> <c-w>k
nnoremap <silent><c-j> <c-w>j
nnoremap <silent><c-l> <c-w>l
nnoremap <silent><c-h> <c-w>h

nnoremap <silent><c-up> <c-w>k
nnoremap <silent><c-down> <c-w>j
nnoremap <silent><c-right> <c-w>l
nnoremap <silent><c-left> <c-w>h

" resizing buggers
nnoremap <silent><a-up> :vertical resize +5<cr>
nnoremap <silent><a-down> :vertical resize -5<cr>
nnoremap <silent><a-right> :resize +2<cr>
nnoremap <silent><a-left> :resize -2<cr>

" plugins

" which
let g:which_key_centered = 0
let g:which_key_use_floating_win = 0

" nerdcommenter
let g:NERDCreateDefaultMappings = 1

" signify
let g:signify_sign_show_count = 0
let g:signify_sign_add = "▎"
let g:signify_sign_delete = "▏"
let g:signify_sign_delete_first_line = "▔"
let g:signify_sign_change = "▎"
let g:signify_sign_change_delete = "▋"

nnoremap <silent><F17> :SignifyToggle<cr>

" maxmizer
let g:maximizer_set_mapping_with_bang = 1
let g:maximizer_default_mapping_key = '<f23>'

" treesitter
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

" one
let g:one_allow_italics = 1

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'one'

" toggle goyo
nnoremap <silent><f1> :Goyo<cr>

" toggle limelight
nnoremap <silent><f13> :Limelight!!<cr>

" vim-go
let g:go_gopls_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0

" vimspector
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'vscode-go' ]

" coc
let g:coc_global_extensions =
	\ [
	\ 'coc-go',
	\ 'coc-rust-analyzer',
	\ 'coc-diagnostic',
	\ 'coc-json',
	\ 'coc-toml',
	\ 'coc-highlight',
	\ 'coc-floaterm',
	\ 'coc-explorer',
	\ 'coc-snippets',
	\ 'coc-pairs'
	\ ]

" use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <tab>
	\ pumvisible() ? "\<c-n>" :
	\ <sid>check_back_space() ? "\<tab>" :
	\ coc#refresh()
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<c-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" make <cr> auto-select the first completion item and notify coc.nvim to format on enter
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
						\: "\<c-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"

" GoTo code navigation.
nmap <silent>gd <plug>(coc-definition)
nmap <silent>gy <plug>(coc-type-definition)
nmap <silent>gi <plug>(coc-implementation)
nmap <silent>gr <plug>(coc-references)

" use shift-f2 and f2 to navigate diagnostics
nmap <silent><f14> <plug>(coc-diagnostic-prev)
nmap <silent><f2> <plug>(coc-diagnostic-next)

" use K to show documentation in preview window
nmap <silent>K :call <sid>show_documentation()<cr>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

" symbol renaming
nmap <leader>rn <plug>(coc-rename)

"""
