local g = vim.g
local map = vim.api.nvim_set_keymap
local options = {noremap = true, silent = true}

g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_root_folder_modifier = ':~'
g.nvim_tree_add_trailing = 0
g.nvim_tree_group_empty = 1
g.nvim_tree_disable_window_picker = 1
g.nvim_tree_icon_padding = ' '
g.nvim_tree_respect_buf_cwd = 1
g.nvim_tree_create_in_closed_folder = 0
g.nvim_tree_refresh_wait = 500

map('n', '<F7>', ':NvimTreeToggle<CR>', options)
map('n', '<S-r>', ':NvimTreeRefresh<CR>', options)
vim.cmd('highlight NvimTreeFolderIcon guibg=blue')

require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'right',
    auto_resize = true,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = "no"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}