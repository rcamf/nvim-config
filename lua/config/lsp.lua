vim.lsp.config['ts_ls'] = {
	settings = {
		preferences = {
			importModuleSpecifier = "relative"
		}
	}
}
vim.lsp.enable('ts_ls')

