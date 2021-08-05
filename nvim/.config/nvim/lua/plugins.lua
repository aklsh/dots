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
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'


-- Install packer if not present
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

-- Autocompile when there's changes
vim.cmd 'autocmd BufwritePost plugins.lua PackerCompile'

require('packer').init({display = {auto_clean = false}})

require('packer').init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end,
    },
}

return require('packer').startup(
    function(use)
        -- Plugin manager
        use "wbthomason/packer.nvim"

        -- Some productivity plugs
        use "tpope/vim-commentary";
        use "tpope/vim-surround";
        use "google/vim-searchindex";
        use "windwp/nvim-autopairs";

        -- LSP plugs
        use "neovim/nvim-lspconfig";
        use "hrsh7th/nvim-compe";

        -- Language plugs
        use "vim-python/python-syntax";
        use "vhda/verilog_systemverilog.vim";
        use "lervag/vimtex";
        use "stevearc/vim-arduino";
        use "editorconfig/editorconfig-vim";

        -- Navigation
	use "preservim/nerdtree";
	use "ryanoasis/vim-devicons";
        use "hoob3rt/lualine.nvim";
        use "mhinz/vim-startify";

        -- -- Fuzzy Finder
        -- use {"nvim-telescope/telescope.nvim",
        --      requires = {{"nvim-lua/popup.nvim"},
        --                  {"nvim-lua/plenary.nvim"}}
        --     };

        -- Working with Git
        use "airblade/vim-gitgutter";
        use "tpope/vim-fugitive";

        -- Themes
        use "morhetz/gruvbox";
    end
)
