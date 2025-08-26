local lspconfig = require("lspconfig")

lspconfig.vtsls.setup({
	settings = {
		typescript = {
			preferences = {
				importModuleSpecifier = "relative", -- relative imports
			},
		},
		javascript = {
			preferences = {
				importModuleSpecifier = "relative",
			},
		},
		vtsls = {
			autoUseWorkspaceTsdk = true,
			enableMoveToFileCodeAction = true,
		},
	},
})
