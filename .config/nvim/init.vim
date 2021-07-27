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
" Contact: aklsh@tuta.io
" Web: https://aklsh.now.sh
"
" How I configure (Neo)Vim :P
"

" check if vim-plug exists; if not, install
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
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
Plug 'scrooloose/nerdcommenter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'google/vim-searchindex'

"========================
" Out-of-the-World plugs
"========================
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'mileszs/ack.vim'

"===================
" Language-Specific
"===================
Plug 'vim-python/python-syntax', {'for': 'python'}
Plug 'vhda/verilog_systemverilog.vim', {'for': 'verilog_systemverilog'}
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'stevearc/vim-arduino'

"============================
" File Explorer & Statusline
"============================
Plug 'ryanoasis/vim-devicons'
Plug 'hoob3rt/lualine.nvim'
Plug 'preservim/nerdtree'

"==================
" Working with Git
"==================
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"========
" Themes
"========
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'

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
set noerrorbells                                                        " no sounds

if (has("termguicolors"))                                               " Terminal colors
  set termguicolors
endif

if has('unnamedplus')                                                   " Copy to/from system clipboard
    set clipboard=unnamed,unnamedplus
else
    set clipboard=unnamed
endif

set ruler                                                               " show cursor co-ordinates
set incsearch                                                           " show partial search hits
set nohlsearch                                                          " don't highlight search results
set tabstop=4                                                           " tab width=4. PERIOD.
set shiftwidth=4                                                        " visual mode shift with >, < etc.
set expandtab                                                           " convert Tabs to eqvt spaces
set guioptions-=m                                                       " remove menu bar
set guioptions-=T                                                       " remove toolbar
set cursorline                                                          " highlight line in which cursor is on
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50              " cursor styles
              \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
              \,sm:block-blinkwait175-blinkoff150-blinkon175
set nu rnu                                                              " show linenumbers relative to current line
set updatetime=100                                                      " fast update time to make plugins update faster
set mouse=a                                                             " allow mouse to be used in all modes
set timeout timeoutlen=1000 ttimeoutlen=50                              " timeout for key-mappings
set laststatus=2                                                        " always show status bar
set switchbuf=useopen                                                   " use existing buffer when opening file again
set noswapfile                                                          " get rid of crap - who tf recovers a swp file?
set exrc                                                                " use local vimrcs
set secure                                                              " for local vimrc
set background=dark                                                     " dark theme
colorscheme gruvbox                                                     " ultimate awesomeness
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
autocmd TermOpen * startinsert                                          " start terminal in insert mode

function! StripTrailingLinesAndSpaces()
    " exclude md filetypes
    if &ft =~ 'markdown'
        return
    endif
    %s/\s\+$//e
    %s/\n\+\%$//e
endfun

au BufRead,BufNewFile *.ino,*.pde,*.ide set filetype=c++
autocmd BufWritePre * call StripTrailingLinesAndSpaces()                " Automatically deletes trailing whitespace and newlines at end of file on save

set wildignore+=.git,.hg,.svn,__pycache__                               " wildcard ignores in file explorers
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class,*.pyc,*.pyo
set wildignore+=*.ai,*.bmp,*.gif,*.psd,*.webp,*.pdf
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.cbr,*.cbz
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
set wildignore+=*.swp,.lock,.DS_Store,._*
set wildignore+=tags

source ~/.vimrc.local                                                   " Sensitive Configs

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
nnoremap <silent> <leader>gc :Git commit<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gs :Git<CR>
nnoremap <silent> <leader>gb :Git blame<CR>
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

" ======================
" neovim/nvim-lspconfig
" ======================
lua << EOF
    local nvim_lsp = require('lspconfig')
    local on_attach = function(client, bufnr)
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    end

    -- Use a loop to conveniently both setup defined servers
    -- and map buffer local keybindings when the language server attaches
    local servers = { "pyright", "texlab", "ccls" }
    for _, lsp in ipairs(servers) do
      nvim_lsp[lsp].setup { on_attach = on_attach }
    end
EOF

" Use <Tab> and <S-Tab> to navigate through popup menu
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

set completeopt=menuone,noselect,preview                                " Set completeopt to have a better completion experience

set shortmess+=c                                                        " Avoid showing message extra message when using completion

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
let g:python3_host_prog = '~/.vim/.direnv/python-3.9.5/bin/python3'

"==========================
" mileszs/ack.vim settings
"==========================
function! Find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! -nargs=1 Ag execute "Ack! <args> " . Find_git_root()

"========================
" lervag/vimtex settings
"========================
let g:tex_flavor = "xelatex"
let g:vimtex_view_method = "general"
let g:vimtex_view_general_viewer = "evince"
let g:vimtex_view_automatic = 1
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_syntax_enabled = 0
let g:vimtex_indent_enabled = 0                                         " Don't let vimtex autoindent things
let g:latex_indent_enabled = 0
let g:vimtex_format_enabled = 1                                         " Make vimtex recognise end-of-line comments when using 'gq'.
let g:vimtex_toc_show_preamble = 0                                      " Don't show preamble in ToC

"===============================
" hoob3rt/lualine.nvim settings
"===============================
lua << EOF
    require'lualine'.setup {
      options = {
        icons_enabled = true,
        theme = 'gruvbox',
        component_separators = "",
        section_separators = "",
        disabled_filetypes = {}
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff'},
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {''},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      extensions = {'fugitive', 'nerdtree'}
    }
EOF
