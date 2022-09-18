local map = vim.api.nvim_set_keymap
local options = {noremap = true, silent = true}

local actions = require('telescope.actions')
local sorters = require('telescope.sorters')
local previewers = require('telescope.previewers')

require("telescope").setup {
  defaults = {
    initial_mode = "insert",
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "-u",
      "--hidden",
      "--glob=!.git/",
    },
    mappings = {
      i = {
	["<Esc>"] = actions.close
      },
    },
    prompt_prefix = "λ ",
    scroll_strategy = "limit",
    layout_config = {
      horizontal = {
        mirror = false
      },
      vertical = {
        mirror = false
      }
    },
    pickers = {
      find_files = {
        find_command = { "fd", "--type=file", "--hidden", "--smart-case", "--strip-cwd-prefix" }
      }
    },
    path_display = {"absolute"},
    dynamic_preview_title = true,
    file_sorter = sorters.get_fuzzy_file,
    file_ignore_patterns = {"^.git", "^.ccls-cache"},
    generic_sorter = sorters.get_generic_fuzzy_sorter,
    color_devicons = true,
    use_less = true,
    set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('packer')
require('telescope').load_extension('dap')

-- mappings
map("n", "<Leader><Space>", ":Telescope live_grep<CR>", options)
map("n", "<Leader>tp", ":Telescope packer<CR>", options)
map("n", "<leader>f", ":lua require('plugs.telescope-extensions.files').find_project_files()<CR>", options)
map("n", "<Leader>bc", ":lua require('plugs.telescope-extensions.delta').my_git_bcommits()<CR>", options)
map("n", "<Leader>gc", ":lua require('plugs.telescope-extensions.delta').my_git_commits()<CR>", options)
map("n", "<Leader>bf", ":Telescope current_buffer_fuzzy_find<CR>", options)
