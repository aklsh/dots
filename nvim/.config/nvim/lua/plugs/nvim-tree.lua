local g = vim.g
local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

g.nvim_tree_refresh_wait = 500

map("n", "<F7>", ":NvimTreeToggle<CR>", options)
map("n", "<S-r>", ":NvimTreeRefresh<CR>", options)

require("nvim-tree").setup({
  disable_netrw = false,
  respect_buf_cwd = true,
  hijack_netrw = true,
  open_on_tab = true,
  hijack_cursor = false,
  update_cwd = false,
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
    highlight_git = false,
    group_empty = true,
  },
  actions = {
    open_file = {
      window_picker = {
        enable = true,
      },
      resize_window = true,
    },
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = false,
    custom = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    adaptive_size = true,
    side = "right",
    number = false,
    relativenumber = false,
    signcolumn = "no",
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
})
