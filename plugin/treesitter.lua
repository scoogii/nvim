vim.treesitter.language.register('swift', 'swift')

local skip_ft = {
  [""] = true, notify = true, noice = true, lazy = true, mason = true,
  NvimTree = true, TelescopePrompt = true, quickfix = true, help = true,
  checkhealth = true, lspinfo = true, man = true,
}

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    if skip_ft[ft] then return end
    pcall(vim.treesitter.start, args.buf)
  end,
})

require('nvim-ts-autotag').setup({
    autotag = {
        enable = true,
        enable_close_on_slash = true,
    }
})
