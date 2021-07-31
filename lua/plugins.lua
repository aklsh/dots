--
--
--  ╔═══════════════════════════════════════════════════════════════════╗
--  ║                                                                   ║
--  ║                              Plugins                              ║
--  ║                                                                   ║
--  ╚═══════════════════════════════════════════════════════════════════╝
--
--

-- Some sanity
local execute = vim.api.nvim_command
local fn = vim.fn
local packer = require('packer');
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'


-- Install packer if not present
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

-- Autocompile when there's changes
vim.cmd 'autocmd BufwritePost plugins.lua PackerCompile'

require('packer').init({display = {auto_clean = false}})

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end,
    },
}

return packer.startup(function(use)
    -- Plugin manager
    use 'wbthomason/packer.nvim'

    -- Plugins for tags
    use "ludovicchabant/vim-gutentags";

    -- Some productivity plugs
    use "tpope/vim-commentary";
    use "tpope/vim-surround";
    use "google/vim-searchindex";
    use "jiangmiao/auto-pairs";

    -- LSP plugs
    use "neovim/nvim-lspconfig";
    use "nvim-lua/completion-nvim";
    use "glepnir/lspsaga.nvim";

    -- Language plugs
    use "vim-python/python-syntax";
    use "vhda/verilog_systemverilog.vim";
    use "lervag/vimtex";
    use "stevearc/vim-arduino";

    -- Navigation
    use "kyazdani42/nvim-web-devicons";
    use "kyazdani42/nvim-tree.lua";
    use "romgrk/barbar.nvim";
    use "hoob3rt/lualine.nvim";
    use "glepnir/dashboard-nvim";

    -- Fuzzy Finder
    use {"nvim-telescope/telescope.nvim",
         requires = {{'nvim-lua/popup.nvim'},
                     {'nvim-lua/plenary.nvim'}}
        };

    -- Working with Git
    use {"lewis6991/gitsigns.nvim",
         requires = {"nvim-lua/plenary.nvim"}
        };
    use "tpope/vim-fugitive";

    -- Themes
    use {"npxbr/gruvbox.nvim",
         requires = {"rktjmp/lush.nvim"}
        };
end)
