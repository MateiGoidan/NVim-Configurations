-- Options for neovim

vim.g.mapleader = " "

vim.wo.relativenumber = true

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set smartindent")
vim.cmd("set incsearch")
vim.cmd("set scrolloff=60")

-- Clipboard integration
vim.cmd("set clipboard+=unnamedplus")