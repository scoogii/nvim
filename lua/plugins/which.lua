return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("which-key").setup({
      opts = {
        window = {
          border = "double",
        }
      }
    })
  end
}
