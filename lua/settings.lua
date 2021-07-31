--
--
-- ╔═══════════════════════════════════════════════════════════════════╗
-- ║                                                                   ║
-- ║                         General Settings                          ║
-- ║                                                                   ║
-- ╚═══════════════════════════════════════════════════════════════════╝
--
--

-- Some sanity
local glb = vim.o
local wnd = vim.wo
local buf = vim.bo


glb.errorbells = false                                                    -- no sounds
glb.termguicolors = true                                                  -- Terminal colors
glb.clipboard = [[unnamed,unnamedplus]]                                   -- Copy to/from system clipboard
glb.ruler = true                                                          -- show cursor co-ordinates
glb.incsearch = true                                                      -- show partial search hits
glb.hlsearch = false                                                      -- don't highlight search results
buf.tabstop = 4                                                           -- tab width=4. PERIOD.
buf.shiftwidth = 4                                                        -- visual mode shift with >, < etc.
buf.expandtab = true                                                      -- convert Tabs to eqvt spaces
wnd.cursorline = true                                                     -- highlight line in which cursor is on
wnd.nu = true                                                             -- show absolute current line number
wnd.rnu = true                                                            -- show other linenumbers relative to current line
glb.updatetime = 100                                                      -- fast update time to make plugins update faster
glb.mouse = 'a'                                                           -- allow mouse to be used in all modes
glb.timeoutlen = 1000
glb.ttimeoutlen = 100                                                      -- timeout for key-mappings
glb.switchbuf = 'usetab'                                                  -- use existing buffer when opening file again
glb.swapfile = false                                                      -- get rid of crap - who tf recovers a swp file?
wnd.signcolumn = true                                                     -- always show sign column - so that text doesn't shift
glb.autoread = true                                                       -- automatically update file if changed in another buffer
buf.autoindent = true                                                     -- automatically indent lines
glb.cmdheight=2                                                           -- default is too less
glb.splitright = true                                                     -- splits open right
glb.splitbelow = true                                                     -- splits open below

buf.undofile = true                                                       -- as many undo levels as possible
buf.undolevels = 1000
glb.undoreload = 10000
glb.undodir = '~/.vim/undodir'

glb.background = 'dark'                                                   -- dark theme
colorscheme gruvbox                                                       -- ultimate awesomeness

hi clear signcolumn                                                       -- clear signcolumn - o/w will get weird bg on signcolumns

autocmd TermOpen * setlocal nonu nornu                                    -- no linenumbers for terminals
autocmd TermOpen * startinsert                                            -- start terminal in insert mode

function! StripTrailingLinesAndSpaces()
    -- exclude md filetypes
    if &ft =~ 'markdown'
        return
    endif
    %s/\s\+$//e
    %s/\n\+\%$//e
endfun

au BufRead,BufNewFile *.ino,*.pde,*.ide set filetype=c++
autocmd BufWritePre * call StripTrailingLinesAndSpaces()                -- Automatically deletes trailing whitespace and newlines at end of file on save

set wildignore+=.git,.hg,.svn,__pycache__                               -- wildcard ignores in file explorers
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

source ~/.vimrc.local                                                   -- Sensitive Configs
