local o = vim.o
local g = vim.g

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.opt.number = true

o.clipboard = "unnamedplus"
o.ignorecase = true


