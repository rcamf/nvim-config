require("lsp.vtsls")

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
