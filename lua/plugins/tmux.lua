return {
	"christoomey/vim-tmux-navigator",
	config = function()
		vim.g.tmux_navigator_no_mappings = 1
		vim.keymap.set("n", "<leader>j", ":<C-U>TmuxNavigateLeft<cr>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>k", ":<C-U>TmuxNavigateDown<cr>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>i", ":<C-U>TmuxNavigateUp<cr>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>l", ":<C-U>TmuxNavigateRight<cr>", { noremap = true, silent = true })
	end,
}
