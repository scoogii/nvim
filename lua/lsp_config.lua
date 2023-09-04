-- Autocomplete
local cmp = require("cmp")
cmp.setup {
  completion = {
      completeopt = 'menu,menuone,noinsert,noselect'
  },
  sources = {
    { name = 'nvim_lsp' }
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
}

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()


-- LSP related
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {"lua_ls", "clangd", "cssls", "eslint", "html", "pyright", "tsserver"}
})

local on_attach = function(_, _)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
end


-- Lua
require("lspconfig").lua_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = {'vim'}
            }
        }
    }
}

-- C
require("lspconfig").clangd.setup {
    capabilities = capabilities,
    on_attach = on_attach
}

-- CSS
require("lspconfig").cssls.setup {
    capabilities = capabilities,
    on_attach = on_attach
}

-- eslint
require("lspconfig").eslint.setup {
    capabilities = capabilities,
    on_attach = on_attach
}

-- html
require("lspconfig").html.setup {
    capabilities = capabilities,
    on_attach = on_attach
}

-- pyright
require("lspconfig").pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach
}

-- ts
require("lspconfig").tsserver.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
