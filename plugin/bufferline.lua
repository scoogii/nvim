-- BUFFERLINE
vim.opt.termguicolors = true

local cp = require("catppuccin.palettes").get_palette() -- current flavour (macchiato)

-- Make the SELECTED buffer a slightly-lighter-gray slant (against the mantle
-- bar). Every `*_selected` group needs the same bg to avoid colour bleed inside
-- the tab (incl. the `*_diagnostic_selected` groups that render the diagnostic
-- count, otherwise it sits on a dark `base` patch).
local accent = cp.surface1
local selected = {}
-- Plain (non-diagnostic) selected groups: light text on the gray accent.
for _, group in ipairs({
    "buffer_selected", "numbers_selected", "duplicate_selected",
    "close_button_selected", "modified_selected", "indicator_selected",
}) do
    selected[group] = { fg = cp.text, bg = accent }
end
selected.buffer_selected.style = { "bold" }
selected.numbers_selected.style = { "bold" }
selected.close_button_selected.fg = cp.red
selected.modified_selected.fg = cp.peach
selected.indicator_selected.fg = cp.peach

-- Diagnostic-coloured selected groups: keep catppuccin's diagnostic fg so the
-- buffer title turns red/yellow/etc. when the focused buffer has diagnostics,
-- just swap the bg to the gray accent.
selected.error_selected           = { fg = cp.red,      bg = accent, style = { "bold" } }
selected.warning_selected         = { fg = cp.yellow,   bg = accent, style = { "bold" } }
selected.info_selected            = { fg = cp.sky,      bg = accent, style = { "bold" } }
selected.hint_selected            = { fg = cp.teal,     bg = accent, style = { "bold" } }
selected.diagnostic_selected      = { fg = cp.subtext0, bg = accent, style = { "bold" } }
selected.error_diagnostic_selected   = { fg = cp.red,    bg = accent }
selected.warning_diagnostic_selected = { fg = cp.yellow, bg = accent }
selected.info_diagnostic_selected    = { fg = cp.sky,    bg = accent }
selected.hint_diagnostic_selected    = { fg = cp.teal,   bg = accent }

-- The slant glyph fades the accent tab into the bar's fill (crust), so there is
-- no leftover separator block after the buffer.
selected.separator_selected = { fg = cp.crust, bg = accent }
-- BufferLinePick char highlights: catppuccin doesn't define these, so bufferline
-- falls back to defaults with a mismatched bg. Pin them to each tab's own bg.
selected.pick_selected = { fg = cp.red, bg = accent, style = { "bold" } }
selected.pick = { fg = cp.red, bg = cp.mantle, style = { "bold" } }
selected.pick_visible = { fg = cp.red, bg = cp.mantle, style = { "bold" } }

-- Skip assigning a pick letter to the current buffer (it's already focused, so
-- offering it as a jump target is noise). Returning nil makes the UI fall back
-- to rendering the buffer's normal icon during a pick.
local pick = require("bufferline.pick")
local orig_pick_get = pick.get
pick.get = function(element)
    if element.id == vim.api.nvim_get_current_buf() then return nil end
    return orig_pick_get(element)
end

require("bufferline").setup({
    -- Themed highlights so slants blend into the bar instead of rendering as a
    -- dark block (the artifact from un-themed `padded_slant`).
    highlights = require("catppuccin.special.bufferline").get_theme({
        custom = { all = selected },
    }),
    options = {
        separator_style = "slant",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end
    }
})
