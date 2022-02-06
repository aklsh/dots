require('lspconfig').rust_analyzer.setup {
    on_attach = require('plugs.nvim-lspconfig').on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importMergeBehavior = "last",
                importPrefix = "by_self",
            },
            cargo = {
              loadOutDirsFromCheck = true
            },
            procMacro = {
              enable = true
            },
            checkOnSave = {
                command = "clippy"
            },
		}
	}
}
