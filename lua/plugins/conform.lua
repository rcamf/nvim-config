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
		}
	},
	keys = {
		{
			"<leader>cf",

			function()
				require("conform").format({ async = true })
			end,
			desc = "Format file with Conform",
		}
	}
}
