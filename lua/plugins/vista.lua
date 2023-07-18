return {
	"liuchengxu/vista.vim",
	keys = { "T" },
	config = function()
		vim.cmd([[
        map <silent> T :Vista!!<CR>
        let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
        let g:vista_default_executive = 'ctags'
        let g:vista_fzf_preview = ['right:50%']
        let g:vista#renderer#enable_icon = 1
        ]])
	end,
}
