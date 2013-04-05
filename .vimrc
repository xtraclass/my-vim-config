set backspace=2
set grepprg=grep\ -nH\ $*
set hlsearch
set incsearch
set nocompatible
set nohidden
set nonumber
set ruler
set shiftwidth=2
set showcmd
set smartcase
set softtabstop=2
set wildmenu
set wildmode=list:longest,full

filetype on
filetype plugin on


syntax enable


let g:clipbrdDefaultReg = '+'
let MRU_Max_Entries = 100


execute pathogen#infect()
call pathogen#helptags()


au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/yaml.vim


" Because we like our line numbers sometimes...
:nnoremap <C-N><C-N> :set invnumber<CR>

" " But we don't always wanna wrap
:nnoremap <C-w><C-w> :set invwrap<CR>

" And all the cool kids need to paste
:nnoremap <C-p><C-p> :set invpaste<CR>

" Use the space key to open and close code folds
:vnoremap <space> zf<CR>
:nnoremap <space> zd<CR>


function! ToggleSyntax()
  if exists("g:syntax_on")
    syntax off
  else
    syntax enable
  endif
endfunction
nmap <silent>  ;s  :call ToggleSyntax()<CR>


imap <silent> <C-D><C-D> <C-R>=strftime("%e %b %Y")<CR>
imap <silent> <C-T><C-T> <C-R>=strftime("%L:%M")<CR>

nmap <Tab> :tabn<Enter>
nmap <S-Tab> :tabp<Enter>
nmap ;<Tab> :tabe   

:nnoremap <silent> <C-S> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR><CR>
:inoremap <silent> <C-S> <ESC>:if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>i<right>
:vnoremap <silent> <C-S> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR><CR>


" Change the current working directory to the directory that the current file you are editing is in.
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
" Opens a file with the current working directory already filled in so you have to specify only the filename.
map ,cd :cd %:p:h <CR>



set runtimepath^=~/.vim/bundle/ctrlp.vim




"nnoremap : q:i
"nnoremap / q/i
"nnoremap ? q?i

