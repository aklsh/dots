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
require('plugins')
require('keymaps')
require('settings')

-- Plugin settings
require('plugs.nvim-lspconfig')
require('plugs.nvim-compe')
require('plugs.nvim-autopairs')
require('plugs.lualine')
require('plugs.nerdtree')
require('plugs.python-syntax')
require('plugs.vim-gitgutter')
require('plugs.vim-startify')
require('plugs.vimtex')

-- LSP servers
require('lsp.lua')
require('lsp.c')
require('lsp.python')
require('lsp.tex')
require('lsp.svls')

-- Local configs
require('local')
