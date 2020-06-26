if ! filereadable(expand('~/.vim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = 'Ξ'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''

function! AirlineInit()
	let g:airline_section_a = airline#section#create(['mode'])
    endfunction
autocmd User AirlineAfterInit call AirlineInit()

" The NERDTree is a file system explorer for the Vim editor
Plug 'scrooloose/nerdtree'

" Toggle NERDTree
function! ToggleNerdTree()
	if @% != "" && @% !~ "Startify" && (!exists("g:NERDTree") || (g:NERDTree.ExistsForTab() && !g:NERDTree.IsOpen()))
		:NERDTreeFind
	else
		:NERDTreeToggle
	endif
endfunction
" toggle nerd tree
nmap <silent> <leader>k :call ToggleNerdTree()<cr>
" find the current file in nerdtree without needing to reload the drawer
nmap <silent> <leader>y :NERDTreeFind<cr>
let NERDTreeIgnore = ['\.pyc$']

" Git plugin
Plug 'tpope/vim-fugitive'

" Simply use the provided mapping <C-W>m to toggle zoom in and out for the current window
Plug 'dhruvasagar/vim-zoom'

" Tagbar is a Vim plugin that provides an easy way to browse the tags of the
"current file and get an overview of its structure.
Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" Adds filetype glyphs (icons) to various vim plugins.
Plug 'ryanoasis/vim-devicons'

"Lightweight Vim plugin to enhance the tabline including numbered tab page
"labels; it's written entirely in Vim script.
Plug 'webdevel/tabulous'

"Vim motion on speed!
Plug 'easymotion/vim-easymotion'
" Easy motion mapping
nmap <Space> <Plug>(easymotion-bd-w)

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<F2>'
let g:ctrlp_match_window_bottom = 0
set runtimepath^=~/.vim/bundle/ctrlp.vim
"set wildignore+=*/build/*
set wildignore+=*.so
set wildignore+=*.swp
set wildignore+=*.pyc
set wildignore+=*.o

" Plug highlighting word under cursor and all of its occurrences."
Plug 'dominikduda/vim_current_word'
hi CurrentWordTwins ctermbg=236
hi CurrentWord ctermbg=236

" A collection of syntax definitions not yet shipped with stock vim.
Plug 'justinmk/vim-syntax-extra'

Plug 'chazy/cscope_maps'

" help you read complex code by showing diff level of parentheses in diff color !!
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
nmap <leader>m <Plug>MarkdownPreviewToggle

" Initialize plugin system
call plug#end()


" Pure Vim settings
set encoding=utf8

" set clipboard CLIPBOARD (^C, ^V in system)
set clipboard=unnamedplus
" show line numbers
"
set relativenumber " show line numbers
set number " to show current line number instead of 0
"set wrap " turn on line wrapping
"set wrapmargin=8 " wrap lines when coming within n characters from side"

set mouse=a

colorscheme peachpuff

set ts=4 sw=4
set smarttab
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

set laststatus=2
set autoindent
set smartindent
set breakindent

" vim tabs navigation
noremap tn :tabn<CR>
noremap tb :tabprev<CR>
noremap <C-n>     :tabnew<CR>
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt
nmap <leader>0 10gt

" Searching
set ignorecase " case insensitive searching"
set smartcase " case-sensitive if expresson contains a capital letVter
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros
set nohlsearch " don't highlight search results

" shortcut to save
nmap <leader>] :w<cr>

" shortcut to insert debug break point
map <leader>p oimport pdb; pdb.set_trace()<ESC>

" Enable syntax highlighting
syntax on

set cursorline
hi CursorLine cterm=NONE ctermbg=236

" shortcut to indent json files
nmap <leader>j :%!python -m json.tool<CR>

" toggle invisible characters
set list
set listchars=tab:\¦\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
hi SpecialKey ctermfg=239
set showbreak=↪

setlocal spell spelllang=en_us
hi clear SpellBad
hi SpellBad cterm=underline

set linespace=5

set directory^=$HOME/.vim/swap//

hi TabLine      ctermfg=Black  ctermbg=Grey     cterm=NONE guifg=#000000 guibg=#dadada
hi TabLineFill  ctermfg=Black  ctermbg=Grey     cterm=NONE guifg=#000000 guibg=#dadada
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE guifg=#ffffff guibg=#337dff

" Force saving files that require root permission
cnoremap w!! w !sudo tee > /dev/null %

if executable('rg')
	" Use rg over grep
	set grepprg=rg\ --vimgrep
endif
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
