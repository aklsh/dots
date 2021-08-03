local g = vim.g
local options = {noremap = true, silent = true}
local map = vim.api.nvim_set_keymap

map('n', '<F7>', ':NERDTreeToggle<CR>', options)

g.NERDTreeWinPos = "right"
g.NERDTreeStatusLine = -1
g.NERDTreeRespectWildIgnore = 1
