require('lspconfig').rust_analyzer.setup{ on_attach = require('plugs.nvim-lspconfig').on_attach,
        				  settings = { ["rust-analyzer"] =
					  		{ checkOnSave =
								{ command = "clippy" },
							}
						}
					}
