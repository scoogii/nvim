-- FORMATTING
local o = vim.o

-- Stop auto commenting on next line
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

o.fileformat = 'unix'
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'
o.updatetime = 100
