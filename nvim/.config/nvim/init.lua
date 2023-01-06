--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
--
-- Author: Akilesh Kannan
-- Contact: aklsh@tuta.io
-- Web: https://aklsh.me
--
-- How I configure Neovim :P
--

-- General
require('impatient')
require('plugins')
require('keymaps')
require('settings')

-- Plugin settings
require('plugs.nvim-lspconfig')
require('plugs.nvim-compe')
require('plugs.nvim-autopairs')
require('plugs.lualine')
require('plugs.vimtex')
require('plugs.nvim-treesitter')
require('plugs.telescope-nvim')
require('plugs.nvim-tree')
require('plugs.rust-tools')
require('plugs.gitsigns')
require('plugs.adwaita')
require('plugs.mason')
require('plugs.mason-lspconfig')
require('plugs.fidget')

-- LSP servers
require('lsp.mason')
-- require('lsp.lua')
-- require('lsp.c')
-- require('lsp.python')
-- require('lsp.tex')
-- require('lsp.verilog')
-- require('lsp.rust')
-- require('lsp.bash')

-- Local configs
require('local')
require('packer_compiled')
