--
--
--  ╔═══════════════════════════════════════════════════════════════════╗
--  ║                                                                   ║
--  ║                       General Key Mappings                        ║
--  ║                                                                   ║
--  ╚═══════════════════════════════════════════════════════════════════╝
--
--

-- Some sanity
local options = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

-- Normal mode
map("n", "j", "gj", options)
map("n", "k", "gk", options)
map("n", "<C-j>", "<C-W><C-J>", options)
map("n", "<C-k>", "<C-W><C-K>", options)
map("n", "<C-l>", "<C-W><C-L>", options)
map("n", "<C-h>", "<C-W><C-H>", options)
map("n", "<C-Down>", "<C-W><C-J>", options)
map("n", "<C-Up>", "<C-W><C-K>", options)
map("n", "<C-Right>", "<C-W><C-L>", options)
map("n", "<C-Left>", "<C-W><C-H>", options)
map("n", "<C-[>", "<C-t>", options)
map("n", "Q", "<nop>", options)
map("n", "J", "mzJ`z", options)

-- Visual mode
map("v", ">", ">gv", options)
map("v", "<", "<gv", options)
map("v", "J", ":m '>+1<CR>gv=gv", options)
map("v", "K", ":m '>-2<CR>gv=gv", options)
