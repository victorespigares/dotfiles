set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Installs fzf binary on its own
" Requires Ag
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'pbogut/fzf-mru.vim'

" Requires ctags|exuberant-ctags
"Plugin 'majutsushi/tagbar'
"Plugin 'xolox/vim-easytags'

Plugin 'vim-misc'

"Plugin 'git://github.com/tpope/vim-fugitive'
"Plugin 'https://github.com/groenewege/vim-less.git'
Plugin 'tpope/vim-surround'
"Plugin 'https://github.com/kchmck/vim-coffee-script.git'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"Plugin 'ctrlpvim/ctrlp.vim'

"Plugin 'Syntastic'

"Plugin 'tabman.vim'

Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'

Plugin 'zhou13/vim-easyescape'
Plugin 'NLKNguyen/papercolor-theme'

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
set encoding=utf-8
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
set backspace=2
"colorscheme molokai
colorscheme PaperColor

" easily switch tabs
" nnoremap <leader>gt :tabnext<cr>
" nnoremap th  :tabfirst<CR>
" nnoremap tk  :tabnext<CR>
" nnoremap tj  :tabprev<CR>
" nnoremap tl  :tablast<CR>
" nnoremap tt  :tabedit<Space>
" nnoremap tn  :tabnext<Space>
" nnoremap tm  :tabm<Space>
" nnoremap td  :tabclose<CR>
" nnoremap gr  :tabprev<CR>

" " Go to last active tab: https://superuser.com/a/1372732
" au TabLeave * let g:lasttab = tabpagenr()
" nnoremap <silent> <c-l> :exe 'tabn '.g:lasttab<cr>
" vnoremap <silent> <c-l> :exe 'tabn '.g:lasttab<cr>

" Ignore .gitignore files for CtrlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Syntastic
let g:syntastic_javascript_checkers = ['eslint', 'mixedindentlint']

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

"FZF
" https://github.com/junegunn/fzf/issues/539
" let g:fzf_action = { 'enter': 'tabedit' }
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" This fixes strange behaviour with Airline and other plugins ?↲
" https://github.com/vim-airline/vim-airline/issues/1627↲
let g:airline_section_x = ''
" showing buffers
let g:airline#extensions#tabline#enabled = 1

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-X> :bdelete<CR>


" Ag full screen search with preview - https://stackoverflow.com/a/50730458
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" vim-jsx-pretty Colorful style (vim-javascript only)
let g:vim_jsx_pretty_colorful_config = 1 " default 0

" https://github.com/zhou13/vim-easyescape/
let g:easyescape_chars = { "j": 2 }
let g:easyescape_timeout = 500
cnoremap jj <ESC>

" temporary unmapping ESC key to retrain
"noremap <Esc> <Nop>

function! MakeSession(overwrite)
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  if a:overwrite == 0 && !empty(glob(b:filename))
    return
  endif
  exe "mksession! " . b:filename
endfunction

function! LoadSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction

" Adding automatons for when entering or leaving Vim
if(argc() == 0)
  au VimEnter * nested :call LoadSession()
  au VimLeave * :call MakeSession(1)
else
  au VimLeave * :call MakeSession(0)
endif
