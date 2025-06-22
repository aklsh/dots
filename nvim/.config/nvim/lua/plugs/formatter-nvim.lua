-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    c = {
      require("formatter.filetypes.c").clangformat,
    },
    cpp = {
      require("formatter.filetypes.cpp").clangformat,
    },
    css = {
      require("formatter.filetypes.css").prettierd,
    },
    html = {
      require("formatter.filetypes.html").prettierd,
    },
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
    python = {
      require("formatter.filetypes.python").black,
    },
    systemverilog = {
      function()
        -- Full specification of configurations is down below and in Vim help files
        return {
          exe = "verible-verilog-format",
          args = {
            "--inplace",
          },
          stdin = false,
        }
      end,
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
})
