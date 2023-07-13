return {
	{
		"shellRaining/hlchunk.nvim",
		event = { "UIEnter" },
		init = function()
			require("hlchunk").setup({
				chunk = {
					enable = false,
					use_treesitter = true,
					chars = {
						horizontal_line = "─",
						vertical_line = "│",
						left_top = "┌",
						left_bottom = "└",
						right_arrow = "",
					},
					style = "#ffffff",
				},
				indent = {
					chars = { "│" },
					use_treesitter = false,
				},
				blank = { enable = false },
				line_num = { enable = false },
			})
		end,
	},
}
