-- Set header
require('alpha.themes.dashboard').section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}

-- Set menu
require('alpha.themes.dashboard').section.buttons.val = {
    require('alpha.themes.dashboard').button( "e", "  New file", ":ene <BAR> startinsert <CR>"),
    require('alpha.themes.dashboard').button( "r", "  Recent", ":Telescope oldfiles<CR>"),
    require('alpha.themes.dashboard').button( "s", "  Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    require('alpha.themes.dashboard').button( "ch", "⛨  Check Health", ":checkhealth<CR>"),
    require('alpha.themes.dashboard').button( "q", "  Quit NVIM", ":qa<CR>"),
}

require('alpha.themes.dashboard').section.footer.val = require'alpha.fortune'()

-- Send config to alpha
require('alpha').setup(require('alpha.themes.dashboard').opts)

-- Disable folding on alpha buffer
vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
