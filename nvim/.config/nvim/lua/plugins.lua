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
local compile_path = fn.stdpath('config')..'/lua/packer_compiled.lua'

-- Install packer if not present
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

-- Autocompile when there's changes
vim.cmd('autocmd BufwritePost plugins.lua PackerCompile')

require('packer').init({display = {auto_clean = false}})

require('packer').init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end,
    },
    compile_path = compile_path
}

return require('packer').startup(
    function(use)
        -- Plugin manager
        use "wbthomason/packer.nvim";

        -- Some productivity plugs
        use "tpope/vim-commentary";
	    use "tpope/vim-eunuch";
	    use "google/vim-searchindex";
    	use "windwp/nvim-autopairs";
    	use "nathom/filetype.nvim";
    	use "lewis6991/impatient.nvim";
    	use "chrisbra/csv.vim";

        -- LSP plugs
    	use "neovim/nvim-lspconfig";
    	use "hrsh7th/nvim-compe"; -- TODO: Change to nvim-cmp
    	use "github/copilot.vim";

        -- Language plugs
    	use "vim-python/python-syntax";
    	use "lervag/vimtex";
    	use "stevearc/vim-arduino";
    	use "editorconfig/editorconfig-vim";
    	use {"nvim-treesitter/nvim-treesitter", run = ':TSUpdate'};
    	use "simrat39/rust-tools.nvim";
    	use "MortenStabenau/matlab-vim";

        -- Navigation
    	use "kyazdani42/nvim-tree.lua";
    	use "kyazdani42/nvim-web-devicons";
    	use "hoob3rt/lualine.nvim";

        -- Fuzzy Finder
    	use {"junegunn/fzf", run = function () vim.fn["fzf#install"](0)	end };
    	use "junegunn/fzf.vim";
    	use "nvim-telescope/telescope.nvim";
    	use {"nvim-telescope/telescope-fzf-native.nvim", run = 'make' };
    	use "nvim-lua/popup.nvim";
    	use "nvim-lua/plenary.nvim";
    	use "nvim-telescope/telescope-packer.nvim";

    	-- Working with Git
    	use "lewis6991/gitsigns.nvim";
    	use "tpope/vim-fugitive";

    	-- Themes
    	use "morhetz/gruvbox";
    end
)
