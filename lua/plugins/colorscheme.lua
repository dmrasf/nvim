return {
	{
		"sainnhe/gruvbox-material",
		config = function()
			vim.g.gruvbox_material_background = "medium"
			vim.g.gruvbox_material_transparent_background = 0
			vim.g.gruvbox_material_better_performance = 1
			vim.g.gruvbox_material_enable_italic_comment = 1
			vim.g.gruvbox_material_enable_italic = 1
			vim.g.gruvbox_material_enable_bold = 1
			vim.g.gruvbox_material_visual = "grey background"
			vim.g.gruvbox_material_menu_selection_background = "orange"
			vim.g.gruvbox_material_sign_column_background = "none"
			vim.g.gruvbox_material_spell_foreground = "colored"
			vim.g.gruvbox_material_ui_contrast = "high"
			vim.g.gruvbox_material_diagnostic_text_highlight = 0
			vim.g.gruvbox_material_diagnostic_line_highlight = 0
			vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
			vim.cmd([[colorscheme gruvbox-material]])
		end,
	},
	"romainl/vim-cool",
	"itchyny/vim-cursorword",
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({})
		end,
	},
	{
		"luochen1990/rainbow",
		config = function()
			vim.g.rainbow_active = 1
		end,
	},
}
