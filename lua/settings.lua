-- Options for neovim

vim.g.mapleader = " "

vim.keymap.set("i", "(", "()<Left>", {})
vim.keymap.set("i", "[", "[]<Left>", {})
vim.keymap.set("i", "{", "{}<Left>", {})
vim.keymap.set("i", "'", "''<Left>", {})
vim.keymap.set("i", '"', '""<Left>', {})

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

vim.cmd("set relativenumber")
vim.cmd("set nu")

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.cmd("set nowrap")

vim.cmd("set smartindent")

vim.cmd("set so=900")

vim.cmd("set incsearch")

vim.cmd("set clipboard+=unnamedplus")
