return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "│" },
					change = { text = "│" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
			})
			vim.keymap.set("n", "]g", ":Gitsigns prev_hunk<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "[g", ":Gitsigns next_hunk<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "gm", ":Gitsigns blame_line<CR>", { noremap = true, silent = true })
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = { "<a-g>" },
		config = function()
			vim.g.lazygit_floating_window_scaling_factor = 0.8
			vim.keymap.set("n", "<a-g>", ":LazyGit<CR>", { noremap = true, silent = true })
		end,
	},
}
