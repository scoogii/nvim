local highlight = {
    "RainbowLavender",
    "RainbowMauve",
    "RainbowBlue",
    "RainbowTeal",
    "RainbowGreen",
    "RainbowYellow",
    "RainbowPeach",
    "RainbowRed",
}

return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  dependencies = { "HiPhish/rainbow-delimiters.nvim" },
  config = function()
    local hooks = require "ibl.hooks"

    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      -- Catppuccin Macchiato palette
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#ed8796" })
      vim.api.nvim_set_hl(0, "RainbowPeach", { fg = "#f5a97f" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#eed49f" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#a6da95" })
      vim.api.nvim_set_hl(0, "RainbowTeal", { fg = "#8bd5ca" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#8aadf4" })
      vim.api.nvim_set_hl(0, "RainbowMauve", { fg = "#c6a0f6" })
      vim.api.nvim_set_hl(0, "RainbowLavender", { fg = "#91a4f8" })
    end)

    vim.g.rainbow_delimiters = { highlight = highlight }

    require("ibl").setup({
      indent = {
        char = "│",
        highlight = "IblIndent",
      },
      scope = {
        highlight = highlight,
        show_start = false,
        show_end = false,
      },
    })

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end,
}
