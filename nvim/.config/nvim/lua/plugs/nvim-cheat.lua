local options = {noremap = true, silent = true}
local map = vim.api.nvim_set_keymap

map('n', '<Leader>c', ':Cheat<CR>', options)
