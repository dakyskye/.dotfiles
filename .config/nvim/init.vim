execute pathogen#infect()

filetype on
filetype plugin on
filetype indent on
filetype plugin indent on

syntax on

set noswapfile
set nobackup
set nowritebackup

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
set updatetime=300
set shortmess+=c
set signcolumn=yes

set noshowmode

set nu

colorscheme dracula

set t_Co=256
set termguicolors

nnoremap d <Nop>
nnoremap c <Nop>
vnoremap <Leader>c "_c
nnoremap dd "_dd
nnoremap <Leader>dd "+dd
nnoremap x "_x
nnoremap <Leader>x "+x
vnoremap d "_d
vnoremap <Leader>d "+d
vnoremap x "_x
vnoremap <Leader>x "+x

" disable arrow keys
"inoremap <Up>        <Nop>
"inoremap <Down>      <Nop>
"inoremap <Left>      <Nop>
"inoremap <Right>     <Nop>
nnoremap <Up>        <Nop>
nnoremap <Down>      <Nop>
nnoremap <Left>      <Nop>
nnoremap <Right>     <Nop>
nnoremap <A-Up>      <Nop>
nnoremap <A-Down>    <Nop>
nnoremap <A-Left>    <Nop>
nnoremap <A-Right>   <Nop>
vnoremap <Up>        <Nop>
vnoremap <Down>      <Nop>
vnoremap <Left>      <Nop>
vnoremap <Right>     <Nop>

" switch between splitted windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" switch between next and previous opened buffers
map <A-l> :bnext      <CR>
map <A-h> :bprevious  <CR>

" clear the highlights after search
nnoremap <Leader><space> :nohlsearch<CR>

" language options
autocmd BufNewFile,BufRead *.ts set filetype=typescript
autocmd BufNewFile,BufRead *.js set filetype=javascript
autocmd BufNewFile,BufRead *.pwn set filetype=cpp
autocmd BufNewFile,BufRead *.inc set filetype=cpp
autocmd BufNewFile,BufRead tsconfig.json set filetype=jsonc

" Colorizer
nnoremap <C-c> :ColorToggle<CR>

" editorconfig-vim
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" fzf.vim
nnoremap <C-p> :Files<CR>
nnoremap <C-g> :GFiles<CR>
nnoremap <C-f> :Rg!

" vim-airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='violet'

" tagbar config
nmap <F8> :TagbarToggle<CR>

" https://github.com/jstemmer/gotags
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

" coc configuration
" coc packages
let g:coc_global_extensions = [
	\ 'coc-json',
	\ 'coc-tsserver',
	\ 'coc-yaml',
	\ 'coc-python',
	\ 'coc-snippets',
	\ 'coc-highlight',
	\ 'coc-eslint',
	\ 'coc-git',
	\ 'coc-markdownlint',
	\ 'coc-omnisharp',
	\ 'coc-clangd'
\ ]

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

