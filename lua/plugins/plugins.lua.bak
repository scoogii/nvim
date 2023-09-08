local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Theme
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'nvim-tree/nvim-web-devicons'

    use { 'nvim-telescope/telescope.nvim', tag = '0.1.2', requires = { {'nvim-lua/plenary.nvim'} } } -- <leader>ff / <C-p>
    use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end } -- autopairs
    use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    -- LSP
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "onsails/lspkind.nvim",
    }

    use { "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" }, } -- Linting/Static Type Checking
    use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } } -- Lualine
    use 'nvim-tree/nvim-tree.lua' -- nvim tree
    use 'f-person/git-blame.nvim' -- Git blame
    use 'p00f/nvim-ts-rainbow' -- Rainbow parentheses
    use 'windwp/nvim-ts-autotag' -- Auto tags
    use "norcalli/nvim-colorizer.lua" -- hex colours
    use "unblevable/quick-scope" -- quickscope
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'} -- bufferline
    use 'terrortylor/nvim-comment' -- nerdcommenter
    use({ "kylechui/nvim-surround", config = function() require("nvim-surround").setup({}) end }) -- surround
    use("lewis6991/gitsigns.nvim") -- gitsigns
    use({"kdheepak/lazygit.nvim", requires = { "nvim-lua/plenary.nvim", },})

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
