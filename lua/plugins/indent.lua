return {
	{
		"shellRaining/hlchunk.nvim",
		event = { "UIEnter" },
		init = function()
			require("hlchunk").setup({
				chunk = {
					enable = true,
					use_treesitter = true,
					chars = {
						horizontal_line = "─",
						vertical_line = "│",
						left_top = "┌",
						left_bottom = "└",
						right_arrow = "─",
					},
					style = "#afafaf",
				},
				indent = {
					chars = { "│" },
					use_treesitter = false,
				},
				blank = {
					enable = false,
				},
			})
		end,
	},
}
