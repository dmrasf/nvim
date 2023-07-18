return {
	"gbprod/yanky.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"kkharji/sqlite.lua",
	},
	config = function()
		vim.keymap.set("n", "<leader>y", ":Telescope yank_history<CR>")
		vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
		vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
		vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
		vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
		local mapping = require("yanky.telescope.mapping")
		require("yanky").setup({
			ring = {
				history_length = 1000,
				storage = "sqlite",
			},
			picker = {
				select = {
					action = nil,
				},
				telescope = {
					use_default_mappings = false,
					mappings = {
						i = {
							["<cr>"] = mapping.put("p"),
						},
					},
				},
			},
			system_clipboard = {
				sync_with_ring = true,
			},
			highlight = {
				on_put = true,
				on_yank = true,
				timer = 200,
			},
		})
	end,
}
