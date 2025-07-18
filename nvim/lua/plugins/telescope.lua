return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    -- dependencies = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim', 'nvim-telescope/telescope-media-files.nvim' },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
    end
  },
  -- {
  --   "nvim-telescope/telescope-ui-select.nvim",
  --   config = function()
  --     require("telescope").setup {
  --       extensions = {
  --         ["ui-select"] = {
  --           require("telescope.themes").get_dropdown {
  --             -- even more opts
  --           }
  --         },
  --         ["media_files"] = {
  --           filetypes = {"png", "webp", "jpg", "jpeg"},
  --           -- find command (defaults to `fd`)
  --           find_cmd = "rg"
  --         },
  --       }
  --     }
  --     require("telescope").load_extension("ui-select")
  --     require("telescope").load_extension('media_files')
  --   end
  -- }
}
