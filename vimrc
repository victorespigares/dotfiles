set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

Plugin 'majutsushi/tagbar'
Plugin 'xolox/vim-easytags'
Plugin 'vim-misc'

Plugin 'git://github.com/tpope/vim-fugitive'
"Plugin 'https://github.com/groenewege/vim-less.git'
Plugin 'git://github.com/tpope/vim-surround'
"Plugin 'https://github.com/kchmck/vim-coffee-script.git'
Plugin 'https://github.com/powerman/vim-plugin-autosess.git'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""




let mapleader=","

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showmatch   " Show matching brackets.
set ignorecase  " Do case insensitive matching
"set smartcase  " Do smart case matching
set incsearch   " Incremental search
set hlsearch	" Highlight all search occurances
"set autowrite  " Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a     " Enable mouse usage (all modes) in terminals
set number      " Line numbers
set ruler       " Status line in the bottom
set autoindent  " Auto-indentation
set scrolloff=3 " Always show some lines above and below the cursor

set tabstop=4
set shiftwidth=4
set noexpandtab
set softtabstop=-1
set list
set showbreak=↪\ 
set listchars=tab:¦\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨ " Show whitespace characters
hi Comment ctermfg=darkgray
hi Search ctermfg=9 ctermbg=2
set t_Co=256
syntax enable
nnoremap ' `
nnoremap ` '
set cursorline
set cursorcolumn
colorscheme molokai

" easily switch tabs
" nnoremap <leader>gt :tabnext<cr>
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" " Go to last active tab: https://superuser.com/a/1372732
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>

" Ignore .gitignore files for CtrlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

nnoremap <silent> <Leader>b :TagbarToggle<CR>


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
