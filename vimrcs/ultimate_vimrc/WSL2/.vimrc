" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Setting to automatically read updated files without warning!
set autoread

" set modifiable
set ma

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key, default '\'
let g:mapleader = "\<Space>"

" Security
set modelines=0
 
" Show line numbers in relative fashion by default
set number   "set nu
set rnu
 
" Show file stats
set ruler
 
" Stop annoying beep sounds and prevent screen flash in visual bell
" set noeb vb t_vb=  " not working
set belloff=all
 
"Encoding
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
 
" scroll at end leaves 5 extra spaces
set scrolloff=5 
set backspace=indent,eol,start
 
" Allow hidden buffers
set hidden
 
" Rendering
set ttyfast
 
" Show the command being executed
set showcmd

"Always show tab even if only 1 tab is present
set showtabline=2

"set current directory as pwd 
set autochdir
 
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
 
" clears highlighting on double escaping in normal mode
nnoremap <silent> <Esc><Esc> :let @/=""<CR>
 
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines visually
set textwidth=0 wrapmargin=0 " avoid physical line wrapping
 
" Show matching brackets when text indicator is over them
set showmatch
 
"set wild menu for the suggestion to appear
set wildmenu
 
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
 
" adjusting split sizes using alt and arrow keys 
noremap <silent> <M-Left> :vertical resize +3<CR>
noremap <silent> <M-Right> :vertical resize -3<CR>
noremap <silent> <M-Up> :resize +3<CR>
noremap <silent> <M-Down> :resize -3<CR>
 
" changing 2 split windows from vertical to horizontal or horizontal to vertical 
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K
 
" list all open windows , seems similar to :Buffers
nnoremap <leader>? :Windows<cr>
" launch netrw explorer
nnoremap <leader>ex :Ex<cr>
 
"-------------------------- Split below and right ---------------------------
" By default vim splits above and left
set splitbelow splitright
 
"--------------------Shift lines in normal or visual mode -------------------
" press shift and j OR k to move lines up or down 
nnoremap <S-k> :m .-2<CR>==
nnoremap <S-j> :m .+1<CR>==
vnoremap <S-k> :m '<-2<CR>gv=gv 
vnoremap <S-j> :m '>+1<CR>gv=gv
"------------------------(ctrl + a)SELECT ALL-------------------------------
 
noremap <C-a> <ESC> ggVG <CR>

"_____________________ (ctrl + backspace) deletes word _____________________

inoremap <C-BS> <C-W> "does not work in windows terminal, use ctrl + w instead 


"------------------- Default copying,deletion to clipboard -----------------
 
set clipboard+=unnamedplus
 
"---------------Pasting copied text from windows clipboard------------------
 
noremap <C-p> <ESC> "+p
 
" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

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

" Cursor shape change for terminals
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[2 q"


" Plugins installed via Vim Plug
call plug#begin()
 
Plug 'rose-pine/vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'rakr/vim-one'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'morhetz/gruvbox'
 
" highlight yanked text 
Plug 'machakann/vim-highlightedyank'
 
" On-demand loading
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" more syntax highlighting 
Plug 'sheerun/vim-polyglot'
Plug 'vim-python/python-syntax'
Plug 'octol/vim-cpp-enhanced-highlight'

" This will add icons to stuff like NERDTree.
Plug 'ryanoasis/vim-devicons'
 
" Rainbow parenthesis
Plug 'luochen1990/rainbow'
 
"Commenting made easy (gcc for single line, select line in visual mode then gc for multiple line)
Plug 'chrisbra/vim-commentary'
 
" vim suround 
Plug 'tpope/vim-surround'
 
" multiple cursor plugin for vim, use Ctrl+N
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
 
" autocomplete pairs
Plug 'jiangmiao/auto-pairs'
 
" highlight hyperlinks
Plug 'itchyny/vim-highlighturl'
 
" which key plugin 
Plug 'liuchengxu/vim-which-key'
 
" fzf: Offers the core fuzzy-finding engine.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" COC code Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" statusline
Plug 'itchyny/lightline.vim'

" git plugins
Plug 'tpope/vim-fugitive'

" beatiful starting screen
Plug 'mhinz/vim-startify'

" copilot
Plug 'github/copilot.vim' 

call plug#end()
 
 
" _____________________________ setting colorscheme and font _____________________________
try
    colorscheme rosepine_moon         
    hi Normal ctermbg=None guibg=#000000
catch
    echo "Could not load colorscheme, loading default"
endtry
 
 
" setting nerdfont (syntax is platform dependent see https://vi.stackexchange.com/a/15452 )
set guifont=JetBrainsMono\ Nerd\ Font\ Medium\ 16
 
" set current line to highlight
set cursorline
if has("gui_running")
  highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
  highlight CursorLineNr guifg=#00ff00 ctermfg=Green
else
  highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
  highlight CursorLineNr guifg=#00ff00 ctermfg=Red
endif


"__________________________________ startify vim settings ----------------------------------
let g:startify_files_number = 20

"_____________________________________ trigger which key ___________________________________    
nnoremap <silent> <leader> :WhichKey '' <BS> <CR> 
" By default timeoutlen is 1000 ms  
set timeoutlen=500
 
  
"____________________________ Go full screen borderless in gvim ____________________________
" ensure wmctrl is installed in linux
map <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

"____________________________ turn on rainbow parenthesis _______________________________

let g:rainbow_active = 1

"________________________________ NerdToggler mapping ___________________________________

" press CTrl + B to open and close nerdtree
inoremap <C-b> <Esc>:NERDTreeToggle<cr>
nnoremap <C-b> <Esc>:NERDTreeToggle<cr>

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

"_________________________________ Devicons settings ____________________________________
" Can be enabled or disabled
let g:webdevicons_enable_nerdtree = 1
" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 1

 
"______________________ Fuzzy file finding and live grep settings ______________________


" **Fuzzy File Finder:** Quickly find and open files ( for visual preview)./:Files
nnoremap <leader>ff :call fzf#vim#files('', fzf#vim#with_preview('right'))<CR>

" **Live Grep:** Search for text within files using ripgrep.
nnoremap <leader>rg :Rg!<CR>

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


" ____________________________ copilot setup ___________________________ 
let g:copilot_node_command = '~/.nvm/versions/node/v20.15.0/bin/node'

"_____________________________ trigger tab completion for coc vim _____________________________
" Hard coded it node path of my system since default path can't find location
let g:coc_node_path = '~/.nvm/versions/node/v20.15.0/bin/node'
" let g:coc_node_path = trim(system('which node')) " not working


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
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-yaml',
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

" ___________________________ lightline settings ___________________________

" read more :-
" https://www.reddit.com/r/vim/comments/lvgjmo/lightline_glyphs/
" https://pastebin.com/z608uujk

set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'ayu_dark',
      \ 'enable': {
      \ 'statusline': 1,
      \ 'tabline': 1
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'filename' ], [ 'readonly', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename',
      \   'readonly': 'LightLineReadonly',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'gitbranch': 'LightLineFugitive',
      \   'mode': 'LightLineMode',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '✹' : &modifiable ? ' ' : ''
endfunction
 
function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction
 
function! LightLineFugitive()
if &ft !~? 'vimfiler\|gundo' && exists("*FugitiveHead")
let _ = FugitiveHead()
return strlen(_) ? ' '._ : ''
endif
return ''
endfunction
 
function! LightLineFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction 

function! LightLineFiletype()
return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction 

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction
 
function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction






" _______________________________________ C/C++ specific keybinding _______________________________________
" -H  shows the header files imported
" read this https://stackoverflow.com/questions/6404636/libstdc-6-dll-not-found

"linux specific(for better optimization of code use -Ofast else for standard speed use -Og, -pipe llows more piping and ram)
autocmd filetype cpp,CPP,cxx,CXX,hpp,hxx,Hxx,HXX nnoremap <F5> <ESC> :w <BAR> !clear && g++ -H -std=c++20 -pipe -Wall -Wextra -Wshadow -Og -o %:r % && ./%:r <CR>

" linux specific
autocmd filetype c,C,h,H nnoremap <F5> <ESC> :w <BAR> !clear && gcc -std=c17 -Wall -Wextra -Wshadow -Ofast -o %< % && %< <CR> 

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
    let command = 'g++ -H -std=c++20 -pipe -Wall -Wextra -Wshadow -Og -o ' . filename . ' ' . expand('%') . ' && ./' . filename . ' < ' . inputfile . ' > ' . outfile 
  elseif &filetype == 'c' || &filetype == 'C' || &filetype == 'h' || &filetype == 'H'
    let command = 'gcc -std=c17 -Wall -Wextra -Wshadow -Ofast -o ' . filename . ' ' . expand('%') . ' && ./' . filename . ' < ' . inputfile . ' > ' . outfile
  endif
  if !empty(command)
    exec '!clear && ' . command
  endif
endfunction

" ------------------------------ CP Template ---------------------------
nnoremap cps :-1read ~/CodeWSL/cp_template_simple.cpp<CR>
