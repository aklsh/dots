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
local cmd = vim.cmd
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local compile_path = fn.stdpath("config") .. "/lua/packer_compiled.lua"
local is_bootstrap = false

-- Install packer if not present
if fn.empty(fn.glob(install_path)) > 0 then
  is_bootstrap = true
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  cmd([[packadd packer.nvim]])
end

-- Autocompile when there's changes
cmd("autocmd BufwritePost plugins.lua PackerCompile")

require("packer").init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "single" })
    end,
    auto_clean = false,
  },
  compile_path = compile_path,
})

if is_bootstrap then
  print("==================================")
  print("    Plugins are being installed")
  print("    Wait until Packer completes,")
  print("       then restart nvim")
  print("==================================")
  return
end

return require("packer").startup(function(use)
  -- Plugin manager
  use("wbthomason/packer.nvim")

  -- Some productivity plugs
  use("tpope/vim-commentary")
  use("google/vim-searchindex")
  use("windwp/nvim-autopairs")
  use("lewis6991/impatient.nvim")
  use("direnv/direnv.vim")

  -- LSP plugs
  use("neovim/nvim-lspconfig")
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use({"j-hui/fidget.nvim", tag = "legacy"})
  use("hrsh7th/nvim-compe") -- TODO: Change to nvim-cmp
  use("folke/lsp-colors.nvim")
  use("mhartington/formatter.nvim")

  -- Language plugs
  use("lervag/vimtex")
  use("editorconfig/editorconfig-vim")
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use({ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" })
  use("simrat39/rust-tools.nvim")

  -- Navigation
  use("nvim-tree/nvim-tree.lua")
  use("nvim-tree/nvim-web-devicons")
  use("nvim-lualine/lualine.nvim")

  -- Fuzzy Finder
  use({
    "junegunn/fzf",
    run = function()
      fn["fzf#install"](0)
    end,
  })
  use("junegunn/fzf.vim")
  use("nvim-telescope/telescope.nvim")
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use("nvim-lua/popup.nvim")
  use("nvim-lua/plenary.nvim")
  use("nvim-telescope/telescope-packer.nvim")

  -- Working with Git
  use("lewis6991/gitsigns.nvim")
  use("tpope/vim-rhubarb")
  use("tpope/vim-fugitive")

  -- Themes
  use("Mofiqul/adwaita.nvim")
  use("tjdevries/colorbuddy.nvim")

  if is_bootstrap then
    require("packer").sync()
  end
end)
