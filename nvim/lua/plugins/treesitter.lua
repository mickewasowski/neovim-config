-- return {
--     "nvim-treesitter/nvim-treesitter",
--     build = ":TSUpdate",
--     config = function ()
--         local config = require("nvim-treesitter.configs")
--         config.setup({
--           auto_install = true,
--           ensure_installed = {'javascript', 'typescript', 'tsx', 'html', 'css'},
--           highlight = { enable = true },
--           indent = { enable = true },
--         })
--       end
--  }

-- Provides better syntax highlighting and code understanding.

return {
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",

    build = ":TSUpdate",

    dependencies = { "windwp/nvim-ts-autotag" },

    config = function()
      require("nvim-treesitter.configs").setup({
        auto_install = false,
        ensure_installed = {
          "bash",
          "lua",

          "markdown",
          "markdown_inline",

          "html",
          "css",
          "javascript",
          "typescript",
          "tsx",
          "json",
        },

        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
