if ! filereadable(expand('~/.vim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" Git plugin
Plug 'tpope/vim-fugitive'
nmap <F1> :vert G<CR>

" better directory browser
Plug 'tpope/vim-vinegar'

" Tagbar is a Vim plugin that provides an easy way to browse the tags of the
"current file and get an overview of its structure.
Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

"Lightweight Vim plugin to enhance the tabline including numbered tab page
"labels
Plug 'webdevel/tabulous'

"Vim motion on speed!
Plug 'easymotion/vim-easymotion'
" Easy motion mapping
nmap <Space> <Plug>(easymotion-bd-w)

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" - down / up / left / right
let g:fzf_layout = { 'up': '35%' }
nmap <F2> :GFiles<cr>
nmap <F3> :Buffers<cr>

" Plug highlighting word under cursor and all of its occurrences."
Plug 'dominikduda/vim_current_word'

" A collection of syntax definitions not yet shipped with stock vim.
" Improved C syntax groups for operators, delimiters, user-defined functions,
" function calls, and a wealth of standard ANSI C function names.
Plug 'justinmk/vim-syntax-extra'

" help you read complex code by showing diff level of parentheses in diff color !!
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" Make the yanked region apparent!
Plug 'machakann/vim-highlightedyank'

" Plugin to swap delimited items.
Plug 'machakann/vim-swap'

" === Rust ===
" Vim syntax for TOML.
Plug 'cespare/vim-toml'

" Rust file detection, syntax highlighting, formatting
Plug 'rust-lang/rust.vim'
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

" === C/C++ ===

Plug 'chazy/cscope_maps'

"Open definition of word under cursor in new tab
nmap <C-\>w :tab cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>w :tab cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>

" Add header guards to C/C++ header files
Plug 'drmikehenry/vim-headerguard'
" Change guard Name
function! g:HeaderguardName()
	return "_" .toupper(expand('%:t:gs/[^0-9a-zA-Z_]/_/g')) . "_"
endfunction
" Auto insert guards at header creation
autocmd BufNewFile *.{h,hpp} call g:HeaderguardAdd()

" === END ===
" Initialize plugin system
call plug#end()

" Pure Vim settings
set encoding=utf8

" show line numbers
set relativenumber " show line numbers
set number " to show current line number instead of 0
"set wrap " turn on line wrapping
"set wrapmargin=8 " wrap lines when coming within n characters from side"

set mouse=a

colorscheme naysayer88

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
autocmd FileType meson setlocal ts=4 sw=4 softtabstop=4 expandtab
autocmd FileType c,cpp,h setlocal ts=8 sw=8 softtabstop=8

set cc=80
au FileType gitcommit set cc=75
set noswapfile

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

filetype plugin indent on

" shortcut to indent json files
nmap <leader>j :%!python -m json.tool<CR>

" toggle invisible characters
set list
set listchars=tab:\¦\ ,trail:⋅,extends:❯,precedes:❮
hi SpecialKey ctermfg=239
set showbreak=↪

set spell spelllang=en_us
map  :w!<CR>:!aspell check %<CR>:e! %<CR>
hi clear SpellBad
hi clear SpellCap
hi clear SpellRare
hi clear SpellLocal
hi SpellBad cterm=underline

set cursorline
hi CursorLine cterm=NONE ctermbg=23
hi ColorColumn ctermbg=23

set linespace=5

hi CurrentWordTwins ctermbg=23
hi CurrentWord ctermbg=23

hi TabLine      ctermfg=Black  ctermbg=Grey     cterm=NONE guifg=#000000 guibg=#dadada
hi TabLineFill  ctermfg=Black  ctermbg=Grey     cterm=NONE guifg=#000000 guibg=#dadada
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE guifg=#ffffff guibg=#337dff

hi diffRemoved ctermfg=red
hi diffAdded   ctermfg=green

" Force saving files that require root permission
cnoremap w!! w !sudo tee > /dev/null %

if executable('rg')
	" Use rg over grep
	set grepprg=rg\ --no-heading\ --smart-case\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

command! -nargs=+ Rg execute 'silent grep! <args>'| redraw! | cwindow 10
" Position the (global) quickfix window at the very bottom of the window
" (useful for making sure that it appears underneath splits)
"
" NOTE: Using a check here to make sure that window-specific location-lists
" aren't effected, as they use the same `FileType` as quickfix-lists.
autocmd FileType qf if (getwininfo(win_getid())[0].loclist != 1) | wincmd J | endif

command TODO execute 'e ~/tmp/TODO.txt'

" load the quickfix item into the previously used window
set switchbuf+=uselast

" Prev/next
nmap [q :cp<CR>
nmap ]q :cn<CR>

" <leader>s for Rg search, space needed
noremap <leader>f :Rg 

" sort as reverse tree
noremap <leader>x :! awk '{ print length(), $0 \| "sort -nr \| cut -d\\  -f2-" }'<CR>

" build and copen in case of errors
nmap <F5> :silent w <BAR> silent make <BAR> unsilent redraw! <BAR> cwindow<CR>

" look for ctags under the git folder
set tags^=.git/tags;~

" enable per project config
set exrc

" Show the current match position
set shortmess-=S

" enable clipboard to work inside wsl
if system('uname -r') =~ "Microsoft"
    augroup Yank
        autocmd!
        autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
        augroup END
endif

" Generate fixes msg in following format:
" Fixes: <commit-hash> ("<commit-message>")
function GenFixes(commithash)
	" let commit_str = string(a:commithash)
	let hash = trim(system("git rev-parse --short=12 " . a:commithash))
	let msg = trim(system("git show -s --format=%s " . a:commithash))
	let res =  "Fixes: " . hash . " (\"" . msg . "\")"
	put =res
endfunction

command! -nargs=+ Fx execute 'call GenFixes(<f-args>)'

" Configs for Windows(Gvim)
if has("gui_running")
    set guifont=Roboto\ Mono:h14
    set guioptions-=m  "hide menu bar
    set guioptions-=T  "hide toolbar
    set langmenu=en_US.UTF-8    " sets the language of the menu (gvim)
    language en                 " sets the language of the messages / ui (vim)
endif
