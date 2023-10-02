vim.opt.termguicolors = true
return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      render = "default",
      timeout = 500,
      fps = 60,
      background_colour = "Normal",
    })
    vim.notify = require("notify")
  end
}
