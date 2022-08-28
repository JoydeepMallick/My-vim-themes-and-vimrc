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
set number
"set nu

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
" Set the below 3 values to 2 if you feel it more comfortable(standard is 4)
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
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

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
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

"colorscheme solarized
"colorscheme gruvbox
colorscheme cobalt




set guifont=Consolas:h13

""set autoindent
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


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
nnoremap cpp :-1read H:\Mytemplates\cp_template.cpp<CR>
nnoremap cps :-1read H:\Mytemplates\cp_template_simple.cpp<CR>

nnoremap py :-1read H:\Mytemplates\py_template.py<CR>

"Always show tab even if only 1 tab is present
set showtabline=2

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

set lazyredraw
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



