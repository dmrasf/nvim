return {
	"gbprod/yanky.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		vim.keymap.set("n", "<leader>y", ":Telescope yank_history<CR>")
	end,
}
