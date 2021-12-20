require('lspconfig').arduino_language_server.setup({
	cmd =  {
	-- Required
	"arduino-language-server",
	"-cli-config", "~/.arduino15/arduino-cli.yaml",
	-- Optional
	"-cli", "~/.local/bin/arduino-cli"},
	on_attach = require('plugs.nvim-lspconfig').on_attach })
