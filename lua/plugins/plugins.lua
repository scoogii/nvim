local plugins = {
  -- Theme
  "catppuccin/nvim", as = "catppuccin",
  "nvim-tree/nvim-web-devicons",

  {"nvim-telescope/telescope.nvim", tag = '0.1.2', dependencies = { {'nvim-lua/plenary.nvim'} }},  -- <leader>ff / <C-p>
  {"windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end },-- autopairs
  {"nvim-treesitter/nvim-treesitter", build = ':TSUpdate'},

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

  {"jose-elias-alvarez/null-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" }}, -- Linting/Static Type Checking
  {"nvim-lualine/lualine.nvim", dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }},  -- Lualine
  "nvim-tree/nvim-tree.lua", -- nvim tree
  "f-person/git-blame.nvim", -- Git blame
  "p00f/nvim-ts-rainbow", -- Rainbow parentheses
  "windwp/nvim-ts-autotag", -- Auto tags
  "norcalli/nvim-colorizer.lua", -- hex colours
  "unblevable/quick-scope", -- quickscope
  {"akinsho/bufferline.nvim", tag = "*", dependencies = 'nvim-tree/nvim-web-devicons'}, -- bufferline
  "terrortylor/nvim-comment", -- nerdcommenter
  {"kylechui/nvim-surround", config = function() require("nvim-surround").setup({}) end}, -- surround
  "lewis6991/gitsigns.nvim", -- gitsigns
  {"kdheepak/lazygit.nvim", dependencies = { "nvim-lua/plenary.nvim", }},
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
local opts = {}

require("lazy").setup(plugins, opts)
