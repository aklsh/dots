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
filetype off


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
nnoremap > <C-]>
nnoremap < <C-T>
nnoremap <leader>> <C-W><C-]>
nnoremap <leader>< <C-W><C-T>
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
tnoremap <leader><Esc> <C-w>N
nnoremap <leader>nt :FloatermNew<CR>
nnoremap <leader>t :FloatermToggle<CR>
vnoremap > >gv
vnoremap < <gv
nnoremap <silent> <leader>, :noh<CR>
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
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'majutsushi/tagbar'

"=========================
" Some productivity plugs
"=========================
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vuciv/vim-bujo'


"========================
" Out-of-the-World plugs
"========================
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mbbill/undotree'

"===================
" Language-Specific
"===================
Plug 'vhda/verilog_systemverilog.vim'

"===============
" File Explorer
"===============
Plug 'ryanoasis/vim-devicons'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}

"==============
" Fuzzy finder
"==============
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"==================
" Working with Git
"==================
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-conflicted'

"=======================
" HTML and CSS specific
"=======================
Plug 'cakebaker/scss-syntax.vim'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-liquid'

"=========================
" Miscellaneous plugins
"=========================
Plug 'ntpeters/vim-better-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'digitaltoad/vim-jade'
Plug 'aperezdc/vim-template'
Plug 'voldikss/vim-floaterm'
Plug 'mhinz/vim-startify'
Plug 'direnv/direnv.vim'

"========
" Themes
"========
Plug 'morhetz/gruvbox'
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
set showmode                                                            " always show which mode vim is in
set backspace=indent,eol,start                                          " use <BS> as intended by intuition
set ruler                                                               " show cursor co-ordinates
set showcmd                                                             " show commands while being typed out
set incsearch                                                           " show partial search hits
set hlsearch                                                            " highlight search results
set tabstop=4                                                           " tab width=4. PERIOD.
set shiftwidth=4                                                        " visual mode shift with >, < etc.
set expandtab                                                           " use <TAB> to insert a tab...
set guioptions-=m                                                       " remove menu bar
set guioptions-=T                                                       " remove toolbar
set guioptions-=r                                                       " remove right-hand scroll bar
set guioptions-=L                                                       " remove left-hand scroll bar
set cursorline                                                          " highlight line in which cursor is on
set guicursor=n:blinkon0                                                " don't blink cursor in normal mode
set nu rnu                                                              " show linenumbers relative to current line
set updatetime=100                                                      " fast update time to make plugins update faster
set mouse=a                                                             " make mouse to be used in all modes
set autoread                                                            " automatically update file if changed in another buffer
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

set undofile                                                            " as many undo levels as possible
set undolevels=1000
set undoreload=10000
set undodir=~/.vim/undodir

hi clear SignColumn                                                     " put symbols in the sign column - gitgutter etc.
autocmd TermOpen * setlocal nonu nornu                              " no linenumbers for terminals
autocmd TermOpen * startinsert

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

"===================================
" scrooloose/nerdcommenter settings
"===================================
let g:NERDSpaceDelims = 1                                               " Add spaces after comment delimiters by default
let g:NERDDefaultAlign = 'left'                                         " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDAltDelims_python = 1                                          " Set a language to use its alternate delimiters by default
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }   " Add your own custom formats or override the defaults
let g:NERDCommentEmptyLines = 1                                         " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1                                    " Enable trimming of trailing whitespace when uncommenting
let g:NERDToggleCheckAllLines = 1                                       " Enable NERDCommenterToggle to check all selected lines is commented or not

"==================================
" vim-airline/vim-airline settings
"==================================
let g:airline_powerline_fonts = 1                                       " Fancy arrow symbol
let g:airline#extensions#tabline#enabled = 1                            " Show airline for tabs too
let g:airline_theme = "base16_nord"                                     " Airline theme

"==================================
" jistr/vim-nerdtree-tabs settings
"==================================
nmap <silent> <F7> :CHADopen<CR>
let g:nerdtree_tabs_open_on_gui_startup = 0                             " To have NERDTree NOT open on startup

"=============================
" xolox/vim-easytags settings
"=============================
set tags=./tags,tags,~/.vimtags                                         " Where to look for tags files

" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

"============================
" majutsushi/tagbar settings
"============================
nmap <silent> <F8> :TagbarToggle<CR>

"=================================
" airblade/vim-gitgutter settings
"=================================
let g:airline#extensions#hunks#non_zero_only = 1                        " In vim-airline, only display 'hunks' if the diff is non-zero

"===============================
" Raimondi/delimitMate settings
"===============================
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
  au FileType python let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
augroup END

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

"================================
" voldikss/vim-floaterm settings
"================================
let g:floaterm_height = 0.5
let g:floaterm_width = 0.75

"============================
" junegunn/goyo.vim settings
"============================
let g:goyo_width = 120
let g:goyo_height = 90
let g:goyo_linenr = 1

"============================
" junegunn/fzf.vim settings
"============================
nnoremap <leader><space> :FZF<CR>

"=========================================
" ntpeters/vim-better-whitespace settings
"=========================================
nnoremap <silent> <leader>sw :StripWhitespace<CR>
nnoremap <silent> <leader>SW :StripWhitespace!<CR>

"==========================
" mbbill/undotree settings
"==========================
nnoremap <silent> <leader>u :UndotreeToggle<CR>

" Local Configs
source ~/.vimrc.local
