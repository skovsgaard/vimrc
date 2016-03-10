""" Defaults
set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start	" Allow backspacing over everything in insert mode
set ai			" Always set autoindenting on
"set backup		" Keep a backup file
set viminfo='20,\"50	" Read/write a .viminfo file, don't store more
			" Than 50 lines of registers
set history=50		" Keep 50 lines of command line history
set ruler		" Show the cursor position all the time
set smartcase
set showcmd
set showmatch
set mouse=a
set incsearch
set softtabstop=2
set shiftwidth=2
set number
""set colorcolumn=80
set smartindent

set pastetoggle=<F2>

" Split controls easing
set splitbelow		" Make vertical splits go to bottom
set splitright		" And vertical splits go right


""" Remaps to ease tab navigation in split views
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Brace, bracket, and parens autoclose as per
" vim.wikia.com/wiki/Automatically_append_closing_characters
inoremap (	()<Left>
inoremap (<CR>	(<CR><BS>)<Esc>O
inoremap ()	()
inoremap <expr>	) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

inoremap {	{}<Left>
inoremap {<CR>	{<CR><BS>}<Esc>O
inoremap {}	{}
inoremap <expr>	} strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"

inoremap [	[]<Left>
inoremap [<CR>	[<CR><BS>]<Esc>O
inoremap []	[]
inoremap <expr>	] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"


" Uncomment for following lines for quote completion
" inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
" inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == '"' ? "\<Right>" : '""<Left>'


" Wrap lines when navigating with arrow-keys
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk

" Fix dumb resizing
nmap <C-Left> <C-W>><C-W>>
nmap <C-Right> <C-W><<C-W><
nmap <C-Up> <C-W>-<C-W>-
nmap <C-Down> <C-W>+<C-W>+

""" Colors
set t_Co=256
colorscheme zenburn 


""" Plugins
set nocompatible
filetype off

set rtp+=$HOME/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'gmarik/sudo-gui.vim'
Bundle 'scrooloose/nerdtree'

Bundle 'moll/vim-node'
Bundle 'myhere/vim-nodejs-complete'
Bundle 'pangloss/vim-javascript'
Bundle 'walm/jshint.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'digitaltoad/vim-jade'
Bundle 'wavded/vim-stylus'
Bundle 'gkz/vim-ls'

Bundle 'othree/html5.vim'
Bundle 'plasticboy/vim-markdown'

Bundle 'vim-scripts/VimClojure'

Bundle 'JuliaLang/julia-vim'

Bundle 'oscarh/vimerl'
Bundle 'lfex/vim-lfe'

Bundle 'elixir-lang/vim-elixir'
Bundle 'carlosgaldino/elixir-snippets'
Bundle 'mattreduce/vim-mix'

Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'

Bundle 'junegunn/goyo.vim'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/syntastic'

Bundle 'hylang/vim-hy'

" Remove this please
Bundle 'idris-hackers/idris-vim'

" Whitespace because fuck logic
Bundle 'vim-scripts/whitespace-syntax-highlight'

filetype plugin indent on

""" Ocaml Merlin stuff
if executable('ocamlmerlin') && has('python')
  let s:ocamlmerlin = substitute(system('opam config var share'), '\n$', '', '''') . "/merlin"
  execute "set rtp+=".s:ocamlmerlin."/vim"
  execute "set rtp+=".s:ocamlmerlin."/vimbufsync"
endif

""" use OCP-indent for Ocaml
set rtp^="$HOME/.opam/4.02.0/share/ocp-indent/vim"

""" Uncomment to fold all Elixir blocks.
"autocmd FileType elixir setlocal foldmethod=syntax 

""" Set foldall for C source
autocmd FileType c setlocal foldmethod=syntax foldlevel=0

""" Only for Build A Lisp examples
au BufRead,BufNewFile *.lspy set ft=clojure

""" Activate snippets for .eex files
au BufRead,BufNewFile *.eex set ft=eex.html

""" Ease omnicomp
set omnifunc=syntaxcomplete#Complete
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

""" Fiddle with Goyo
function! s:goyo_enter()
  set scrolloff=999
  Limelight
endfunction

nnoremap ½ :Goyo<CR>

" Show me some files
" autocmd VimEnter * NERDTree

" Syntastic shenanigans
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set laststatus=2

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:airline_powerline_fonts=1
let g:syntastic_enable_elixir_checker = 1

syntax on
