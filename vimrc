call pathogen#infect()

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showmatch   " Show matching brackets.
set ignorecase  " Do case insensitive matching
"set smartcase  " Do smart case matching
set incsearch   " Incremental search
"set autowrite  " Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a     " Enable mouse usage (all modes) in terminals
set number      " Line numbers
set ruler       " Status line in the bottom
set autoindent  " Auto-indentation

set tabstop=4
set shiftwidth=4
set noexpandtab
set softtabstop=-1
set list
set showbreak=↪\ 
set listchars=tab:¦\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
hi Comment ctermfg=darkgray
hi Search ctermfg=9 ctermbg=2
set t_Co=256
syntax enable
set hlsearch
nnoremap ' `
nnoremap ` '
set cursorline
set cursorcolumn
colorscheme molokai

" Show line numbers in Explorer mode: https://stackoverflow.com/questions/30249593/vim-show-line-numbers-when-using-explore
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

" http://vim.wikia.com/wiki/Capitalize_words_and_regions_easily
if (&tildeop)
  nmap gcw guw~l
  nmap gcW guW~l
  nmap gciw guiw~l
  nmap gciW guiW~l
  nmap gcis guis~l
  nmap gc$ gu$~l
  nmap gcgc guu~l
  nmap gcc guu~l
  vmap gc gu~l
else
  nmap gcw guw~h
  nmap gcW guW~h
  nmap gciw guiw~h
  nmap gciW guiW~h
  nmap gcis guis~h
  nmap gc$ gu$~h
  nmap gcgc guu~h
  nmap gcc guu~h
  vmap gc gu~h
endif

