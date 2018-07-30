" UTF-8 ALL THE THINGS!
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8

" Remap leader from '\' to ','
let mapleader = ','

" Plug
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'Shougo/neocomplete.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'sid77/nerdtree-custom-mappings-plugin'
Plug 'bling/vim-airline'
Plug 'haya14busa/incsearch.vim'
Plug 'fatih/vim-go'
Plug 'nvie/vim-flake8'
Plug 'hashivim/vim-terraform'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'rust-lang/rust.vim'
call plug#end()

" General UI options
set nocompatible
filetype plugin indent on
set secure
set backspace=indent,eol,start
set breakindent
set cmdheight=2
set linebreak
set linespace=0
set number
set ruler
set showmatch
set incsearch
set hlsearch
set wildmenu
set wildmode=list:longest,full
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Move a bunch of stuff inside .vim
set viminfo+=n~/.vim/viminfo
set directory=~/.vim/swap
set backupdir=~/.vim/backup
set undodir=~/.vim/undo

" The ninties called and they wanted their 80 columns back
set autoindent
set shiftwidth=2
set expandtab
set tabstop=8
set softtabstop=2
set textwidth=80

" Filetype customizations
autocmd filetype c set listchars=tab:\ \ ,trail:•,extends:#,nbsp:. shiftwidth=8 softtabstop=8
autocmd filetype go set listchars=tab:\ \ ,trail:•,extends:#,nbsp:.
" Markdown support (sorry Modula-2)
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" Map TAB to indent code
map <TAB> mzgg=G`z<CR>

" " Mouse
" if has("mouse")
"   set mouse=a
"   set nomousehide
"   set ttymouse=xterm2
" endif

" Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1

" Ale
let g:airline#extensions#ale#enabled = 1 " always on statusline
let g:ale_lint_on_text_changed = 'never' " do not lint-as-you-type

" NERDTree
"autocmd vimenter * NERDTree " show NERDTREE when opening a file
autocmd StdinReadPre * let s:std_in=1                                       " show NERDTree when no files are open on startup
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif " show NERDTree when no files are open on startup
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeQuitOnOpen = 1
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'
highlight NERDTreeDir NONE

" incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" airline
"let g:airline_powerline_fonts = 1
set laststatus=2

" Fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
nnoremap <silent> <leader>ga :Git add .<CR>

" NeoComplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" vim-terraform
let g:terraform_fmt_on_save = 1

" rust.vim
let g:rustfmt_options = '-f'
let g:rustfmt_autosave = 1

" Colours
syntax on
set background=dark
let g:nofrils_strbackgrounds=0
let g:nofrils_heavycomments=1
colorscheme nofrils-dark
