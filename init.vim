" this vimrc slightly edited from that suggested by vundle.

let mapleader="\\"
set tabstop=4
set shiftwidth=4
set mouse=a

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" PLUGIN EXAMPLES:
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'ervandew/supertab'
Plugin 'dense-analysis/ale'

" Plugin 'neomake/neomake'
Plugin 'davidhalter/jedi-vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'zchee/deoplete-jedi'

Plugin 'preservim/nerdtree'
Plugin 'nvie/vim-flake8'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
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

" link to python bin for the completion
let g:python3_host_prog = '$HOME/opt/anaconda3/bin/python'

" deoplete/jedi options
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#enable_at_startup = 1
let g:jedi#use_tabs_not_buffers = 1

imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" ale linting properties
let g:ale_linters = {
           \   'python': ['pylint', 'mypy'],
           \}
let g:ale_python_pylint_options = '--max-line-length 100' " --rcfile $HOME/my_code/main/Build_System/linting/pylint.cfg'
" " let g:ale_python_pylint_options = '--max-line-length 100 --rcfile $HOME/my_code/main/Build_System/linting/pylint-extra-rules-for-production-code.cfg'
let g:ale_python_mypy_options = '--ignore-missing-imports'
" 
" nnoremap <leader>pp :ALEToggle <bar> let g:ale_python_pylint_options = '--max-line-length 100 --rcfile $HOME/my_code/main/Build_System/linting/pylint.cfg' <bar> ALEToggle<CR>
" nnoremap <leader>pr :ALEToggle <bar> let g:ale_python_pylint_options = '--max-line-length 100 --rcfile $HOME/my_code/main/Build_System/linting/pylint-extra-rules-for-production-code.cfg' <bar> ALEToggle<CR>

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" " YCM go to definition
" nnoremap <leader>gd    :YcmCompleter GoToDefinition<CR>
" nnoremap <leader>gc    :YcmCompleter GoToDeclaration<CR>
" let g:ycm_goto_buffer_command = 'new-tab'

" " Nerd-tree
" map <Leader>q :NERDTreeToggle<CR>

" Make delete works as expected
set backspace=indent,eol,start

" Treat long lines as break lines
map j gj
map k gk

" set numbers
set number

syntax on
set background=dark
colorscheme solarized
set colorcolumn=100

" Ignore case when searching
set ignorecase
set smartcase

" highlight search results
set hlsearch
nnoremap <CR> :noh<CR><CR>

" highlight search as you type
set incsearch

" display current position
set ruler
set relativenumber

" autopep8
au FileType python setlocal formatprg=autopep8\ -

" tabs and spaces
au BufRead,BufNewFile *.py,*.pyw,*.sql set expandtab
au BufRead,BufNewFile *.py,*.pyw,*.sql set shiftwidth=4

" statusline
set laststatus=2
set statusline=%F\ %m\ %{fugitive#statusline()}\ %y%=%l,%c\ %P
