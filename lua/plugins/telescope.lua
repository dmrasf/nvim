return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = { "\\f" },
	config = function()
		vim.keymap.set("n", "\\f", ":Telescope<cr>", { noremap = true, silent = true })
		require("telescope").setup({
			defaults = {
				layout_config = {
					width = 0.9,
					height = 0.9,
				},
				mappings = {
					i = {
						["<C-h>"] = "which_key",
						["<C-i>"] = "move_selection_previous",
						["<C-k>"] = "move_selection_next",
						["<C-u>"] = "preview_scrolling_up",
						["<C-d>"] = "preview_scrolling_down",
						["<esc>"] = "close",
					},
				},
				color_devicons = true,
				path_display = { "truncate" },
				file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})
		require("telescope").load_extension("yank_history")
	end,
}
