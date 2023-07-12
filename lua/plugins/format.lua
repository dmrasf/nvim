return {
	"mhartington/formatter.nvim",
	keys = { "<a-f>" },
	config = function()
		require("formatter").setup({
			-- Enable or disable logging
			logging = true,
			-- Set the log level
			log_level = vim.log.levels.WARN,
			-- All formatter configurations are opt-in
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				c = {
					require("formatter.filetypes.c").clangformat,
				},
				rust = {
					require("formatter.filetypes.rust").rustfmt,
				},
			},
		})

		vim.keymap.set("n", "<a-f>", ":Format<cr>", { noremap = true, silent = true })
	end,
}
