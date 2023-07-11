return {
	{
		-- 回车选取内容
		"gcmt/wildfire.vim",
	},
	{
		-- 整块移动
		"matze/vim-move",
		config = function()
			vim.cmd([[
            let g:move_map_keys = 0
            vmap <a-k> <Plug>MoveBlockDown
            vmap <a-i> <Plug>MoveBlockUp
            vmap <a-j> <Plug>MoveBlockLeft
            vmap <a-l> <Plug>MoveBlockRight
            nmap <a-k> <Plug>MoveLineDown
            nmap <a-i> <Plug>MoveLineUp
            nmap <a-j> <Plug>MoveLineLeft
            nmap <a-l> <Plug>MoveLineRight
            ]])
		end,
	},
	{
		-- 多选编辑
		"mg979/vim-visual-multi",
		config = function()
			vim.cmd([[
            let g:VM_maps = {}
            let g:VM_leader = {'default': ',', 'visual': ',', 'buffer': ','}
            let g:VM_maps['Select All']  = '<M-n>'
            let g:VM_maps['Visual All']  = '<M-n>'
            let g:VM_maps['Skip Region'] = '<C-x>'
            let g:VM_maps['Remove Region'] = '<C-p>'
            let g:VM_maps['Increase']    = '+'
            let g:VM_maps['Decrease']    = '-'
            let g:VM_maps["Undo"] = 'u'
            let g:VM_maps["Redo"] = '<C-r>'
            let g:VM_custom_motions  = {'j': 'h', 'l': 'l', 'i': 'k', 'k': 'j'}
            let g:VM_maps['i'] = 'h'
            let g:VM_maps['I'] = 'H'
            ]])
		end,
	},
	{
		"AndrewRadev/splitjoin.vim",
		config = function()
			vim.g.splitjoin_split_mapping = ""
			vim.g.splitjoin_join_mapping = ""
			vim.keymap.set("n", "si", ":SplitjoinJoin<cr>", { noremap = true, silent = true })
			vim.keymap.set("n", "sk", ":SplitjoinSplit<cr>", { noremap = true, silent = true })
		end,
	},
	{
		"AndrewRadev/switch.vim",
		config = function() end,
	},
}
