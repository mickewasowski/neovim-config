local o = vim.o
local g = vim.g

o.expandtab = true
o.tabstop = 2
o.softtabstop =2
o.shiftwidth=2
o.number = true

o.clipboard = "unnamedplus"
o.ignorecase = true

o.wrap = true
o.signcolumn = "yes"

o.equalalways = false

o.list = true

o.termguicolors = true

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0
