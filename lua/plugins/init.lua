return {
    -- Theme
    { "catppuccin/nvim", name = "catppuccin", priority = 1000,
      config = function()
        require("catppuccin").setup({
          flavour = "macchiato",
          transparent_background = false,
          term_colors = true,
          integrations = {
            blink_cmp = true,
            gitsigns = true,
            indent_blankline = { enabled = true, colored_indent_levels = false },
            mason = true,
            noice = true,
            notify = true,
            nvimtree = true,
            rainbow_delimiters = true,
            telescope = { enabled = true },
            treesitter = true,
            which_key = true,
          },
        })
        vim.cmd.colorscheme("catppuccin")
      end
    },
    'nvim-tree/nvim-web-devicons',


    { 'nvim-treesitter/nvim-treesitter', branch = 'main', build = ':TSUpdate' },

    -- LSP
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "onsails/lspkind.nvim",

    {
      "nvimtools/none-ls.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
          sources = {
            null_ls.builtins.diagnostics.sqlfluff.with({
              extra_args = { "--dialect", "postgres" },
            }),
            null_ls.builtins.formatting.sqlfluff.with({
              extra_args = { "--dialect", "postgres" },
            }),
            null_ls.builtins.formatting.black,
          },
        })
      end,
    }, -- Linting/Formatting
    'nvim-tree/nvim-tree.lua', -- nvim tree
    'f-person/git-blame.nvim', -- Git blame
    'windwp/nvim-ts-autotag', -- Auto tags
    "norcalli/nvim-colorizer.lua", -- hex colours
    "unblevable/quick-scope", -- quickscope
    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'}, -- bufferline
    'terrortylor/nvim-comment', -- nerdcommenter
    "kylechui/nvim-surround", -- surround
    "lewis6991/gitsigns.nvim", -- gitsigns
    {"kdheepak/lazygit.nvim", dependencies = { "nvim-lua/plenary.nvim", }},
    {
      "iamcco/markdown-preview.nvim",
      lazy = false,
      config = function()
        vim.fn["mkdp#util#install"]()
      end,
    },
    {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
      }
    },
    {
    "folke/which-key.nvim",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end
    },

    { "HiPhish/rainbow-delimiters.nvim"},
    {"saghen/blink.cmp"},
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
    {"karb94/neoscroll.nvim"},
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
    { 'alexghergh/nvim-tmux-navigation', config = function()
      require'nvim-tmux-navigation'.setup {
        disable_when_zoomed = true, -- defaults to false
        keybindings = {
            left = "<M-h>",
            down = "<M-j>",
            up = "<M-k>",
            right = "<M-l>",
            last_active = "<M-\\>",
        }
      }
    end
    },
    {'stevearc/overseer.nvim' }
}
