return {
	"djoshea/vim-autoread", -- 自动刷新外部更改
	{
		-- 自动任务
		"stevearc/overseer.nvim",
		config = function()
			require("overseer").setup({})
		end,
	},
}
