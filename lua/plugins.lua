local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.indent"),
	require("plugins.statusline"),
	require("plugins.colorscheme"),
	require("plugins.treesitter"),
	require("plugins.explorer"),
	require("plugins.undotree"),
	require("plugins.editors"),
	require("plugins.comment"),
	require("plugins.winbar"),
	require("plugins.git"),
	require("plugins.vista"),
	require("plugins.wilder"),
	require("plugins.format"),
	require("plugins.tmux"),
	require("plugins.autocomplete"),
	require("plugins.snippets"),
	require("plugins.useless"),
	require("plugins.telescope"),
	require("plugins.yank"),
})
