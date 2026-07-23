return {
  "nvim-telescope/telescope.nvim", branch = 'master',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local actions = require("telescope.actions")
    local builtin = require('telescope.builtin')

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

    -- All files
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    -- Git files
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    -- Live Grep
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
  end,
}
