vim.lsp.config["ts_ls"] = {
	settings = {
		preferences = {
			importModuleSpecifier = "relative",
		},
	},
}
vim.lsp.enable("ts_ls")
vim.lsp.config["lua_ls"] = {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "it", "describe", "before_each", "after_each" },
			},
		},
	},
}
vim.lsp.enable("lua_ls")
