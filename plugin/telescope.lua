-- Telescope
local builtin = require('telescope.builtin')

-- All files
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- Git files
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
