" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = ","

" Security
set modelines=0

" Show line numbers
" -------------------------------------------------------
set number   "set nu

" relative line number toggler using CTRL + l
function! NumberToggle()
  if(&rnu == 1)
    set nornu
  else
    set rnu
  endif
endfunc

nnoremap <C-l> :call NumberToggle()<cr>

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set textwidth=79
set formatoptions=tcqrn1
" Set the below 3 values to 2 if you feel it more comfortable(standard is 4)
set tabstop=4
set shiftwidth=4
set softtabstop=4
" use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Last line , below is commented else was hidding suggestion
"set showmode
set showcmd

" Searching
" ------------------------------------------------------------------
nnoremap / /\v
vnoremap / /\v

" highlights search results
set hlsearch

" make search act like search in modern browser
set incsearch

" Ignore case while searching
set ignorecase

" when searching try to be smart about cases
set smartcase

" --------------------------------------------------------------------

" show matching brackets when cursor is over them
set showmatch

map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
"inoremap <F1> <ESC>:set invfullscreen<CR>a
"nnoremap <F1> :set invfullscreen<CR>
"vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1


" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:

try
" colorscheme solarized
" colorscheme gruvbox
" colorscheme cobalt
" colorscheme spectro
colorscheme badwolf
catch
endtry



" set guifont=Consolas:h13
set guifont=mononoki_NFM:h13

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" read https://stackoverflow.com/questions/8247243/highlighting-the-current-line-number-in-vim
" highlight the line number(but slows down gvim😱)
" set cursorline 

"All autocomplete has been commented out to increase typing speed

inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<Esc>i
"inoremap < <><Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
"set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}
"



" all the templates are listed below
" ----------------------------------------------------------------------
nnoremap cpp :-1read H:\Mytemplates\cp_template.cpp<CR>
nnoremap cps :-1read H:\Mytemplates\cp_template_simple.cpp<CR>

nnoremap py :-1read H:\Mytemplates\py_template.py<CR>
"-----------------------------------------------------------------------


"Always show tab even if only 1 tab is present
set showtabline=2

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2


"set wild menu for the suggestion to appear
set wildmenu

"for regular expressions turn magic on
" set magic

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

nnoremap <silent> j j:redraw<CR>
nnoremap <silent> k k:redraw<CR>

"_______________________________________________________________________😄😄😄___________________________________________________________________
"Remaping keys to Compile programs (my own work)

"SET BASH AS DEFAULT SHELL  IN VIMRUN.EXE
"set shell=bash.exe

"_______________________________________________________________________😁😁😁___________________________________________________________________

"-------------------------------------------------PYTHON AND JDK-------------------------------------------------
autocmd FileType python nnoremap <F5> <ESC> :w <bar> !python % <CR>

"https://stackoverflow.com/questions/23292917/vim-key-mapping-compile-and-run-for-java-and-c-code
autocmd FileType java nnoremap <buffer> <F5> <ESC> :w <bar> :exec '!javac' shellescape(expand('%'), 1) '&& java' shellescape(expand('%:r'), 1)<cr>
"--------------------------------------------------GCC COMPILER----------------------------------------------------

"cmd
autocmd filetype cpp,CPP,cxx,CXX,hpp,hxx,Hxx,HXX nnoremap <F5> <ESC> :w <bar> !g++ -H -std=c++17 -Wall -Wextra -Wshadow -Ofast -o %:r % && %:r.exe <CR>

"bash
"autocmd filetype cpp,CPP,cxx,CXX,hpp,hxx,Hxx,HXX nnoremap <F5> <ESC> :w <bar> !time g++ -H -std=c++17 -Wall -Wextra -Wshadow -o %:r % && %:r.exe <CR>

"noremap <F5> <ESC> :w !g++ -std=c++17 -fsanitize=address -static-libasan -fno-omit-frame-pointer -o %< % && %< <CR>

"cmd
autocmd filetype c,C,h,H nnoremap <F5> <ESC> :w <bar> !gcc -std=c17 -Wall -Wextra -Wshadow -Ofast -o %< % && %< <CR> 

"bash
"autocmd filetype c,C,h,H nnoremap <F5> <ESC> :w <bar> !time gcc -std=c17 -Wall -Wextra -Wshadow -o %< % && %< <CR> 

"input from inp file
"noremap <F8> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -DONPC -O2 -o %< % && ./%< < inp<CR>
"inoremap <F8> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -DONPC -O2 -o "%<" "%" && "./%<" < inp<CR>
 
" -pthread 
"noremap <F9> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< <CR>
"inoremap <F9> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< <CR>
 
"noremap <F10> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< < inp<CR>
"inoremap <F10> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o "%<" "%" && "./%<" < inp<CR>


"-------------------------------------------------CLANG COMPILER----------------------------------------------

"noremap <F10> <ESC> :w <CR> :!clang++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< <CR>
"inoremap <F10> <ESC> :w <CR> :!clang++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< <CR>


"https://stackoverflow.com/questions/18711595/how-run-clang-from-command-line-on-windows
 
autocmd filetype cpp,CPP,cxx,CXX,hpp,hxx,Hxx,HXX nnoremap <F10> <ESC> :w <bar> !clang++ -target x86_64-pc-windows-gnu -H -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< <CR>

autocmd filetype c,C,h,H nnoremap <F10> <ESC> :w <bar> !clang++ -target x86_64-pc-windows-gnu -H -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< <CR>

"---------------------------------------------------MSVC COMPILER----------------------------------------------

nnoremap <F6> <ESC> :w <bar> !vcvars64.bat && cl % /std:c++latest -fsanitize=address /Zi /EHsc && %<.exe <CR>

"------------------------(ctrl + a)SELECT ALL-------------------------------

noremap <C-a> <ESC> ggVG <CR>

"-------------------------yanking(copying) with Ctrl +C---------------------

"noremap <C-c> <ESC> y <CR>

"------------------- Default copying,deletion to clipboard -----------------

set clipboard=unnamed

"-------------------Pasting copied text from clipboard----------------------

noremap <C-p> <ESC> "*p <CR>

"-------------------Hide toolbar,menubar,scrollbar, others------------------

function! ToggleGUICruft()
  if &guioptions=='i'
    exec('set guioptions=!cegimrLtTp')
  else
    exec('set guioptions=i')
  endif
endfunction

"toggle key to hide all the above and display them again
map <F11> <Esc>:call ToggleGUICruft()<cr>

" by default, hide gui menus
set guioptions=i


"---------------------------AUTOLOAD vimrc file when edited without restarting vim--------------------------

if has ('autocmd') " Remain compatible with earlier versions
 augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd

"Source :- https://superuser.com/questions/132029/how-do-you-reload-your-vimrc-file-without-restarting-vim

"Quickly Edit vimrc configuration file(:e or :split has same use)
nnoremap <Leader>ve :e $MYVIMRC <CR>
"Quickly Reload vimrc configuration file(if autoreload enabled no more need😀)
nnoremap <Leader>vr :source $MYVIMRC <CR>

"___________Toggle between background color and highlighting_______________

"function! ReverseBackground()
" let Mysyn=&syntax
" if &bg=="light"
"   se bg=dark
"   highlight Normal guibg=black guifg=white
" else
"   se bg=light
"   highlight Normal guibg=white guifg=black
" endif
" syn on
"exe "set syntax=" . Mysyn
": echo "now syntax is "&syntax
"endfunction
"command! Invbg call ReverseBackground()
"noremap <F1> :Invbg<CR>


map <F1> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

""""""""""""""""""""""""""""""""""""" All Plugins to be installed via vim plug(my preference😅) """"""""""""""""""""""""""""""""""""""

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" On-demand loading
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }

" This will add icons to stuff like NERDTree.
Plug 'ryanoasis/vim-devicons'

" syntax highlighting and indentation for lots and lots of programming languages
Plug 'sheerun/vim-polyglot'

" cpp enhanced highlight
Plug 'octol/vim-cpp-enhanced-highlight'

" Adding emmet for html files to avoid typing
Plug 'mattn/emmet-vim'

"Commenting made easy (gcc for single line, select line in visuak mode then gc for multiple line)
Plug 'chrisbra/vim-commentary'

" better and light status bar
Plug 'itchyny/lightline.vim'

" multiple cursor plugin for vim, use Ctrl+N
Plug 'terryma/vim-multiple-cursors'

" ALE (Asynchronous Lint Engine) is a plugin providing linting (syntax checking and semantic errors) in NeoVim 0.2.0+ and Vim 8 while you edit your text files, and acts as a Vim Language Server Protocol client.
Plug 'dense-analysis/ale'

" shows css color when hex value is written 
Plug 'ap/vim-css-color'

" autocomplete pairs
Plug 'jiangmiao/auto-pairs'

" coc code completion needs node
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Beatiful starup screen
Plug 'mhinz/vim-startify'

" fuzzy file finding
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" prettifies the file upon save
Plug 'prettier/vim-prettier'

" git plugin
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'airblade/vim-gitgutter'

" ascii image genrator from image
" Plug 'ashisha/image.vim'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""" python support for vim """""""""""""""""""""""""""""""""""""""""""""
"
"     😥  NOT WORKING, CRITICAL PROBLEM IN PYTHON INSTALLATION, MORE WORK TO BE DONE..........................
"
"''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

" you need to set the correct path for python3 in order for      
" :echo has("python3")  AND   :echo has("python3_dynamic")   
" to work
" remember that 'has' tells if vim supports current version
set pythonthreehome=C:\Users\JOYDEEP\AppData\Local\Programs\Python\Python310\python.exe
set pythonthreedll=C:\Users\JOYDEEP\AppData\Local\Programs\Python\Python310\python310.dll
let g:python3_host_prog="C:/Users/JOYDEEP/AppData/Local/Programs/Python/Python310 python"

" similar apporach for python but not working!!!
" set pythonhome=C:\Users\JOYDEEP\AppData\Local\Programs\Python\Python310\python.exe
" set pythondll=C:\Users\JOYDEEP\AppData\Local\Programs\Python\Python310\python310.dll
" let g:python_host_prog="C:/Users/JOYDEEP/AppData/Local/Programs/Python/Python310 python"


""""""""""""""""""""""""""""""""""""""""""""""""""""""" trigger tab completion for coc vim"""""""""""""""""""""'""'"""""""""""""""""""""

" Use tab for trigger completion with characters ahead and navigate.
" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <expr> <silent> <c-space> coc#refresh()
else
  inoremap <expr> <silent> <c-@> coc#refresh()
endif

inoremap <expr> <CR> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

set updatetime=300
set signcolumn=yes

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" coc config
let g:coc_global_extensions = [
      \ 'coc-snippets',
      \ 'coc-pairs',
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-json',
      \ 'coc-python',
      \ 'coc-pyright',
      \ 'coc-rust-analyzer',
      \ 'coc-java',
      \ 'coc-sh',
      \ ]

"""""""""""""""""""""""""""""""""""""""""""""""""" Fuzzy file finding """""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Press Ctrl + P to launch fuzzy file finder
nnoremap <C-p> :Files<Cr>

"""""""""""""""""""""""""""""""""""""""""""""""""" NerdToggler mapping """""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" press CTrl + B to open and close nerdtree
inoremap <c-b> <Esc>:NERDTreeToggle<cr>
nnoremap <c-b> <Esc>:NERDTreeToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""" ale linting settings """""""""""""""""""""""""""""""""""""""""""""""""""""""

"don't check syntax immediately on open or on quit
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1

" error symbol to use in sidebar
let g:ale_sign_error = '☢️'
let g:ale_sign_warning = '⚡'

" show number of errors
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'OK' : printf(
        \   '%d⨉ %d⚠ ',
        \   all_non_errors,
        \   all_errors
        \)
endfunction
set statusline+=%=
set statusline+=\ %{LinterStatus()}

" format error strings
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

