" pathogen stripped down load
"execute pathogen#infect()
"syntax on
"filetype plugin indent on

" Pathogen load
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on

set nohlsearch
set wrap

set modeline    " Debian overrides this in /usr/share/vim/vim73/debian.vim

set diffopt+=iwhite  " ignore whitespace in vimdiff

let mapleader = ","
let g:mapleader = ","

set wildmenu
set scrolloff=6

"source /home/matt/.local/lib/python2.7/site-packages/powerline/ext/vim/source_plugin.vim
"python from powerline.ext.vim import source_plugin; source_plugin()

set laststatus=2
set encoding=utf-8


"noremap <leader>be BufExplorer

" JEDI
"let g:jedi#use_splits_not_buffers = "left"


" POWERLINE
let g:Powerline_symbols = 'fancy'
"let g:Powerline_theme = 'solarized256'
let g:Powerline_colorscheme = 'solarized256'
" AIRLINE
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg='dark'
let g:solarized_termcolors=256
"let g:airline_theme='solarized'
let g:airline_theme='kolor'  " :AirlineTheme kolor


let g:SuperTabDefaultCompletionType = "context"

" TAGBAR
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

" Looks for a tags file, then continue looking upwards till /
"set tags=./tags;/

set t_Co=256
set background=dark
let g:solarized_termcolors=256 " TERM=xterm-256color
colorscheme solarized

" ^J : Change focus to lower window, and maximize
" ^K : Change focus to upper window, and maximize
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
" Same for tabs
nmap <C-h> :tabprev<CR>
nmap <C-l> :tabnext<CR>

set expandtab
set sw=2
set smarttab
set ai
" yaml, puppet, HTML uses 2 space indent
autocmd FileType yaml   setlocal shiftwidth=2 tabstop=2
autocmd FileType puppet setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby   setlocal shiftwidth=2 tabstop=2

" Fold behavior

set foldmethod=syntax
set foldlevelstart=1

let javaScript_fold=1
let perl_fold=1
let g:pymode_folding = 1
let php_folding=1
let r_syntax_folding=1
let ruby_fold=1
let sh_fold_enabled=1
let vimsyn_folding='af'
let xml_syntax_folding=1

"let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
let g:pymode_lint_checkers = ['pyflakes',]



set nolist
set listchars=tab:▸\ ,eol:¬

set ignorecase
set smartcase
set gdefault

" Turn off vim specific regex magic ... its just weird
"nnoremap / /\v
"vnoremap / /\v


" Show trailing whitepace and spaces before a tab:
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+\%#\@<!$/ containedin=ALL

" Highlight unicode
autocmd BufRead * syntax match nonascii "[^\u0000-\u007F]"
highlight nonascii guibg=Red ctermbg=1 term=standout

augroup python
  autocmd!

  autocmd FileType python set cinwords=if,elif,else,for,while,try,except,finally,def,class
  autocmd FileType python set tabstop=8 shiftwidth=4 smarttab expandtab softtabstop=4 autoindent nosmartindent

  let python_space_errors = 1
  setlocal nospell

  " indent-guides
  let g:indent_guides_auto_colors = 0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey
augroup END


nnoremap <leader>a :Ack

if exists(":Tabularize")
  nmap <leader>t= :Tabularize /=<CR>
  vmap <leader>t= :Tabularize /=<CR>
  nmap <leader>t: :Tabularize /:\zs<CR>
  vmap <leader>t: :Tabularize /:\zs<CR>
  nmap <leader>t| :Tabularize /|\zs<CR>
  vmap <leader>t| :Tabularize /|\zs<CR>
endif
