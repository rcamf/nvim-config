return {
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-h>"] = "which_key",
						},
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case",
					},
				},
			})
			require("telescope").load_extension("fzf")
			require('telescope').load_extension("packagescript")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {
				desc = "Find Files",
			})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {
				desc = "Live Grep",
			})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {
				desc = "Find Buffers",
			})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {
				desc = "Find Help Tags",
			})
			vim.keymap.set("n", "<leader>fps", require('telescope').extensions.packagescript.scripts, {
				desc = "Find package json scripts in cwd or current buffer directory"
			})
		end,
	},
}
