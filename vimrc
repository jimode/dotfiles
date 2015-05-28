" pathogen - must come first
execute pathogen#infect()

set directory=$HOME/.vim/swapfiles//

filetype on
filetype indent on
filetype plugin on

execute pathogen#infect()

let mapleader = ","

syntax enable

"airline plugin
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1

"set foldmethod=syntax
set ignorecase
set hlsearch
set incsearch
set autoindent
set smartindent
set expandtab
set fileencoding=utf-8
set encoding=utf-8
set backspace=indent,eol,start
set ts=2 sts=2 sw=2 expandtab
set smartindent
set number
set showcmd

" Abbreviations
inoreabbrev teh the
cnoreabbrev Wq wq

" Mappings
inoremap <C-1> <space>=><space>
inoremap <C-s> <Esc>:w<CR>a
inoremap jk <esc>

nnoremap <C-s> :w<CR>
nnoremap <leader>ev :vs $MYVIMRC<CR>
nnoremap <leader>gs :Gstatus<CR><C-W>15+
nnoremap <leader>m :NERDTreeToggle<CR>
nnoremap <leader>rs :!clear;rspec --color spec<CR>
nnoremap <leader>a :Ack
nnoremap <leader>d :bd<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader><space> :noh<CR>
nnoremap / /\v
nnoremap ? ?\v

vnoremap / /\v
vnoremap ? ?\v
vnoremap < <gv
vnoremap > >gv nnoremap n nzz
nnoremap N Nzz
nnoremap Y y$

set smartcase
set gdefault
set incsearch
set showmatch

set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

set list
set listchars=tab:▸\ ,eol:¬,nbsp:⋅,trail:•
set guifont=PragmataPro
set guioptions=aAc
set guioptions-=Be
set number
set noswapfile
set visualbell
set cursorline

" Solarized theme
syntax enable
set background=dark
colorscheme solarized

" match ErrorMsg '\%>80v.\+'
" set cc=80

"Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()>CR>
function! <SID>SynStack()
  if !exists("*syntack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

".ru files in Ruby.
au BufRead,BufNewFile *.ru seftiletype ruby

"Previewheight for Fugitive's status window
set previewheight=20

"Auto commands
autocmd BufRead,BufWritePre *.html normal gg=G
autocmd Filetype html nnoremap <buffer> <leader>c I<!--<esc>A--><esc>

augroup CucumberCmds
  autocmd Filetype rb nnoremap <buffer> <leader>r :!bundle exec features/ %<cr>
  autocmd Filetype rb nnoremap <buffer> <leader>c I#<esc>
augroup END

" ---------------------------------------------------------------------------------
" 6 multiple windows
" ---------------------------------------------------------------------------------
"Convenient shortcut for window ops
map <leader>h <C-W>h
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>l <C-W>l

map <leader>H <C-W>H
map <leader>J <C-W>J
map <leader>K <C-W>
map <leader>L <C-W>
map <leader>w <C-W>w
map <leader>n <C-W>n
map <leader>q <C-W>q
map <leader>s <C-W>s
map <leader>v <C-W>v
map <leader>t <C-W>
map <leader>b <C-W>
map <leader>o <C-W>o
map <Leader>vi :tabe ~/.vimrc<CR>
map <Leader>so :source ~/.vimrc<CR>

function! InsertTabWrapper()
  let col = col(".") - 1
  if !col || getline(".")[col-1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-n>"
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-p>

"map <C-=><esc>:res +5<CR>
"map <C--> <esc>:res -5<CR>
"map <C-+> <esc>:vertical resize +5<CR>
"map <C-_> <esc>:vertical resize -5<CR>
