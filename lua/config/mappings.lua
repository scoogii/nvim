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
map('n', 'bb', '<CMD>BufferLinePick<CR>')
map('n', 'bd', '<CMD>bdelete<CR>')

-- lazygit
map('n', '<leader>gz', '<CMD>LazyGit<CR>')

-- Markdown Preview
map('n', '<leader>m', '<cmd>MarkdownPreview<CR>')

-- Which Key
map('n', '<leader>w', '<cmd>WhichKey<CR>')

-- Goto Definitions
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local buf = args.buf
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = buf, noremap = true, silent = true })
  end
})

-- Goto Implementation
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local buf = args.buf
    -- Map the keybind for 'gi' for the LSP client
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = buf, noremap = true, silent = true })
  end
})

-- Goto References
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local buf = args.buf
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = buf, desc = "Go to References" })
  end
})

-- Format with zprint
local function format_with_zprint()
  local filename = vim.fn.expand("%:p")
  if vim.fn.filereadable(filename) == 1 then
    vim.fn.jobstart({ "zprint", "-w", filename }, {
      on_exit = function(_, code)
        if code == 0 then
          vim.schedule(function()
            vim.cmd("checktime")
          end)
        end
      end,
    })
  end
end

vim.keymap.set("n", "<leader>kz", format_with_zprint, { noremap = true, silent = true, desc = "Format with zprint" })

-- Integrant
local function reset_integrant()
	vim.cmd([[ConjureEval (integrant.repl/reset)]])
end

local function run_tests()
	vim.cmd([[ConjureEval (clojure.test/run-all-tests #"updoc.+\.test")]])
end

vim.keymap.set("n", "<localleader>kr", reset_integrant, { noremap = true, silent = true, desc = "Integrant reset" })
vim.keymap.set("n", "<localleader>kt", run_tests, { noremap = true, silent = true, desc = "Run tests" })

-- Toggle diagnostics
