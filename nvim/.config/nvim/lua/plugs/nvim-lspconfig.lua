local nvim_lsp = require('lspconfig')

local M = {}

function M.on_attach(client, bufnr)
  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mapping options
  local opts = { noremap=true, silent=true }

  -- Mappings
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  buf_set_keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gK', ':lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'g?', ':lua vim.lsp.buf.diagnostics()<CR>', opts)
  buf_set_keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gn', ':lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
end

return M
