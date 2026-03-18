return {
  "karb94/neoscroll.nvim",
  opts = {},

  config = function()
    require('neoscroll').setup {
      mappings = {
        '<C-u>', '<C-d>',
      },
      easing = "lienar",
      stop_eof = true,
    }
  end,
}
