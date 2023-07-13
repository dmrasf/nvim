return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			"neovim/nvim-lspconfig",
			{
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
				config = function()
					require("mason").setup({
						ui = {
							keymaps = { install_package = "a" },
						},
					})
				end,
			},
			"williamboman/mason-lspconfig.nvim",
			{
				"hrsh7th/nvim-cmp",
				dependencies = {
					"hrsh7th/cmp-nvim-lsp",
					"hrsh7th/cmp-buffer",
					"hrsh7th/cmp-path",
					"hrsh7th/cmp-cmdline",
					"hrsh7th/cmp-calc",
					{
						"quangnguyen30192/cmp-nvim-ultisnips",
						config = function()
							require("cmp_nvim_ultisnips").setup({})
						end,
					},
					{
						"windwp/nvim-autopairs",
						event = "InsertEnter",
						opts = {},
					},
				},
			},
		},
		config = function()
			local cmp = require("cmp")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

			cmp.setup({
				snippet = {
					expand = function(args)
						vim.fn["UltiSnips#Anon"](args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
						else
							fallback()
						end
					end),
					["<cr>"] = cmp.mapping(function(fallback)
						if cmp.visible() and cmp.get_active_entry() then
							cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
						else
							fallback()
						end
					end),
					["<c-k>"] = cmp.mapping(function()
						cmp_ultisnips_mappings.compose({ "expand", "jump_forwards" })(function() end)
					end, { "i", "s" }),
					["<c-j>"] = cmp.mapping(function(fallback)
						cmp_ultisnips_mappings.jump_backwards(fallback)
					end, { "i", "s" }),
					["<c-u>"] = cmp.mapping.scroll_docs(-4),
					["<c-d>"] = cmp.mapping.scroll_docs(4),
					["<c-e>"] = cmp.mapping.abort(),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "ultisnips" },
					{ name = "buffer" },
					{ name = "calc" },
				}),
			})

			-- Set configuration for specific filetype.
			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					-- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
					{ name = "git" },
					{ name = "buffer" },
				}),
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			local lsp = require("lsp-zero").preset({})
			lsp.on_attach(function(_, bufnr)
				lsp.default_keymaps({ buffer = bufnr })
				vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { buffer = true })
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = true })
			end)
			lsp.set_sign_icons({
				error = "",
				warn = "",
				hint = "",
				info = "",
			})
			lsp.setup()
		end,
	},
	{
		"weilbith/nvim-code-action-menu",
		config = function()
			vim.g.code_action_menu_window_border = "single"
			vim.g.code_action_menu_show_details = true
			vim.g.code_action_menu_show_diff = true
			vim.g.code_action_menu_show_action_kind = true
			vim.keymap.set("n", "<leader>f", ":CodeActionMenu<cr>", { noremap = true })
		end,
	},
}
