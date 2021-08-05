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
glb.ttimeoutlen = 100                                                     -- timeout for key-mappings
glb.switchbuf = 'usetab'                                                  -- use existing buffer when opening file again
glb.swapfile = false                                                      -- get rid of crap - who tf recovers a swp file?
wnd.signcolumn = 'yes'                                                    -- always show sign column - so that text doesn't shift
glb.autoread = true                                                       -- automatically update file if changed in another buffer
-- buf.autoindent = true                                                     -- automatically indent lines
glb.cmdheight = 2                                                         -- default is too less
glb.splitright = true                                                     -- splits open right
glb.splitbelow = true                                                     -- splits open below
glb.showtabline = 2
glb.shortmess = 'filnxtToOFc'

buf.undofile = true                                                       -- as many undo levels as possible
buf.undolevels = 1000
glb.undoreload = 10000
glb.undodir = '/home/aklsh/.vim/undodir'

glb.background = 'dark'                                                   -- dark theme
vim.cmd('colorscheme gruvbox')                                            -- ultimate awesomeness

-- vim.cmd('autocmd BufWritePre *\(^md\)\@<! %s/\s\+$//e')
-- vim.cmd('autocmd BufWritePre *\(^md\)\@<! %s/\n\+\%$//e')

vim.cmd('autocmd BufRead,BufNewFile *.ino,*.pde,*.ide set filetype=c++')
vim.cmd('au TextYankPost * lua vim.highlight.on_yank{timeout=200}')       -- highlight on yank
-- vim.cmd('au BufNewFile,BufRead * if &ft == "" | set ft=text | endif')     -- unknown filetypes = text

glb.wildignore = [[
.git,.hg,.svn
*.aux,*.out,*.toc
*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
*.mp3,*.oga,*.ogg,*.wav,*.flac
*.eot,*.otf,*.ttf,*.woff
*.doc,*.pdf,*.cbr,*.cbz
*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
*.swp,.lock,.DS_Store,._*
]]

vim.cmd('source ~/.vimrc.local')                                                   -- Sensitive Configs
