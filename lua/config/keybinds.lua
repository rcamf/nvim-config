vim.keymap.set("n", "grs", function()
	vim.lsp.buf.code_action({
		context = { only = { "source" } },
	})
end, { noremap = true, silent = true, desc = "Run source code action" })
