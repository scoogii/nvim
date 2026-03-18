-- Telescope
local builtin = require('telescope.builtin')

-- All files
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- Git files
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- Live Grep
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

local actions = require("telescope.actions")

return {
  "nvim-telescope/telescope.nvim", tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
      require("telescope").setup({
        defaults = {
          borderchars = {
            prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            results = { "─", "│", "─", "│", "╭", "╮", "┤", "├" },
            preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          },
          layout_config = {
            prompt_position = "bottom",
          },
          sorting_strategy = "descending",
          mappings = {
            i = {
              ["<esc>"] = actions.close
            },
          },
        },
      })
  end,
}
