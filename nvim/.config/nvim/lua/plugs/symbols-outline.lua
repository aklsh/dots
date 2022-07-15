local g = vim.g
local map = vim.api.nvim_set_keymap
local options = {noremap = true, silent = true}

map('n', '<F8>', ':SymbolsOutline<CR>', options)

g.symbols_outline = {
    position = 'left'
}
