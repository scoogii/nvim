-- Editing options
local o = vim.o
local w = vim.wo

-- Tabs/Indentation
o.autoindent = true
o.expandtab = true
o.smarttab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.shiftround = true

-- For 2 tab spaces
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = { "html, css" },
--   command = "setlocal shiftwidth=2 tabstop=2"
-- })

-- Remove trailing whitespaces on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

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
