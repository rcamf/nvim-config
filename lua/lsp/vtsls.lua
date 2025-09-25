vim.lsp.config("vtsls", {
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

vim.lsp.enable("vtsls")
