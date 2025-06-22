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
require("impatient")
require("plugins")
require("keymaps")
require("settings")

-- Plugin settings
require("plugs.nvim-lspconfig")
require("plugs.nvim-cmp")
require("plugs.nvim-autopairs")
require("plugs.lualine")
require("plugs.vimtex")
require("plugs.nvim-treesitter")
require("plugs.telescope-nvim")
require("plugs.nvim-tree")
require("plugs.gitsigns")
require("plugs.adwaita")
require("plugs.mason")
require("plugs.fidget")
require("plugs.formatter-nvim")

-- Local configs
require("local")
require("packer_compiled")
