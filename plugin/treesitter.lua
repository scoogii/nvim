require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "css", "cpp", "python", "javascript", "html", "css" },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true,
  },

  -- rainbow = {
  --   enable = true,
  --   -- disable = { "jsx" },
  --   -- extended_mode = true,
  --   max_file_lines = nil,
  --   colors = { "#c75c4c", "#f08e32", "#edc840", "#8cdb42", "#4e8fcf", "#5e44d4", "#b741cc"},
  -- }
}

require('nvim-ts-autotag').setup({
    autotag = {
        enable = true,
        -- enable_close = true,
        enable_close_on_slash = true,
    }
})
