return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({})
		end,
	},
	{
		"Bekaboo/dropbar.nvim",
		config = function()
			local api = require("dropbar.api")
			vim.keymap.set("n", "<Leader>o", api.pick)
			require("dropbar").setup({
				menu = {
					quick_navigation = true,
					keymaps = {
						["<esc>"] = function()
							local menu = api.get_current_dropbar_menu()
							if menu then
								menu:close()
							end
						end,
					},
				},
			})
		end,
	},
}
