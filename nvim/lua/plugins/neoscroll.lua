return {
  "karb94/neoscroll.nvim",
  opts = {},
  config = function()
    require('neoscroll').setup({
      duration_multiplier = 0.2,   -- Global duration multiplier
    })
  end
}
