require("mason").setup()
require("mason-lspconfig").setup()

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local lspconfig = require("lspconfig")

require("mason-lspconfig").setup_handlers {
	function (server_name) -- default handler
		lspconfig[server_name].setup({
			on_attach = require('plugs.nvim-lspconfig').on_attach,
		})
	end,
	["sumneko_lua"] = function()
		lspconfig.sumneko_lua.setup({
			on_attach = require('plugs.nvim-lspconfig').on_attach,
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					path = runtime_path,
					diagnostics = {
						globals = { "vim", "use", "require" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})
	end,
	["rust_analyzer"] = function()
		lspconfig.rust_analyzer.setup({
			on_attach = require('plugs.nvim-lspconfig').on_attach,
			settings = {
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
		})
	end
}
