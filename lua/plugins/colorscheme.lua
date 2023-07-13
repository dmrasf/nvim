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
		"NvChad/nvim-colorizer.lua",
		opts = {
			filetypes = { "*" },
			user_default_options = {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				names = true, -- "Name" codes like Blue or blue
				RRGGBBAA = false, -- #RRGGBBAA hex codes
				AARRGGBB = true, -- 0xAARRGGBB hex codes
				rgb_fn = false, -- CSS rgb() and rgba() functions
				hsl_fn = false, -- CSS hsl() and hsla() functions
				css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
				-- Available modes for `mode`: foreground, background,  virtualtext
				mode = "background", -- Set the display mode.
				-- Available methods are false / true / "normal" / "lsp" / "both"
				-- True is same as normal
				tailwind = true,
				sass = { enable = false },
				virtualtext = "■",
			},
			-- all the sub-options of filetypes apply to buftypes
			buftypes = {},
		},
	},
}
