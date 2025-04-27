return {
	{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    lazy = false,
    config = function() 
      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
          }
        }
      })
    end 
  }
}
