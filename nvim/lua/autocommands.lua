local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local general = augroup("General", { clear = true })

autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      timeout = 200,
    })
  end,
  group = general,
  desc = "Highlight when yanking text",
})
