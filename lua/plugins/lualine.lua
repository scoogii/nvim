local function show_macro_recording()
    local recording_register = vim.fn.reg_recording()
    if recording_register == "" then
        return ""
    else
        return "Recording @" .. recording_register
    end
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {}, }, ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff',
          {
            'diagnostics',
            sources = {"nvim_lsp"},
            sections = { 'error', 'warn', 'info', 'hint' },
            diagnostics_color = {
            },
            symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
            colored = true,           -- Displays diagnostics status in color if set to true.
            update_in_insert = false, -- Update diagnostics in insert mode.
            always_visible = false,   -- Show diagnostics even if there are none.
          }
        },
        lualine_c = {'filename'},
        lualine_x = {
          {
            "macro-recording",
            fmt = show_macro_recording,
            color = { fg = "#66d998" },
          },
          {
            require("noice").api.status.command.get,
            cond = require("noice").api.status.command.has,
            color = { fg = "#e277e6" },
          },
          'encoding'
        },
        -- lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
  }
  end
}
