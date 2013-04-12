set nocompatible "First instruction

" ======================================================================================
" .vimrc file of Thomas Eichberger
" ======================================================================================
" 
" Original version borrowed from Amir Salihefendic http://amix.dk - amix@amix.dk
" http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
" But finally changed and added a lot...
" ======================================================================================

" plugin helper
execute pathogen#infect()
call pathogen#helptags()

" mapleader
let mapleader = "\<Space>"
let maplocalleader = ","

" encoding
set fileencodings=utf-8,latin1

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Always show current position
set ruler

" show line numers
set number

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set noshowmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" :help new-omni-completion :help compl-omni
set ofu=syntaxcomplete#Complete
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"

" color scheme or at least some color options
set t_Co=256
hi Normal ctermbg=white ctermfg=black
set background=light

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set timeoutlen=1500

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
  catch
endtry

" Remember info about open buffers on close
set viminfo^=%

" Always show the status line
set laststatus=2

" Format the status line
set statusline=%6l/%2c\ \ \ %3P\%L\ \ \ %r%{getcwd()}%h\ %{HasPaste()}\ \ %m%r\ %f\ %y\ \ \ Thomas%=%{fugitive#statusline()}\ \ \ buf\ %n\ \ \ ch\ %4b\ %4B\ \ \ %6ob
hi StatusLine term=bold ctermbg=White ctermfg=Blue

let g:clipbrdDefaultReg = '+'
let MRU_Max_Entries = 100

let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Enable syntax highlighting
syntax enable

" Enable filetype plugins
filetype plugin on
filetype indent on

" Python autocomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

" Reload .vimrc after save
autocmd! bufwritepost .vimrc source %

" Fast saving
nnoremap <leader><leader> :w!<cr>

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Treat long lines as break lines (useful when moving around in them)
noremap j gj
noremap k gk

" Search key mapping
nnoremap <leader>7 /
nnoremap <leader>6 ?

" Replace key mapping
nnoremap <leader>8 <esc>:s,
nnoremap <leader>9 <esc>:%s,

" Disable highlight when <leader><cr> is pressed
noremap <silent> <leader><cr> :noh<cr>

" Move between windows
noremap <leader><up> <C-W>j
noremap <leader><down> <C-W>k
noremap <leader><left> <C-W>h
noremap <leader><right> <C-W>l
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Close the current buffer
noremap <leader>bd :Bclose<cr>

" Close all the buffers
noremap <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
noremap <leader>tn :tabnew<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>tc :tabclose<cr>
noremap <leader>tm :tabmove

" Tab e for opening a tab, tab for jumping to tabs
nnoremap <Tab> :tabn<Enter>
nnoremap <S-Tab> :tabp<Enter>
nnoremap <leader><Tab> :tabe   

" Opens a new tab with the current buffer's path
" Useful when editing files in the same directory
noremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
noremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remap VIM 0 to first non-blank character
noremap 0 ^

" Remap VIM ^ to first character of line
noremap ^ 0

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Use Q for formatting the current paragraph (or selection) 
vnoremap Q gq
nnoremap Q gqap

cnoremap w!! w !sudo tee % >/dev/null

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" replace currently selected text with default register without yanking it
vnoremap <leader>p "_dP

" Delete until the end of line, but not including the last character
nnoremap <c-d> v$hhdi

" highlight current line and / or current column
hi CursorLine   cterm=NONE ctermbg=lightgray ctermfg=black guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=lightgray ctermfg=black guibg=darkred guifg=white
nnoremap <leader>,hh :set cursorline!<CR>
nnoremap <leader>,hc :set cursorline! cursorcolumn!<CR>

" Split
nnoremap <leader>sa        :leftabove  vnew<CR>
nnoremap <leader>sd        :rightbelow vnew<CR>
nnoremap <leader>sw        :leftabove  new<CR>
nnoremap <leader>sy        :rightbelow new<CR>
nnoremap <leader>sx        :rightbelow new<CR>
nnoremap <leader>s<left>   :leftabove  vnew<CR>
nnoremap <leader>s<right>  :rightbelow vnew<CR>
nnoremap <leader>s<up>     :leftabove  new<CR>
nnoremap <leader>s<down>   :rightbelow new<CR>

" When you press gv you vimgrep after the selected text
"vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
"noremap <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
"noremap <leader>, :vimgrep <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
" "
" To go to the next search result do:
"   <leader>n
" "
" To go to the previous search results do:
"   <leader>p
" "
noremap <leader>cc :botright cope<cr>
noremap <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
noremap <leader>n :cn<cr>
noremap <leader>p :cp<cr>

" Pressing ,ss will toggle and untoggle spell checking
noremap <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>s? z=

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>,m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
noremap <leader>,q :e ~/buffer<cr>

" Toggle paste mode on and off
noremap <leader>pp :setlocal paste!<cr>

" Show or hide line numbers
nnoremap <C-N><C-N> :set invnumber<CR>

" But we don't always wanna wrap
nnoremap <C-w><C-w> :set invwrap<CR>

" And all the cool kids need to paste
nnoremap <C-p><C-p> :set invpaste<CR>

nnoremap <silent>  <leader>s  :call ToggleSyntax()<CR>

" Save filw
nnoremap <silent> <C-S> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR><CR>
inoremap <silent> <C-S> <ESC>:if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>i<right>
vnoremap <silent> <C-S> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR><CR>

" Quick quit
nnoremap <leader>q :q<CR>
nnoremap <leader>- :q<CR>
nnoremap <leader>.. :wq<CR>
nnoremap \ :qa!<CR>

" Quickly edit/reload the vimrc file
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>

" :help NERD_tree.txt
noremap <C-t> :NERDTreeToggle<CR>

" :h yankring.txt 
" :h yankring-tutorial 
nnoremap <leader>y :YRShow<CR>

" bufexplorer
" <leader>be (normal open)  or 
" <leader>bs (force horizontal split open)  or 
" <leader>bv (force vertical split open) 

" Gundo   http://sjl.bitbucket.org/gundo.vim/
nnoremap <leader>u :GundoToggle<CR>

" nerdcommenter
"
"Most of the following mappings are for normal/visual mode only. The |NERDComInsertComment| mapping is for insert mode only.
"
"[count]<leader>cc |NERDComComment|
"Comment out the current line or text selected in visual mode.
"
"[count]<leader>cn |NERDComNestedComment|
"Same as <leader>cc but forces nesting.
"
"[count]<leader>c |NERDComToggleComment|
"Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa.
"
"[count]<leader>cm |NERDComMinimalComment|
"Comments the given lines using only one set of multipart delimiters.
"
"[count]<leader>ci |NERDComInvertComment|
"Toggles the comment state of the selected line(s) individually.
"
"[count]<leader>cs |NERDComSexyComment|
"Comments out the selected lines ``sexily''
"
"[count]<leader>cy |NERDComYankComment|
"Same as <leader>cc except that the commented line(s) are yanked first.
"
"<leader>c$ |NERDComEOLComment|
"Comments the current line from the cursor to the end of line.
"
"<leader>cA |NERDComAppendComment|
"Adds comment delimiters to the end of line and goes into insert mode between them.
"
"|NERDComInsertComment|
"Adds comment delimiters at the current cursorosition and inserts between. Disabled by default.
"
"<leader>ca |NERDComAltDelim|
"Switches to the alternative set of delimiters.
"
"[count]<leader>cl
"[count]<leader>cb |NERDComAlignedComment|
"Same as |NERDComComment| except that the delimiters are aligned down the left side (<leader>cl) or both sides (<leader>cb).
"
"[count]<leader>cu |NERDComUncommentLine|
"Uncomments the selected line(s).

" ultisnips   http://www.vim.org/scripts/script.php?script_id=2715

" If you've ever tried using the "." command after alugin map, you were likely disappointed to discover it only repeated the last native command inside that map, rather than the map as a whole.  That disappointment ends today.  Repeat.vim remaps "." in a way thatlugins can tap into it. 
" 
" Support is alreadyresent in the followinglugins: 
" 
" surround.vim (vimscript #1697) 
" speeddating.vim (vimscript #2120) 
" abolish.vim (vimscript #1545) 
" unimpaired.vim (vimscript #1590) 
" commentary.vim (vimscript #3695) 
" 
" Adding support to alugin is generally as simple as the following command at the end of your map functions. 
" 
"   silent! call repeat#set("\<Plug>MyWonderfulMap",v:count) 

" Jump to mark
nnoremap # `
nnoremap - `

nnoremap <C-.> :tag 

" This unsets the "last searchattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" :h taglist
nnoremap <leader>kt :TaskList<CR>
nnoremap <leader>kp :TlistToggle<CR>

" Call ack
nnoremap <leader>a <Esc>:!ack 

" https://github.com/paradigm/TextObjectify.git

" Instead of pressing <esc>
inoremap jk <esc>
inoremap kj <esc>
  
" Adds an empty line below, leaves insert mode
nnoremap <localleader>l o<esc>

" Adds an empty line below, adds a .vimrc comment sign
nnoremap <localleader>v o" 

" Use Alt-X to quickly switch between buffers, where X is the buffer number 1 to 9.
nnoremap <M-1> :confirm :b1 <CR>
nnoremap <M-2> :confirm :b2 <CR>
nnoremap <M-3> :confirm :b3 <CR>
nnoremap <M-4> :confirm :b4 <CR>
nnoremap <M-5> :confirm :b5 <CR>
nnoremap <M-6> :confirm :b6 <CR>
nnoremap <M-7> :confirm :b7 <CR>
nnoremap <M-8> :confirm :b8 <CR>
nnoremap <M-9> :confirm :b9 <CR>

" Cycle through buffers with <ALT><Left> and <ALT><Right>
nnoremap <M-Left> :bprev<CR>
nnoremap <M-Right> :bnext<CR>⁰

" Under linux, the script above will copy the file path or filename to X Server clipboard (accessed by pressing the middle mouse button). To copy text to the Gnome Clipboard instead replace the following lines:
"   nmap ,cs :let @*=expand("%")<CR>
"     nmap ,cl :let @*=expand("%:p")<CR>
" 
"     with  * +
nnoremap <localleader>cs :let @*=expand("%")<CR>
nnoremap <localleader>cl :let @*=expand("%:p")<CR>

" Open file explorer
nnoremap <leader>e :Sex<cr>

" QAbbreviations  
iabbrev ööte Thomas Eichberger
iabbrev ööfu function

" :help fugitive

" https://github.com/vim-scripts/Align
" :5,10Align =



" ==============================================================
" Helper Functions
" ==============================================================

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
endfunction

function! ToggleSyntax()
  if exists("g:syntax_on")
    syntax off
  else
    syntax enable
  endif
endfunction

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc

