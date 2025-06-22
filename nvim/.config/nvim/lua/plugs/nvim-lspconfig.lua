local M = {}

function M.on_attach(client, bufnr)
  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })

  -- Mapping options
  local opts = { noremap = true, silent = true }

  -- Mappings
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gK", ":lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "g?", ":lua vim.lsp.buf.diagnostics()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gn", ":lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
end

return M
