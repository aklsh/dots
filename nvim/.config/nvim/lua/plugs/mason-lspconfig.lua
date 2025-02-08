local servers = { "texlab", "rust_analyzer", "pyright", "lua_ls" }

-- Ensure the servers above are installed
require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = false,
})
