return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    require("mason").setup()
    require("mason-null-ls").setup({
      ensure_installed = { "prettier", "eslint_d" },
      automatic_installation = true,
    })

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        require("none-ls.diagnostics.eslint_d"),
      },
    })

    vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
  end,
  requires = { "nvim-lua/plenary.nvim" },
}
