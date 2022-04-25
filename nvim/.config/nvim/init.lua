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
-- Web: https://aklsh.tech
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
require('plugs.python-syntax')
require('plugs.vimtex')
require('plugs.nvim-treesitter')
require('plugs.telescope-nvim')
require('plugs.nvim-tree')
require('plugs.rust-tools')
require('plugs.matlab-vim')
require('plugs.gitsigns')

-- LSP servers
require('lsp.lua')
require('lsp.c')
require('lsp.python')
require('lsp.tex')
require('lsp.verilog')
require('lsp.arduino')
require('lsp.java')
require('lsp.rust')

-- Local configs
require('local')
require('packer_compiled')
