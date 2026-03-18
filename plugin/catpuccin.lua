require("catppuccin").setup({
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = { "italic "},
        variables = {},
        numbers = {},
        booleans = { "italic" },
        properties = {},
        types = {},
        operators = {},
    },
    -- color_overrides = {
    --     macchiato = {
    --         base = "#191b2a",
    --         mantle = "#181a2a",
    --     },
    -- },
    color_overrides = {},
    custom_highlights = function(colors)
        return {
            -- Telescope with visible rounded borders in macchiato
            TelescopeNormal = { bg = colors.mantle },
            TelescopeBorder = { bg = colors.mantle, fg = colors.mantle },
            TelescopePromptNormal = { bg = colors.mantle },
            TelescopePromptBorder = { bg = colors.mantle, fg = colors.mantle },
            TelescopePromptTitle = { bg = colors.mauve, fg = colors.crust },
            TelescopePromptPrefix = { bg = colors.mantle, fg = colors.mauve },
            TelescopePreviewTitle = { bg = colors.teal, fg = colors.crust },
            TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
            TelescopeResultsTitle = { bg = colors.lavender, fg = colors.crust },
            TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
            TelescopeSelection = { bg = colors.surface0, fg = colors.text },
            TelescopeSelectionCaret = { bg = colors.surface0, fg = colors.mauve },
            TelescopeMatching = { fg = colors.peach, bold = true },
        }
    end,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = false,
        telescope = { enabled = true, style = "nvchad" },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

vim.cmd.colorscheme("catppuccin")
