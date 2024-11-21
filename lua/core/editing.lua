-- Editing options
local o = vim.o
local w = vim.wo

-- Tabs/Indentation
o.autoindent = true
o.smarttab = true
o.tabstop = 4
o.expandtab = true
o.softtabstop = 4
o.shiftwidth = 4
o.shiftround = true

-- Remove trailing whitespaces on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- Remove auto comment on next line
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')

-- Remove Virtual Text bg
vim.api.nvim_command[[ autocmd ColorScheme * highlight DiagnosticVirtualTextError guibg=NONE ]]
vim.api.nvim_command[[ autocmd ColorScheme * highlight DiagnosticVirtualTextWarn guibg=NONE ]]
vim.api.nvim_command[[ autocmd ColorScheme * highlight DiagnosticVirtualTextInfo guibg=NONE ]]
vim.api.nvim_command[[ autocmd ColorScheme * highlight DiagnosticVirtualTextHint guibg=NONE ]]

-- Diagnostic Sign Icons
vim.fn.sign_define("DiagnosticSignError", { text=' ', texthl = "DiagnosticSignError", numhl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", { text=' ', texthl = "DiagnosticSignWarn", numhl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo", { text=' ', texthl = "DiagnosticSignInfo", numhl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint", { text=' ', texthl = "DiagnosticSignHint", numhl = "DiagnosticSignHint"})

-- Text Width
o.textwidth = 100

-- Backspacing
o.backspace = [[indent,eol,start]]

-- Dotted Leading Spaces
o.list = true
vim.opt.listchars = {
  tab = '│·',
  trail = '·'
}

-- Relative Number Lines
w.number = true
w.relativenumber = true
w.numberwidth = 5

-- Number of lines to keep above and below cursor
o.scrolloff = 8

-- Copy and Paste between nvim and OS
o.clipboard = "unnamedplus"

vim.cmd.filetype = "indent on"

o.mouse = "a"
o.hlsearch = true
o.ignorecase = true
o.smartcase = true
