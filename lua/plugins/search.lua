return {
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = { "\\f" },
		config = function()
			vim.keymap.set("n", "\\f", ":FzfLua<cr>", { noremap = true, silent = true })
			require("fzf-lua").setup({})
		end,
	},
}
