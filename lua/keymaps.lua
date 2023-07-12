vim.g.mapleader = " "

vim.keymap.set("n", "<leader><cr>", ":nohlsearch<cr>", { noremap = true })

vim.keymap.set({ "n", "v" }, "i", "k", { noremap = true })
vim.keymap.set({ "n", "v" }, "h", "i", { noremap = true })
vim.keymap.set({ "n", "v" }, "j", "h", { noremap = true })
vim.keymap.set({ "n", "v" }, "k", "j", { noremap = true })
vim.keymap.set({ "n", "v" }, "K", "3j", { noremap = true })
vim.keymap.set({ "n", "v" }, "I", "3k", { noremap = true })
vim.keymap.set({ "n", "v" }, "H", "I", { noremap = true })

vim.keymap.set("n", "Q", "q", { noremap = true })
vim.keymap.set("n", "Z", "Q", { noremap = true })
vim.keymap.set("n", "s", "<nop>", { noremap = true })
vim.keymap.set("n", "q", ":q<cr>", { noremap = true })
vim.keymap.set("n", "r", ":w<cr>", { noremap = true })
vim.keymap.set("n", ";", ":", { noremap = true })
vim.keymap.set("n", "n", "nzz", { noremap = true })
vim.keymap.set("n", "N", "Nzz", { noremap = true })
vim.keymap.set("n", "<", "<<", { noremap = true })
vim.keymap.set("n", ">", ">>", { noremap = true })
vim.keymap.set("v", "Y", '"+y', { noremap = true })
vim.keymap.set("n", "fw", "*", { noremap = true })
vim.keymap.set("n", "fb", "#", { noremap = true })

vim.keymap.set("n", "sd", ":set splitright<cr>:vsplit<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "sa", ":set nosplitright<cr>:vsplit<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "sw", ":set nosplitbelow<cr>:split<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "ss", ":set splitbelow<cr>:split<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "sv", "<c-w>b<c-w>K", { noremap = true, silent = true })
vim.keymap.set("n", "sc", "<c-w>b<c-w>H", { noremap = true, silent = true })

vim.keymap.set("n", "<up>", ":res-1<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<down>", ":res+1<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<left>", ":vertical res-1<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<right>", ":vertical res+1<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<m-u>", "<c-w>p<c-u><c-w>p", { noremap = true })
vim.keymap.set("n", "<m-d>", "<c-w>p<c-d><c-w>p", { noremap = true })

vim.keymap.set("n", "<leader>i", "<c-w>k", { noremap = true })
vim.keymap.set("n", "<leader>k", "<c-w>j", { noremap = true })
vim.keymap.set("n", "<leader>l", "<c-w>l", { noremap = true })
vim.keymap.set("n", "<leader>j", "<c-w>h", { noremap = true })

vim.keymap.set("n", "tn", ":tabe<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "ti", ":-tabnext<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "tk", ":+tabnext<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "tmi", ":-tabmove<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "tmk", ":+tabmove<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "[b", ":bprevious<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "]b", ":bnext<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "[B", ":bfirst<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "]B", ":blast<cr>", { noremap = true, silent = true })
