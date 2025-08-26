return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			["python"] = { "black" },
			["typescript"] = { "prettierd" },
			["javascript"] = { "prettierd" },
			["json"] = { "prettierd" },
			["html"] = { "prettierd" },
			["css"] = { "prettierd" },
			["lua"] = { "stylua" },
			["markdown"] = { "prettierd" },
			["yaml"] = { "prettierd" },
			["typescriptreact"] = { "prettierd" },
			["javascriptreact"] = { "prettierd" },
			["vue"] = { "prettierd" },
			["scss"] = { "prettierd" },
			["less"] = { "prettierd" },
			["xml"] = { "prettierd" },
			["graphql"] = { "prettierd" },
			["svelte"] = { "prettierd" },
			["rust"] = { "rustfmt" },
			["java"] = { "google-java-format" },
			["c"] = { "clang-format" },
			["h"] = { "clang-format" },
			["cpp"] = { "clang-format" },
		},
	},
	keys = {
		{
			"<leader>cf",

			function()
				require("conform").format({ async = true })
			end,
			desc = "Format file with Conform",
		},
	},
}
