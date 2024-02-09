
"      _  __  __            _   _     _      _        _                      _             
"   _ | ||  \/  |    o O O | | | |   | |    | |_     (_)    _ __    __ _    | |_     ___   
"  | || || |\/| |   o      | |_| |   | |    |  _|    | |   | '  \  / _` |   |  _|   / -_)  
"  _\__/ |_|__|_|  TS__[O]  \___/   _|_|_   _\__|   _|_|_  |_|_|_| \__,_|   _\__|   \___|  
"_|"""""|_|"""""| {======|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""| 
""`-0-0-'"`-0-0-'./o--000'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-' 


"=======================================================================
"
" Written by :- Joydeep Mallick
"
" 2 important things to git clone by following the below links :- 
"
" https://github.com/markonm/traces.vim
" https://github.com/junegunn/vim-plug
"
"=======================================================================


" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" set modifiable
set ma

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key, default '\'
" let mapleader = ' '
let mapleader = '\'

" Security
set modelines=0

" Show line numbers in relative fashion by default
set number   "set nu
set rnu

" relative line number toggler using CTRL + l
function! NumberToggle()
  if(&rnu == 1)
    set nornu
  else
    set rnu
  endif
endfunc

nnoremap <M-l> :call NumberToggle()<cr>

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
" set visualbell

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

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
" set scrolloff=999 " 999 lines above and below cursor always, hence scrolloff 999 actually makes cursor static to screen
set scrolloff=5 
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

"set current directory as pwd 
set autochdir

" ___________________________________________ Searching ___________________________________________

" https://stackoverflow.com/questions/22851866/vnoremap-and-nnoremap-v-on-my-vimrc#:~:text=%5Cv%20at%20the%20start%20of,symbols%20in%20a%20search%20string.
" nnoremap / /\v
" vnoremap / /\v

" once word is found press enter, then press n to jump between all searches
map <C-F> :vimgrep /

" Select current text under cursor and replace it, to be worked upon🤨🙄
" ----------------------------------------------------------------------
nnoremap <space>s [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]
vnoremap <space>s [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]


" highlights search results
set hlsearch

" make search act like search in modern browser
set incsearch

" Ignore case while searching
set ignorecase

" when searching try to be smart about cases
set smartcase

" show matching brackets when cursor is over them
set showmatch

" clear search
map <leader><space> :let @/=''<cr>

" Formatting
map <leader>gq gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>lt :set list!<CR> 

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines visually
set textwidth=0 wrapmargin=0 " avoid physical line wrapping

" read https://stackoverflow.com/questions/8247243/highlighting-the-current-line-number-in-vim
" highlight the line number(but slows down gvim😱)
" set cursorline 

"_________________________________ STATUS LINE _________________________________

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

"______________________________________________________________________________

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

"____________________ fast save with Ctrl + s:update ____________________________

inoremap <C-s> <Esc>:update<cr>
nnoremap <C-s> <Esc>:update<cr>

"____________________ fast switch between mutiple buffers _______________________

"TODO 

"___ go to normal mode in terminal window made easy (also applies to popup window😕) ___

" tnoremap <Esc> <C-W>N
" set notimeout ttimeout timeoutlen=100

"______________________ playing with mutiple window tabs ________________________

"TODO error to be sorted out 
map <M-n> :tabnew<CR>
map <M-Right> :tabnext<CR>
map <M-Left> :tabprevious<CR>
map <M-Up> :tabfirst<CR>
map <M-Down> :tablast<CR>

"___________________________ working with windows _______________________________

" delete current window
nnoremap <leader>wc <C-W>c
" move to other window
nnoremap <leader>w <C-W>w
" horizontal split window below 
nnoremap <leader>s <C-W>s
" vertical split window right
nnoremap <leader>v <C-W>v

" move to window on left 
nnoremap <C-h> <C-W>h
" move to window on right
nnoremap <C-l> <C-W>l
" move to window above you
nnoremap <C-k> <C-W>k
" move to window below you 
nnoremap <C-j> <C-W>j 

" adjusting split sizes 
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" changing 2 split windows from vertical to horizontal or horizontal to vertical 
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" list all open windows , seems similar to :Buffers
nnoremap <leader>? :Windows<cr>
" launch netrw explorer
nnoremap <leader>ex :Ex<cr>

"------------------------------- Split below and right --------------------------------
" By default vim splits above and left
set splitbelow splitright

"------------------------ Shift lines in normal or visual mode ------------------------
" press shift and j OR k to move lines up or down 
nnoremap <S-k> :m .-2<CR>==
nnoremap <S-j> :m .+1<CR>==
vnoremap <S-k> :m '<-2<CR>gv=gv 
vnoremap <S-j> :m '>+1<CR>gv=gv


"SET BASH AS DEFAULT SHELL  IN VIMRUN.EXE
"set shell=bash.exe


" all the CP templates are listed below(don't blindly copy)
"----------------------------------------------------------------------
nnoremap cps :-1read H:\Mytemplates\cp_template_simple.cpp<CR>
nnoremap py :-1read H:\Mytemplates\py_template.py<CR>
"-----------------------------------------------------------------------


"------------------------------------------PYTHON, R, JAVA, JAVASCRIPT---------------------------------------------
autocmd FileType python nnoremap <F5> <ESC> :w <bar> !python % <CR>

autocmd FileType r nnoremap <F5> <ESC> :w <bar> !Rscript % <CR>
autocmd FileType rmd nnoremap <F5> <ESC> :w <bar> !R -e "rmarkdown::render('%')" <CR>

"https://stackoverflow.com/questions/23292917/vim-key-mapping-compile-and-run-for-java-and-c-code
autocmd FileType java nnoremap <buffer> <F5> <ESC> :w <bar> :exec '!javac' shellescape(expand('%'), 1) '&& java' shellescape(expand('%:r'), 1)<cr>

autocmd FileType javascript nnoremap <F5> <ESC> :w <bar> !node % <CR>

"----------------------------------------------MINGW GCC COMPILER----------------------------------------------
" -H  shows the header files imported
" read this https://stackoverflow.com/questions/6404636/libstdc-6-dll-not-found

"cmd(for better optimization of code use -Ofast else for standard speed use -Og, -pipe llows more piping and ram)
autocmd filetype cpp,CPP,cxx,CXX,hpp,hxx,Hxx,HXX nnoremap <F5> <ESC> :w <bar> !g++ -H -std=c++20 -pipe -Wall -Wextra -Wshadow -Og -o %:r % && %:r.exe <CR>

"cmd
autocmd filetype c,C,h,H nnoremap <F5> <ESC> :w <bar> !gcc -std=c17 -Wall -Wextra -Wshadow -Ofast -o %< % && %< <CR> 

"input from 'inp' file(create one in directory you use else wont work)
" autocmd filetype cpp,CPP,cxx,CXX,hpp,hxx,Hxx,HXX nnoremap <F8> <ESC> :w <bar> !g++ -H -std=c++20 -pipe -Wall -Wextra -Wshadow -Og -o %:r % && %:r.exe < inp <CR>
" autocmd filetype c,C,h,H nnoremap <F8> <ESC> :w <bar> !gcc -std=c17 -Wall -Wextra -Wshadow -Ofast -o %< % && %< < inp<CR>

" Create 'inp' file with default value '0' if not present and output to out.txt 
autocmd FileType cpp,CPP,cxx,CXX,hpp,hxx,Hxx,HXX nnoremap <F8> <ESC> :w <CR> :call CompileWithInput() <CR>
autocmd FileType c,C,h,H nnoremap <F8> <ESC> :w <CR> :call CompileWithInput() <CR>

function! CompileWithInput()
  let filename = expand('%:r')
  let inputfile = 'inp'
  let outfile = 'out.txt'
  if !filereadable(inputfile)
    let default_input = '0'
    call writefile([default_input], inputfile)
  endif
  let command = ''
  if &filetype == 'cpp' || &filetype == 'CPP' || &filetype == 'cxx' || &filetype == 'CXX' || &filetype == 'hpp' || &filetype == 'hxx' || &filetype == 'Hxx' || &filetype == 'HXX'
    let command = 'g++ -H -std=c++20 -pipe -Wall -Wextra -Wshadow -Og -o ' . filename . ' ' . expand('%') . ' && ' . filename . ' < ' . inputfile . ' > ' . outfile 
  elseif &filetype == 'c' || &filetype == 'C' || &filetype == 'h' || &filetype == 'H'
    let command = 'gcc -std=c17 -Wall -Wextra -Wshadow -Ofast -o ' . filename . ' ' . expand('%') . ' && ' . filename . ' < ' . inputfile . ' > ' . outfile
  endif
  if !empty(command)
"    exec '!cls && ' . command   "clears console before each run, not needed in vimrun
    exec '!'.command
  endif
endfunction

"bash
"autocmd filetype cpp,CPP,cxx,CXX,hpp,hxx,Hxx,HXX nnoremap <F5> <ESC> :w <bar> !time g++ -H -std=c++17 -Wall -Wextra -Wshadow -o %:r % && %:r.exe <CR>

"bash
"autocmd filetype c,C,h,H nnoremap <F5> <ESC> :w <bar> !time gcc -std=c17 -Wall -Wextra -Wshadow -o %< % && %< <CR> 

" to get better debugging info
"noremap <F5> <ESC> :w !g++ -std=c++17 -fsanitize=address -static-libasan -fno-omit-frame-pointer -o %< % && %< <CR>

"-------------------------------------------------CLANG COMPILER----------------------------------------------

"https://stackoverflow.com/questions/18711595/how-run-clang-from-command-line-on-windows
"https://github.com/clangd/clangd/issues/617
" winlibs with clang provides many libraries for windows which standard install of LLVM for windows does not provide

" Note :- bits/stdc++ not present in clang but we use gcc libraries so no problem to execute
" fsanitize=address does not work as not present , causes linker error in windows 

autocmd filetype cpp,CPP,cxx,CXX,hpp,hxx,Hxx,HXX nnoremap <F10> <ESC> :w <bar> !clang++ -target x86_64-pc-windows-gnu -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< <CR>

autocmd filetype c,C,h,H nnoremap <F10> <ESC> :w <bar> !clang -target x86_64-pc-windows-gnu -H -std=c17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< <CR>

"---------------------------------------------------MSVC COMPILER---------------------------------------------
nnoremap <F6> <ESC> :w <bar> !vcvars64.bat && cl % /std:c++latest -fsanitize=address /Zi /EHsc && %<.exe <CR>


"-------------------------------------------------------------------------------------------------------------------------
"-------------------------------------------------------------------------------------------------------------------------




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
map <F12> <Esc>:call ToggleGUICruft()<cr>

" by default, hide gui menus
set guioptions=i


"---------------------------AUTOLOAD vimrc file when edited without restarting vim--------------------------

if has ('autocmd') " Remain compatible with earlier versions
 augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded vimrc " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded vimrc" . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd

"Source :- https://superuser.com/questions/132029/how-do-you-reload-your-vimrc-file-without-restarting-vim

"Quickly Edit vimrc configuration file(:e or :split has same use)
nnoremap <Leader>ve :e $MYVIMRC <CR>
"Quickly Reload vimrc configuration file(if autoreload enabled no more need😀)
nnoremap <Leader>vr :source $MYVIMRC <CR>

"___________________________________Toggle between background color and highlighting________________________________

"TODO : not working as expected

" function! ReverseBackground()
" let Mysyn=&syntax
" if &bg=="light"
" se bg=dark
" highlight Normal guibg=black guifg=white
" else
" se bg=light
" highlight Normal guibg=white guifg=black
" endif
" syn on
"exe "set syntax=" . Mysyn
" : echo "now syntax is "&syntax
" endfunction
" command! Invbg call ReverseBackground()
" noremap <F1> :Invbg<CR>


if has('gui_running')
    map <F1> :call ToggleColors()<CR>
else 
    echo "Toggling only made for GVIM😜"
endif


function! ToggleColors()
    if &background ==# 'dark'
        set background=light
        highlight Normal guibg=#FFFFAF guifg=black
    else
        set background=dark
        highlight Normal guibg=black guifg=white
    endif
endfunction



"_________________________________ All Plugins to be installed via vim plug(my preference😅)_______________________

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" All possible colorschemes
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-gruvbox8'
Plug 'https://gitlab.com/protesilaos/tempus-themes-vim.git'
Plug 'muellan/am-colors'
Plug 'cooper-anderson/glowbeam.nvim'
Plug 'EdenEast/nightfox.nvim'     " probably not working due to lack of lua support
Plug 'connorholyday/vim-snazzy'
Plug 'veloce/vim-aldmeris'
Plug 'romgrk/doom-one.vim'
Plug 'GustavoPrietoP/doom-themes.nvim'
" A Vim color scheme for 16-color terminals
Plug 'noahfrederick/vim-noctu'
Plug 'ajmwagar/vim-deus'
Plug 'Everblush/everblush.vim'


" lua support for vim
Plug 'wolfgangmehner/lua-support'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" On-demand loading
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" This will add icons to stuff like NERDTree.
Plug 'ryanoasis/vim-devicons'

" syntax highlighting and indentation for lots and lots of programming languages
Plug 'sheerun/vim-polyglot'

" Rainbow parenthesis
Plug 'luochen1990/rainbow'

" better python syntax highlighting
Plug 'vim-python/python-syntax'

" cpp enhanced highlight
Plug 'octol/vim-cpp-enhanced-highlight'

" Adding emmet for html files to avoid typing
Plug 'mattn/emmet-vim'

"Commenting made easy (gcc for single line, select line in visuak mode then gc for multiple line)
Plug 'chrisbra/vim-commentary'

" better and light status bar
Plug 'itchyny/lightline.vim'
Plug 'sainnhe/artify.vim'

" vim suround 
Plug 'tpope/vim-surround'

" multiple cursor plugin for vim, use Ctrl+N
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" latex plugin
Plug 'lervag/vimtex'

" ALE (Asynchronous Lint Engine) is a plugin providing linting (syntax checking and semantic errors) in NeoVim 0.2.0+ and Vim 8 while you edit your text files, and acts as a Vim Language Server Protocol client.
Plug 'dense-analysis/ale'    " , { 'on':  'ALEToggle' }


" shows css color when hex value is written 
Plug 'ap/vim-css-color'

" autocomplete pairs
Plug 'jiangmiao/auto-pairs'

" coc code completion needs node
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Beatiful startup screen
Plug 'mhinz/vim-startify'

" fzf: Offers the core fuzzy-finding engine.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" fzf.vim: Integrates that engine into Vim's features and UI, making it feel like a native part of the editor.Enables features like :Files, :Buffers, :Windows, etc.Even though fzf itself has the :Rg functionality, it might not be directly usable within Vim without the complementary fzf.vim plugin.
Plug 'junegunn/fzf.vim'


" prettifies the file upon save
Plug 'prettier/vim-prettier'

" call wintweek else remap to ctrl+c
Plug 'imranZERO/wintweak.gvim'

" highlight hyperlinks
Plug 'itchyny/vim-highlighturl'

" to view impact of plugins on startup time
Plug 'dstein64/vim-startuptime'

" Mardown preview 
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" which key plugin 
Plug 'liuchengxu/vim-which-key'


"-------------------=== Snippets support ===--------------------
" Plugin 'garbas/vim-snipmate'                " Snippets manager
" Plugin 'MarcWeber/vim-addon-mw-utils'       " dependencies #1
" Plugin 'tomtom/tlib_vim'                    " dependencies #2
" Plugin 'honza/vim-snippets'                 " snippets repo

" live-server
" Plug 'turbio/bracey.vim'

" git plugin
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'airblade/vim-gitgutter'

" ascii image genrator from image
" Plug 'ashisha/image.vim'

call plug#end()

"_________________________________ set colorscheme and font _________________________________

" configure gruvbox before launching else wont apply, launching before configuring wont work
set background=dark
let g:gruvbox_contrast_dark='hard'


try
colorscheme darkdevel 
set nocursorline
" colorscheme gruvbox8_hard
" colorscheme madeofcode
" colorscheme PaperColor
" colorscheme spectro
" colorscheme badwolf
" colorscheme onehalfdark
" colorscheme base16-railscasts
" colorscheme colorsbox-material
" colorscheme OceanicNext
" colorscheme monokain
" colorscheme ayu
" colorscheme inkpot
" colorscheme tempus-warp
" colorscheme DarkDefault  " use with complete dark background
" colorscheme abbott

catch
    echo "Could not load colorscheme, loading something suitable to eyes"
    colorscheme desert
    hi Normal guibg=#000000 
endtry

"_____________________________ make terminal background transparent _____________________________

hi Normal ctermbg=None

"________________________________________ change font __________________________________________

" set guifont=Consolas:h13
set guifont=mononoki_NFM:h13

"___________________________________ personal startify setup ___________________________________

" Note :- Don't blindly keep this, specify the location where you kept the file.
" Read more :-  https://betterprogramming.pub/how-to-show-an-ascii-art-welcome-screen-at-the-top-of-the-vim-terminal-b8787f6ea9f4
" find more ascii arts here :- https://www.asciiart.eu/

" for example if your modified_startify.vim file is placed in home directory, then the following command will be needed.
" if filereadable(expand('~/modified_startify.vim'))
"   source ~/modified_startify.vim


let g:startify_files_number = 20

if filereadable(expand('~/modified_startify.vim'))
    source ~/modified_startify.vim
else 
  echo "Could not load your Startify setup. Loading default..."
endif

"_________________________________ turn on rainbow parenthesis _________________________________

let g:rainbow_active = 1

"_______________________________________ trigger which key _____________________________________

nnoremap <silent> <leader> :WhichKey '\' <CR>
" By default timeoutlen is 1000 ms
set timeoutlen=500


"_______________________________________ python support for vim_______________________________________________
"
"     😥  NOT WORKING, CRITICAL PROBLEM IN PYTHON INSTALLATION, MORE WORK TO BE DONE..........................
"
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

" you need to set the correct path for python3 in order for      
" :echo has("python3")  AND   :echo has("python3_dynamic")   
" to work
" remember that 'has' tells if vim supports current version
if has('python')
          echo 'there is Python 2.x'
endif

if has('python3')
          echo 'there is Python 3.x'
endif

" set pythonthreehome=C:/Users/JOYDEEP/AppData/Local/Programs/Python/Python310/python.exe
" set pythonthreedll=C:/Users/JOYDEEP/AppData/Local/Programs/Python/Python310/python310.dll
" let g:python3_host_prog="C:/Users/JOYDEEP/AppData/Local/Programs/Python/Python310 python"

" set pythonhome=C:/Users/JOYDEEP/AppData/Local/Programs/Python/Python310/python.exe
" set pythondll=C:/Users/JOYDEEP/AppData/Local/Programs/Python/Python310/python310.dll
" let g:python_host_prog="C:/Users/JOYDEEP/AppData/Local/Programs/Python/Python310 python"


"_____________________________ trigger tab completion for coc vim _____________________________

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

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)



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
      \ 'coc-vimlsp',
      \ 'coc-clangd',
      \ 'coc-r-lsp',
      \ 'coc-texlab',
      \ ]


"______________________________ python syntax highlighting plugin _____________________________

let g:python_highlight_all = 1

"_____________________________________ Fuzzy file finding and live grep settings _____________________________________


" **Fuzzy File Finder:** Quickly find and open files ( for visual preview)./:Files
nnoremap <leader>ff :call fzf#vim#files('', fzf#vim#with_preview('right'))<CR>

" **Live Grep:** Search for text within files using ripgrep.
nnoremap <leader>rg :Rg<CR>

" **Fuzzy Git File Finder:** Focus search on tracked Git files./ :GitFiles
nnoremap <leader>gf :call fzf#vim#gitfiles('', fzf#vim#with_preview('right'))<CR>
nnoremap <Leader>gc :Commits<CR>

" **Fuzzy Marks Navigation:** Easily jump to marks within the current file./ :Marks
nnoremap <leader>fm :call fzf#vim#marks({'options': ['--preview', 'echo line = {}']})<CR>

" **Fuzzy Buffer Navigation:** Quickly switch between open buffers.
nnoremap <leader>bf :Buffers<CR>

" **Fuzzy Command History:** Recall and execute past commands efficiently.
nnoremap <leader>fh :History<CR>
nnoremap <Leader>h: :History:<CR>
nnoremap <Leader>h/ :History/<CR> 

" **Fuzzy Help Search:** Find Vim help tags effortlessly.
nnoremap <leader>ht :Helptags<CR>

" **Fuzzy Line Search:** Locate lines within the current buffer.
nnoremap <leader>ln :Lines<CR>

" find references of word under cursor in current file 
nnoremap <leader>fr :Rg <C-R><C-W> <C-R>=expand('%:p')<CR><CR>

"_____________________________________ NerdToggler mapping ____________________________________

" press CTrl + B to open and close nerdtree
inoremap <C-b> <Esc>:NERDTreeToggle<cr>
nnoremap <C-b> <Esc>:NERDTreeToggle<cr>

"_____________________________________ ale linting settings ___________________________________

inoremap <M-a> <Esc>:ALEToggle<cr>
nnoremap <M-a> <Esc>:ALEToggle<cr>

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

" integrate coc with ale, also update coc config by adding the below line :-
" diagnostic.displayByAle": true

" let g:ale_disable_lsp = 1

"___________________________________ Color picker wintweak ____________________________________

inoremap <C-c> <Esc>:Wintweak<Cr>
nnoremap <C-c> <Esc>:Wintweak<Cr>

"___________________________________ Start Powerline Settings _________________________________

" set guifont=Inconsolata_NFM\ for\ Powerline:h15
" let g:Powerline_symbols = 'fancy'
" let g:lightline_powerline_fonts = 1
" set fillchars+=stl:\ ,stlnc:\

" if has("gui_running")
" let s:uname = system("uname")
" if s:uname == "Darwin\n"
" set guifont=Source\ Code\ Pro\ for\ Powerline:h15
" colorscheme PaperColor              " set color scheme
" endif
" endif

" ________________________________lighline settings_____________________________________

let g:lightline = {
            \ 'colorscheme': 'molokai',
            \ 'enable': {
            \ 'statusline': 1,
            \ 'tabline': 1
            \ },
            \ 'active': {
            \   'left': [ 
            \               [ 'mode', 'paste' ],
            \               [ 'gitbranch', 'readonly', 'filename' ],
            \           ],
            \  'right' : [
            \               ['lineinfo'],
            \               ['percent'],
            \               [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ],
            \            ],
            \ },
            \ 'component_function': {
            \   'filename': 'LightlineFilename',
            \   'gitbranch': 'FugitiveHead',
            \ },
            \ }


function! LightlineFilename()
let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
let modified = &modified ? ' *' : ''
return filename . modified
endfunction

"_________________________________ vimtex settings _____________________________________

let g:vimtex_view_general_viewer = 'sumatraPDF'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
let g:vimtex_compiler_method = 'latexmk'

"__________________________ terminal mode cursor shape change __________________________


" Cursor in terminal
" https://vim.fandom.com/wiki/Configuring_the_cursor
" 1 or 0 -> blinking block
" 2 solid block
" 3 -> blinking underscore
" 4 solid underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar

if &term =~ '^xterm'
  " normal mode
  let &t_EI .= "\<Esc>[0 q"
  " insert mode
  let &t_SI .= "\<Esc>[6 q"
endif

"-------------------------------------- Tips -------------------------------------------
" In order to align code simple select required lines and press =
"
" the place where you type :Commands is known as command-line prompt and you can paste something in via registers storage - http://blog.dreasgrech.com/2010/06/extending-vim-with-expression-register.html
" to paste content of clipboard in command line do 'Ctrl' + 'r' + '+' --> i.e. Ctrl Shift r =
"
" zz sets current line to centre of screen
"
" Simply put cursor over URL you want to open and type 'gx' this will open it in a browser
"
" To select current line just press shift+'v' or 'V'
"
" :Rg launches ripgrep and :Rg! launches ripgrep in vim
"
" Press % while in Normal mode to jump between start and end braces.
"
" To go to normal mode in terminal window or popup windows press <C-W>N or <C-\><C-n>, read more in documentation :help terminal-typing and https://github.com/vim/vim/issues/2490#issuecomment-383382372
"
" In :Explorer mode(:Ex), to delete file press D and rename press R and to view functionalities press <F1>  which launches :help for netrw. To create a new directory press d then enter name, to create new file % then file name.
"
" After having changes pwd using ":cd <path>" its advised to run 
"    1.  Neovim specific ----> ":edit ."in order to view changes in netrw as it does not update automatically.
"    2.  For traditional vim users ----> (🥺 I am sorry, did not find one!)
"
" To disable rainbow parenthesis toggle it using RainbowToggle.
"
" You can use the following command to change the current directory to the directory of the current file:-   :cd %:p:h 
" (helps when performing compilation task else causes strange error)
" Read more :- https://codeahoy.com/q/29/vim-faq#:~:text=To%20automatically%20change%20the%20current,set%20the%20option%20'autochdir'.
" setting autochangedir is prefered when fuzzy find file and then work on it.
