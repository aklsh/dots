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
	use "tpope/vim-eunuch";
        use "google/vim-searchindex";
        use "windwp/nvim-autopairs";
	use "RishabhRD/popfix";
	use "RishabhRD/nvim-cheat.sh";
	use "nathom/filetype.nvim";

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

        -- Navigation
        use "preservim/nerdtree";
        use "ryanoasis/vim-devicons";
        use "hoob3rt/lualine.nvim";
        use "mhinz/vim-startify";
	use 'sunjon/shade.nvim';

        -- Fuzzy Finder
        use {"junegunn/fzf", run = function () vim.fn['fzf#install'](0)	end };
        use "junegunn/fzf.vim";

        -- Working with Git
        use "airblade/vim-gitgutter";
        use "tpope/vim-fugitive";

        -- Themes
        use "morhetz/gruvbox";
	use {"rose-pine/neovim", as = 'rose-pine'};
	use "arcticicestudio/nord-vim";
	use {"dracula/vim", as = 'dracula'};
    end
)
