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
local g = vim.g
local glb = vim.o
local wnd = vim.wo
local buf = vim.bo
local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd

glb.errorbells = false -- no sounds
glb.termguicolors = true -- Terminal colors
glb.clipboard = [[unnamed,unnamedplus]] -- Copy to/from system clipboard
glb.ruler = true -- show cursor co-ordinates
glb.incsearch = true -- show partial search hits
glb.hlsearch = false -- don't highlight search results
buf.tabstop = 4 -- tab width=4. PERIOD.
buf.shiftwidth = 4 -- visual mode shift with >, < etc.
buf.expandtab = true -- convert Tabs to eqvt spaces
wnd.cursorline = true -- highlight line in which cursor is on
wnd.nu = true -- show absolute current line number
wnd.rnu = true -- show other linenumbers relative to current line
glb.updatetime = 100 -- fast update time to make plugins update faster
glb.mouse = "a" -- allow mouse to be used in all modes
glb.ttimeoutlen = 100 -- timeout for keycode sequences
glb.switchbuf = "usetab" -- use existing buffer when opening file again
glb.swapfile = false -- get rid of crap - who tf recovers a swp file?
wnd.signcolumn = "yes" -- always show sign column - so that text doesn't shift
glb.autoread = true -- automatically update file if changed in another buffer
glb.cmdheight = 2 -- default is too less
glb.splitright = true -- splits open right
glb.splitbelow = true -- splits open below
glb.shortmess = "filnxtToOFc"
glb.fillchars = "stl: " -- current window statusline fill character

buf.undofile = true -- as many undo levels as possible
buf.undolevels = 1000
glb.undoreload = 10000
glb.undodir = "/home/aklsh/.vim/undodir"

glb.background = "dark" -- dark theme
cmd.colorscheme("adwaita") -- ultimate awesomeness

-- Remove whitespace on save
autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    if buf.filetype ~= "markdown" then
      cmd([[%s/\s\+$//e]])
    end
  end,
})

-- Automatically format on save
autocmd("BufWritePost", {
  pattern = "*",
  command = "FormatWrite",
})

-- Highlight on yank
autocmd("TextYankPost", {
  pattern = "*",
  command = "lua vim.highlight.on_yank{timeout=200}",
})

-- unknown filetypes = text
autocmd({"BufNewFile", "BufEnter"}, {
  pattern = "*",
  command = "if &filetype == '' | setlocal ft=text | endif",
})

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

g.loaded_ruby_provider = 1
g.loaded_perl_provider = 1
g.loaded_python_provider = 1

g.loaded_gzip = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1

g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_2html_plugin = 1

g.loaded_matchit = 1
g.loaded_matchparen = 1
g.loaded_logiPat = 1
g.loaded_rrhelper = 1

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1
