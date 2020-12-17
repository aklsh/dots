"
"    #############         ##################
"    #############         ##################
"      #########             #############
"      #########           ############
"      #########         ############
"      #########       ###########
"      #########     ##########
"      #########   ##########
"      ######### #########
"      #################
"      ###############
"      #############
"      ###########
"      #########
"      #######
"      #####    imrc
"
"
" Author: Akilesh Kannan
" Contact: akileshkannan@gmail.com
" Web: https://aklsh.github.io
"
" How I configure (Neo)Vim :P
"


" Gotta be first
set nocompatible
filetype plugin on

" check if vim-plug exists; if not, install
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

"
"
" ╔═══════════════════════════════════════════════════════════════════╗
" ║                                                                   ║
" ║                       General Key Mappings                        ║
" ║                                                                   ║
" ╚═══════════════════════════════════════════════════════════════════╝
"
"
nnoremap j gj
nnoremap k gk
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
nnoremap <C-[> <C-t>
vnoremap > >gv
vnoremap < <gv
nnoremap <silent> <leader>, :noh<CR>
tnoremap <silent> <Esc> <C-\><C-n>
nnoremap <silent> <leader>bn :bnext<CR>
nnoremap <silent> <leader>bp :bprevious<CR>
nnoremap <silent> <leader>bd :bdelete<CR>

"
"
" ╔═══════════════════════════════════════════════════════════════════╗
" ║                                                                   ║
" ║                              Plugins                              ║
" ║                                                                   ║
" ╚═══════════════════════════════════════════════════════════════════╝
"
"

call plug#begin('~/.vim/plugged')
"--------------------------------------------------------------------

"==================
" Plugins for tags
"==================
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'

"=========================
" Some productivity plugs
"=========================
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'google/vim-searchindex'

"========================
" Out-of-the-World plugs
"========================
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"===================
" Language-Specific
"===================
Plug 'vim-python/python-syntax', {'for': 'python'}
Plug 'vhda/verilog_systemverilog.vim', {'for': 'verilog_systemverilog'}

"===============
" File Explorer
"===============
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'

"==================
" Working with Git
"==================
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"=========================
" Miscellaneous plugins
"=========================
Plug 'aperezdc/vim-template'
Plug 'mhinz/vim-startify'

"========
" Themes
"========
Plug 'arcticicestudio/nord-vim'

"------------------------------------------------------------------------------
call plug#end()

"
"
" ╔═══════════════════════════════════════════════════════════════════╗
" ║                                                                   ║
" ║                         General Settings                          ║
" ║                                                                   ║
" ╚═══════════════════════════════════════════════════════════════════╝
"
"
set encoding=UTF-8                                                      " ummm...many people use this?
set noerrorbells                                                        " no sounds
set noshowmode                                                          " don't show which mode vim is in
set backspace=indent,eol,start                                          " use <BS> as intended by intuition
set nocompatible
if (has("termguicolors"))                                               " Terminal colors
  set termguicolors
endif
if has('unnamedplus')                                                   " Copy to/from system clipboard
    set clipboard=unnamed,unnamedplus
else
    set clipboard=unnamed
endif
set ruler                                                               " show cursor co-ordinates
set showcmd                                                             " show commands while being typed out
set incsearch                                                           " show partial search hits
set hlsearch                                                            " highlight search results
set tabstop=4                                                           " tab width=4. PERIOD.
set shiftwidth=4                                                        " visual mode shift with >, < etc.
set expandtab                                                           " use <TAB> to insert a tab...
set guioptions-=m                                                       " remove menu bar
set guioptions-=T                                                       " remove toolbar
set cursorline                                                          " highlight line in which cursor is on
set statusline+=%{gutentags#statusline()}
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50              " cursor styles
              \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
              \,sm:block-blinkwait175-blinkoff150-blinkon175
set nu rnu                                                              " show linenumbers relative to current line
set updatetime=100                                                      " fast update time to make plugins update faster
set mouse=a                                                             " make mouse to be used in all modes
set ttyfast                                                             " fast terminal
set timeout timeoutlen=1000 ttimeoutlen=50                              " timeout for key-mappings
set laststatus=2                                                        " always show status bar
set switchbuf=useopen                                                   " use existing buffer when opening file again
set noswapfile                                                          " get rid of crap - who tf recovers a swp file?
set exrc                                                                " use local vimrcs
set secure                                                              " for local vimrc
syntax on
set background=dark                                                     " dark theme
colorscheme nord                                                        " ultimate awesomeness
set signcolumn=yes                                                      " always show sign column - so that text doesn't shift
set autoread                                                            " automatically update file if changed in another buffer
set cmdheight=2                                                         " default is too less
set splitright                                                          " splits open below and right
set splitbelow

set undofile                                                            " as many undo levels as possible
set undolevels=1000
set undoreload=10000
set undodir=~/.vim/undodir

hi clear SignColumn                                                     " put symbols in the sign column - gitgutter etc.
autocmd TermOpen * setlocal nonu nornu                                  " no linenumbers for terminals
autocmd TermOpen * startinsert

autocmd BufWritePre * %s/\s\+$//e                                       " Automatically deletes trailing whitespace and newlines at end of file on save
autocmd BufWritepre * %s/\n\+\%$//e

au BufWritePost ~/.vimrc so ~/.vimrc                                    " automatically reload vimrc when it's saved

" wildcard ignores
set wildignore+=.git,.hg,.svn,__pycache__
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class,*.pyc,*.pyo
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf,*.cbr,*.cbz
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
set wildignore+=*.swp,.lock,.DS_Store,._*
set wildignore+=tags

"
"
" ╔═══════════════════════════════════════════════════════════════════╗
" ║                                                                   ║
" ║                     Plugin-Specific Settings                      ║
" ║                                                                   ║
" ╚═══════════════════════════════════════════════════════════════════╝
"
"

"=============================
" tpope/vim-fugitive settings
"=============================
" Key mappings for essential git commands
nnoremap <silent> <leader>ga :Gwrite<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gp :Gpush<CR>
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gd :Gdiffsplit<CR>

"==============================
" scrooloose/nerdtree settings
"==============================
let g:NERDTreeWinPos = "right"
let g:NERDTreeStatusLine = -1
let g:NERDTreeRespectWildIgnore = 1
nmap <silent> <F7> :NERDTreeToggle<CR>

"===================================
" scrooloose/nerdcommenter settings
"===================================
let g:NERDSpaceDelims = 1                                               " Add spaces after comment delimiters by default
let g:NERDDefaultAlign = 'left'                                         " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDAltDelims_python = 1                                          " Set a language to use its alternate delimiters by default
let g:NERDCommentEmptyLines = 1                                         " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1                                    " Enable trimming of trailing whitespace when uncommenting
let g:NERDToggleCheckAllLines = 1                                       " Enable NERDCommenterToggle to check all selected lines is commented or not

"=======================================
" ludovicchabant/vim-gutentags settings
"=======================================
set tags=./tags,tags,~/.vimtags                                         " Where to look for tags files

"==================================
" vim-airline/vim-airline settings
"==================================
let g:airline_powerline_fonts = 1                                       " Fancy arrow symbol
let g:airline#extensions#tabline#enabled = 1                            " Show airline for tabs too
let g:airline_theme = "base16_nord"                                     " Airline theme

"============================
" majutsushi/tagbar settings
"============================
nmap <silent> <F8> :TagbarToggle<CR>

"==========================================
" nathanaelkane/vim-indent-guides settings
"==========================================
let g:indent_guides_enable_on_vim_startup = 1                           " Enable Indent-Guides on startup
let g:indent_guides_guide_size = 1                                      " Size of guide - single character gives IDE feel
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar']  " Exclude these filetypes - they become annoying

"============================
" neoclide/coc.nvim settings
"============================
" use <tab> for trigger completion and navigate to the next complete item
" credits: coc.vim README
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

let g:python3_host_prog = "~/nvim-venv/.direnv/python-3.9.0/bin/python"

"===================================
" vim-python/python-syntax settings
"===================================
let g:python_highlight_builtins = 1
let g:python_highlight_exceptions = 1
let g:python_highlight_doctests = 1
let g:python_highlight_operators = 1
let g:python_highlight_class_vars = 1
let g:python_highlight_func_calls = 1
let g:python_highlight_indent_errors = 1
let g:python_highlight_file_headers_as_comments = 1

" Local Configs
source ~/.vimrc.local
