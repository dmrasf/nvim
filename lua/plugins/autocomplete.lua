return {
	"neoclide/coc.nvim",
	config = function()
		vim.cmd([[
        nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
        " use <tab> to trigger completion and navigate to the next complete item
        inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1): "\<Tab>"
        inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1): "\<S-Tab>"
        inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
        " Use M to show documentation in preview window.
        nnoremap <silent> M :call ShowDocumentation()<CR>
        function! ShowDocumentation()
            if CocAction('hasProvider', 'hover')
                call CocActionAsync('doHover')
            else
                call feedkeys('K', 'in')
            endif
        endfunction
        nmap <silent> <C-j> <Plug>(coc-diagnostic-prev)
        nmap <silent> <C-k> <Plug>(coc-diagnostic-next)
        nmap <silent> gd <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)
        nmap <leader>rn <Plug>(coc-rename)
        nnoremap <C-c> :CocCommand<CR>
        nnoremap <C-l> :CocList<CR>
        " coc-translator
        nmap tr <Plug>(coc-translator-p)
        " coc-snippets
        let g:coc_snippet_next = '<C-k>'
        let g:coc_snippet_prev = '<C-i>'
        imap <C-o> <Plug>(coc-snippets-expand)
        " coc-calc
        nmap <Leader>ca <Plug>(coc-calc-result-append)
        nmap <Leader>cr <Plug>(coc-calc-result-replace)
        " coc-ci
        nmap <silent>w <Plug>(coc-ci-w)
        nmap <silent>b <Plug>(coc-ci-b)
        " coc-action
        xmap <leader>a <Plug>(coc-codeaction-selected)
        nmap <leader>a <Plug>(coc-codeaction-selected)
        nmap <leader>ac <Plug>(coc-codeaction)
        " Apply AutoFix to problem on the current line.
        nmap <leader>f <Plug>(coc-fix-current)
        ]])
	end,
}
