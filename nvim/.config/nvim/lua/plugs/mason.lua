local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

vim.lsp.config("lua_ls", {
  on_attach = require("plugs.nvim-lspconfig").on_attach,
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if path ~= vim.fn.stdpath("config") and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc")) then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using (most
        -- likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Tell the language server how to find Lua modules same way as Neovim
        -- (see `:h lua-module-load`)
        path = runtime_path,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          -- Depending on the usage, you might want to add additional paths
          -- here.
          -- '${3rd}/luv/library'
          -- '${3rd}/busted/library'
        },
        -- Or pull in all of 'runtimepath'.
        -- NOTE: this is a lot slower and will cause issues when working on
        -- your own configuration.
        -- See https://github.com/neovim/nvim-lspconfig/issues/3189
        -- library = {
        --   vim.api.nvim_get_runtime_file('', true),
        -- }
      },
    })
  end,
  settings = {
    Lua = {},
  },
})

vim.lsp.config("pyright", {
  on_attach = require("plugs.nvim-lspconfig").on_attach,
})

vim.lsp.config("texlab", {
  on_attach = require("plugs.nvim-lspconfig").on_attach,
})

vim.lsp.config("svlangserver", {
  on_attach = require("plugs.nvim-lspconfig").on_attach,
  settings = {
    systemverilog = {
      includeIndexing = { "*.{v,vh,sv,svh}", "**/*.{v,vh,sv,svh}" },
      libraryIndexing = { "*.{v,vh,sv,svh}", "**/*.{v,vh,sv,svh}" },
      linter = { "verilator" },
      launchConfiguration = { "verilator -sv -Wall --lint-only" },
      formatCommand = { "verible-verilog-format" },
    },
  },
})

vim.diagnostic.config({
  virtual_text = true,
})

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "pyright", "texlab", "svlangserver", "clangd" },
  automatic_enable = true,
})
