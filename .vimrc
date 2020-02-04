set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Insert or delete brackets, parens, quotes in pair.
Plugin 'jiangmiao/auto-pairs'

" vim-airline/vim-airline
Plugin 'vim-airline/vim-airline'

" The NERDTree is a file system explorer for the Vim editor
Plugin 'scrooloose/nerdtree'

" Git plugin
Plugin 'tpope/vim-fugitive'

" Simply use the provided mapping <C-W>m to toggle zoom in and out for the current window
Plugin 'dhruvasagar/vim-zoom'

" A VIM plugin to open urls in the default browser
Plugin 'dhruvasagar/vim-open-url'

" Tagbar is a Vim plugin that provides an easy way to browse the tags of the
"current file and get an overview of its structure.
Plugin 'majutsushi/tagbar'

" Fast and Easy Find and Replace Across Multiple Files
Plugin 'dkprice/vim-easygrep'

" Adds filetype glyphs (icons) to various vim plugins.
Plugin 'ryanoasis/vim-devicons'

"Surround.vim is all about surroundings: parentheses,  brackets,  quotes,
"XML tags,  and more.
Plugin 'tpope/vim-surround'
autocmd FileType markdown,octopress let b:surround_{char2nr('i')} = "*\r*"
autocmd FileType markdown,octopress let b:surround_{char2nr('b')} = "**\r**"

"Lightweight Vim plugin to enhance the tabline including numbered tab page
"labels; it's written entirely in Vim script.
Plugin 'webdevel/tabulous'

"Vim motion on speed!
Plugin 'easymotion/vim-easymotion'

"This plugin makes use of external formatting programs to achieve the most
"decent results.
Plugin 'Chiel92/vim-autoformat'

" To use zeavim, you need of course to have Zeal installed. 
Plugin 'KabbAmine/zeavim.vim'

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plugin 'ctrlpvim/ctrlp.vim'

" Plugin highlighting word under cursor and all of its occurrences."
Plugin 'dominikduda/vim_current_word'

" A collection of syntax definitions not yet shipped with stock vim.
Plugin 'justinmk/vim-syntax-extra'

Plugin 'chazy/cscope_maps'

" help you read complex code by showing diff level of parentheses in diff color !!
Plugin 'luochen1990/rainbow'

Plugin 'Yggdroot/indentLine'
"autocmd BufNewFile,BufRead *.py
" if &filetype !=# 'py'
" 	let g:indentLine_enabled = 0
" endif
"let g:indentLine_setColors = 0
let g:indentLine_color_term = 239

Plugin 'neoclide/coc.nvim', {'branch': 'release'}


Plugin 'iamcco/markdown-preview.nvim'
nmap <leader>m <Plug>MarkdownPreviewToggle

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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

autocmd FileType c,cpp,h set ts=8 sw=8 softtabstop=8
set ts=4 sw=4
set smarttab
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

set laststatus=2
set autoindent

" auto add space after comma in insert mode
inoremap , ,<space>

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

" shortcut to quote world

nmap <leader>[ ciw'Ctrl+r"'

" shortcut for calling copyq
nmap <F3> :w !copyq menu<CR> i

" shortcut to quick compile
nmap <F9> :w !python<CR>

" shortcut to insert debug break point
map <leader>p oimport pdb; pdb.set_trace()<ESC>

" Enable syntax highlighting
syntax on

hi CurrentWordTwins ctermbg=236
hi CurrentWord ctermbg=236

nmap <F5> :w !gcc % -o %< && ./%<<CR>

" shortcut to indent json files
nmap <leader>j :%!python -m json.tool<CR>

" shortcut for Tagbar
nmap <F8> :TagbarToggle<CR>

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

let g:ctrlp_map = '<F2>'
let g:ctrlp_match_window_bottom = 0
set runtimepath^=~/.vim/bundle/ctrlp.vim
"set wildignore+=*/build/*
set wildignore+=*.so
set wildignore+=*.swp
set wildignore+=*.pyc
set wildignore+=*.o

hi TabLine      ctermfg=Black  ctermbg=Grey     cterm=NONE guifg=#000000 guibg=#dadada
hi TabLineFill  ctermfg=Black  ctermbg=Grey     cterm=NONE guifg=#000000 guibg=#dadada
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE guifg=#ffffff guibg=#337dff

"NERDTree
"map <C-n> :NERDTreeToggle<CR>
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
"one tree for all tabs need add closing
" autocmd BufWinEnter * NERDTreeMirror

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
"
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
"
"" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''

" Zeal Mapping
nmap <leader>z <Plug>Zeavim
vmap <leader>z <Plug>ZVVisSelection
nmap gz <Plug>ZVOperator
nmap <leader><leader>z <Plug>ZVKeyDocset

" Easy motion mapping
nmap <Space> <Plug>(easymotion-bd-w)

" au BufWrite * :Autoformat
noremap <F3> :Autoformat<CR>
let g:formatdef_autopep8 = '"autopep8 - --max-line-length 150"'
let g:formatters_python = ['autopep8']

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

"auto headers
if has("autocmd")
	augroup templates_
		autocmd BufNewFile *.py 0r ~/git/dotfiles/headers/py_header.txt
		autocmd BufNewFile *.c 0r ~/git/dotfiles/headers/c_header.txt
		autocmd BufNewFile *.h 0r ~/git/dotfiles/headers/c_header.txt
	augroup END
endif
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:airline_section_a = airline#section#create(['mode'])

" Force saving files that require root permission 
cnoremap w!! w !sudo tee > /dev/null %


" ---- COC
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
"set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
"set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
