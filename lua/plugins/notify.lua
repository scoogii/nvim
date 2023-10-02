vim.opt.termguicolors = true
return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      timeout = 500,
      max_width = 50,
      max_height = 50,
    })
    vim.notify = require("notify")
  end
}
