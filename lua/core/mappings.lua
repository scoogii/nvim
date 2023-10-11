-- MAPPINGS
local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Easy save
map("n", "<C-s>", "<CMD>w<CR>")

-- Quit
map('n', '<C-Q>', '<CMD>q<CR>')

-- Move to next/prev buffer
map('n', '<leader>[', '<CMD>bp<CR>')
map('n', '<leader>]', '<CMD>bn<CR>')

-- Shift Tab lines
map('n', '<Tab>', '>>')
map('n', '<S-Tab>', '<<')
map('i', '<S-Tab>', '<C-d>')

-- nvim tree
map('n', '<leader>5', '<CMD>NvimTreeToggle<CR>')
map('n', '<leader>6', '<CMD>NvimTreeFindFileToggle<CR>')

-- bufferline
map('n', 'b]', '<CMD>BufferLineCycleNext<CR>')
map('n', 'b[', '<CMD>BufferLineCyclePrev<CR>')
map('n', 'bd', '<CMD>bdelete<CR>')

-- lazygit
map('n', '<leader>lg', '<CMD>LazyGit<CR>')

-- Trouble
map('n', '<leader>t', '<cmd>TroubleToggle<CR>')

-- Markdown Preview
map('n', '<leader>m', '<cmd>MarkdownPreview<CR>')

-- Which Key
map('n', '<leader>w', '<cmd>WhichKey<CR>')
