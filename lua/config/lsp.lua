local ts_ls = require("lsp.ts_ls")

vim.lsp.config["ts_ls"] = ts_ls

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
