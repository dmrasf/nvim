return {
	"mhartington/formatter.nvim",
	config = function()
		require("formatter").setup({
			-- Enable or disable logging
			logging = false,
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
				python = {
					require("formatter.filetypes.python").black,
				},
			},
		})
		vim.cmd([[
        augroup FormatAutogroup
            autocmd!
            autocmd BufWritePost *.lua FormatWrite
        augroup END
        ]])
		vim.keymap.set("n", "<a-f>", ":Format<cr>", { noremap = true, silent = true })
	end,
}
