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
" Web: https://aklsh.tech
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
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'google/vim-searchindex'
Plug 'jiangmiao/auto-pairs'

"===========
" LSP plugs
"===========
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

"================
" Language plugs
"================
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
Plug 'mhinz/vim-startify'

"==============
" Fuzzy Finder
"==============
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"==================
" Working with Git
"==================
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"========
" Themes
"========
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
set termguicolors                                                       " Terminal colors
set clipboard=unnamed,unnamedplus                                       " Copy to/from system clipboard
set ruler                                                               " show cursor co-ordinates
set incsearch                                                           " show partial search hits
set nohlsearch                                                          " don't highlight search results
set tabstop=4                                                           " tab width=4. PERIOD.
set shiftwidth=4                                                        " visual mode shift with >, < etc.
set expandtab                                                           " convert Tabs to eqvt spaces
set cursorline                                                          " highlight line in which cursor is on
set nu rnu                                                              " show linenumbers relative to current line
set updatetime=100                                                      " fast update time to make plugins update faster
set mouse=a                                                             " allow mouse to be used in all modes
set timeout timeoutlen=1000 ttimeoutlen=50                              " timeout for key-mappings
set laststatus=2                                                        " always show status bar
set switchbuf=useopen                                                   " use existing buffer when opening file again
set noswapfile                                                          " get rid of crap - who tf recovers a swp file?
set signcolumn=yes                                                      " always show sign column - so that text doesn't shift
set autoread                                                            " automatically update file if changed in another buffer
set autoindent                                                          " automatically indent lines
set cmdheight=2                                                         " default is too less
set splitright                                                          " splits open right
set splitbelow                                                          " splits open below
set exrc                                                                " use local vimrcs
set secure                                                              " for local vimrc

set undofile                                                            " as many undo levels as possible
set undolevels=1000
set undoreload=10000
set undodir=~/.vim/undodir

set background=dark                                                     " dark theme
colorscheme gruvbox                                                     " ultimate awesomeness

hi clear signcolumn                                                     " clear signcolumn - o/w will get weird bg on signcolumns

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

"=======================================
" ludovicchabant/vim-gutentags settings
"=======================================
set tags=./tags,tags,~/.vimtags                                         " Where to look for tags files

"============================
" majutsushi/tagbar settings
"============================
nmap <silent> <F8> :TagbarToggle<CR>

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

set completeopt=menuone,noselect                                        " Set completeopt to have a better completion experience
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
let g:python3_host_prog = '/home/aklsh/.vim/.direnv/python-3.9.5/bin/python3'

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

"=============================
" mhinz/vim-startify settings
"=============================
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [
    \ { 'type': 'files'     },
    \ { 'type': 'sessions'  },
    \ { 'type': 'bookmarks' },
    \ { 'type': 'commands'  },
    \ ]
let  g:startify_bookmarks =  [
    \ {'d': '~/dots' },
    \ {'w': '~/Personal/website'},
    \ {'s': '~/Personal/startpage'}
    \ ]
let g:startify_files_number = 5
let g:startify_commands = [
    \ {'ch': ['Health Check', ':checkhealth']},
    \ {'ps': ['Plugins status', ':PlugStatus']},
    \ {'pu': ['Update vim plugins',':PlugUpdate | PlugUpgrade']},
    \ {'h': ['Help', ':help']},
    \ ]
let g:startify_custom_header = [
            \'',
            \'   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
            \'   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
            \'   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
            \'   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
            \'   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
            \'   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
            \'',
            \'',
    \ ]

function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction
