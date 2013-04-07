set nocompatible

execute pathogen#infect()
call pathogen#helptags()




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Original version borrowed from Amir Salihefendic http://amix.dk - amix@amix.dk
" http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" :help new-omni-completion :help compl-omni
set ofu=syntaxcomplete#Complete
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"
autocmd FileType python set omnifunc=pythoncomplete#Complete



" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
"let mapleader = "\<Space>"
"let g:mapleader = "\<Space>"
let mapleader = ","
let g:mapleader = ","

" Fast saving
nnoremap <leader><leader> :w!<cr>

set fileencodings=utf-8,latin1


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Always show current position
set ruler

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


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable



" color scheme
set t_Co=256
hi Normal ctermbg=Black ctermfg=White
set background=dark



" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


" """"""""""""""""""""""""""""""
" => Visual mode related
" """"""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
noremap j gj
noremap k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"noremap , /

" Disable highlight when <leader><cr> is pressed
noremap <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
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
" Super useful when editing files in the same directory
noremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
noremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
  catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%


" """"""""""""""""""""""""""""""
" => Status line
" """"""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=%6l/%2c\ \ \ %3P\%L\ \ \ %r%{getcwd()}%h\ %{HasPaste()}\ \ %m%r\ %f\ %y%=buf\ %n\ \ \ ch\ %4b\ %4B\ \ \ %6ob

hi StatusLine term=bold ctermbg=White ctermfg=Black



" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
noremap 0 ^

"         " Delete trailing white space on save, useful for Python and
"         CoffeeScript ;)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


set pastetoggle=<leader>p


"nnoremap <space> :


" Use Q for formatting the current paragraph (or selection)
vnoremap Q gq
nnoremap Q gqap

cnoremap w!! w !sudo tee % >/dev/null



" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
noremap <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
"noremap <leader>, :vimgrep <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
" "
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


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
noremap <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>s? z=


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
noremap <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
noremap <leader>pp :setlocal paste!<cr>

let g:clipbrdDefaultReg = '+'
let MRU_Max_Entries = 100

nnoremap <C-N><C-N> :set invnumber<CR>

" But we don't always wanna wrap
nnoremap <C-w><C-w> :set invwrap<CR>

" And all the cool kids need to paste
:nnoremap <C-p><C-p> :set invpaste<CR>

function! ToggleSyntax()
  if exists("g:syntax_on")
    syntax off
  else
    syntax enable
  endif
endfunction
nmap <silent>  <leader>s  :call ToggleSyntax()<CR>

nnoremap <silent> <C-S> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR><CR>
inoremap <silent> <C-S> <ESC>:if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>i<right>
vnoremap <silent> <C-S> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR><CR>



" Quick quit
nnoremap <leader>q :q<CR>
nnoremap <leader>c :q<CR>
nnoremap <leader>- :qa!<CR>



" Quickly edit/reload the vimrc file
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>


" :help NERD_tree.txt
noremap <C-t> :NERDTreeToggle<CR>


" :h yankring.txt 
" :h yankring-tutorial 
nnoremap <leader>y :YRShow<CR>


" bufexplorer
"  '\be' (normal open)  or 
"    '\bs' (force horizontal split open)  or 
"      '\bv' (force vertical split open) 


" Gundo   http://sjl.bitbucket.org/gundo.vim/
nnoremap <leader>u :GundoToggle<CR>


" :help fugitive


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



" Reload .vimrc after save
autocmd! bufwritepost .vimrc source %



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




nnoremap # `
nnoremap - `



nnoremap <C-.> :tag 




" https://github.com/vim-scripts/Align
" :5,10Align =



" This unsets the "last searchattern" register by hitting return
nnoremap <CR> :noh<CR><CR>




" help statline
"hi link User1 StatusLine
"hi link User3 StatusLine



" set cursorline



" :h taglist




let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1


nnoremap <leader>kt :TaskList<CR>
nnoremap <leader>kp :TlistToggle<CR>





" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

