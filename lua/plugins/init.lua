return {
    -- Theme
    { "catppuccin/nvim", name = "catppuccin" },
    'nvim-tree/nvim-web-devicons',

    { 'nvim-telescope/telescope.nvim', version = '0.1.2', dependencies = { {'nvim-lua/plenary.nvim'} } }, -- <leader>ff / <C-p>
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

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

    { "jose-elias-alvarez/null-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" }, }, -- Linting/Static Type Checking
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
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    { "HiPhish/rainbow-delimiters.nvim"},
}
