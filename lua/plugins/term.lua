return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		keys = "<a-t>",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<a-t>]],
				direction = "float",
			})
		end,
	},
}
