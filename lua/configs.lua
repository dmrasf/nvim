vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.wrap = true
vim.opt.showcmd = true
vim.opt.wildmenu = true
vim.opt.scrolloff = 5
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.autoindent = true
vim.opt.updatetime = 100
vim.opt.lazyredraw = true
vim.opt.ttyfast = true
vim.opt.list = true
vim.opt.listchars = "tab:|\\ ,trail:▫"
vim.opt.autochdir = true
vim.opt.errorbells = false
vim.opt.visualbell = true
vim.opt.hidden = true
vim.opt.cmdheight = 1
vim.opt.conceallevel = 0
vim.opt.termguicolors = true

vim.cmd([[
silent !mkdir -p $HOME/.local/share/nvim/tmp/backup
silent !mkdir -p $HOME/.local/share/nvim/tmp/undo
set backupdir=$HOME/.local/share/nvim/tmp/backup,.
set directory=$HOME/.local/share/nvim/tmp/backup,.
if has('persistent_undo')
    set undofile
    set undodir=$HOME/.local/share/nvim/tmp/undo,.
endif
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]])

vim.cmd([[
" 输入法自动切换
let g:input_toggle = 2
function! Fcitx2en()
    let s:input_status = system("fcitx-remote")
    if s:input_status == 1
        let g:input_toggle = 1
        let l:a = system("fcitx-remote -o")
    endif
endfunction
function! Fcitx2zh()
    if g:input_toggle == 1
        let l:a = system("fcitx-remote -c")
        let g:input_toggle = 2
    endif
endfunction
autocmd InsertEnter * call Fcitx2zh()
autocmd InsertLeave * call Fcitx2en()
]])
