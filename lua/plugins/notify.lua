vim.opt.termguicolors = true
return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      timeout = 500,
      max_width = 60,
      max_height = 30,
    })
    vim.notify = require("notify")
  end
}
