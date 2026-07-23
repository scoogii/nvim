return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    local devicons = require("nvim-web-devicons")
    local icon_ns = vim.api.nvim_create_namespace("harpoon_icons")

    -- Catppuccin (macchiato) theming. Set at menu-open time so it wins over
    -- catppuccin's own Harpoon* groups (applied at colorscheme load).
    local function set_theme()
      local ok, palette = pcall(function()
        return require("catppuccin.palettes").get_palette("macchiato")
      end)
      if not ok then return end
      vim.api.nvim_set_hl(0, "HarpoonNormal", { bg = palette.mantle })
      vim.api.nvim_set_hl(0, "HarpoonBorder", { fg = palette.mauve, bg = palette.mantle })
      vim.api.nvim_set_hl(0, "HarpoonTitle", { fg = palette.base, bg = palette.mauve, bold = true })
      vim.api.nvim_set_hl(0, "HarpoonFooter", { fg = palette.overlay1, bg = palette.mantle, italic = true })
    end

    harpoon:extend({
      UI_CREATE = function(cx)
        local win, buf = cx.win_id, cx.bufnr

        set_theme()

        -- Theme the floating window
        vim.wo[win].winhighlight =
          "Normal:HarpoonNormal,FloatBorder:HarpoonBorder,FloatTitle:HarpoonTitle,FloatFooter:HarpoonFooter"

        -- Rounded border, centered title with an icon, and a key reminder footer
        pcall(vim.api.nvim_win_set_config, win, {
          border = "rounded",
          title = { { "  Harpoon ", "HarpoonTitle" } },
          title_pos = "center",
          footer = {
            { " ", "HarpoonFooter" },
            { "⏎ open", "HarpoonFooter" },
            { "  •  ", "HarpoonFooter" },
            { "q close", "HarpoonFooter" },
            { "  •  ", "HarpoonFooter" },
            { "dd remove", "HarpoonFooter" },
            { " ", "HarpoonFooter" },
          },
          footer_pos = "center",
        })

        -- Per-line filetype icons (virtual/inline — buffer text stays clean for saving)
        vim.api.nvim_buf_clear_namespace(buf, icon_ns, 0, -1)
        for i, line in ipairs(cx.contents) do
          if line ~= "" then
            local name = vim.fn.fnamemodify(line, ":t")
            local icon, hl = devicons.get_icon(name, name:match("%.(%w+)$"), { default = true })
            if icon then
              vim.api.nvim_buf_set_extmark(buf, icon_ns, i - 1, 0, {
                virt_text = { { icon .. " ", hl } },
                virt_text_pos = "inline",
              })
            end
          end
        end
      end,
    })

    -- Keymaps ------------------------------------------------------------
    -- Add current file to the list
    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
      vim.notify("Harpooned " .. vim.fn.expand("%:t"), vim.log.levels.INFO, { title = "Harpoon" })
    end, { desc = "Harpoon add file" })
    -- Toggle the quick menu
    vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })

    -- Jump to files by slot
    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon file 1" })
    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon file 2" })
    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon file 3" })
    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon file 4" })

    -- Cycle through the list
    vim.keymap.set("n", "<leader>p", function() harpoon:list():prev() end, { desc = "Harpoon prev" })
    vim.keymap.set("n", "<leader>n", function() harpoon:list():next() end, { desc = "Harpoon next" })
  end,
}
