" UTF-8 ALL THE THINGS!
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8

" Meh
let s:os = substitute(system('uname -s'), "\n", "", "")

" Plug
function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    let ycm_install_command = '!./install.py --gocode-completer'
    if s:os == 'OpenBSD'
      let ycm_install_command = ycm_install_command . ' --system-boost'
    endif
    execute ycm_install_command
  endif
endfunction
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'bling/vim-airline'
Plug 'haya14busa/incsearch.vim'
Plug 'fatih/vim-go'
Plug 'nvie/vim-flake8'
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
autocmd filetype go set listchars=tab:\ \ ,trail:•,extends:#,nbsp:.

" The ninties called and they wanted their 80 columns back
set autoindent
set shiftwidth=2
set expandtab
set tabstop=8
set softtabstop=2
set textwidth=80

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

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck'] " vim-go compatibility
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] } " vim-go compatibility

" incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" airline
"let g:airline_powerline_fonts = 1
set laststatus=2

" Colours
syntax on
set background=dark
let g:nofrils_strbackgrounds=0
let g:nofrils_heavycomments=1
colorscheme nofrils-dark
