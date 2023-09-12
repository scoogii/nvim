-- Autocomplete
local cmp = require("cmp")

local luasnip = require("luasnip")
local lsp_symbols = {
    Text = "   (Text) ",
    Method = "   (Method)",
    Function = "   (Function)",
    Constructor = "   (Constructor)",
    Field = " ﴲ  (Field)",
    Variable = "[] (Variable)",
    Class = "   (Class)",
    Interface = " ﰮ  (Interface)",
    Module = "   (Module)",
    Property = " 襁 (Property)",
    Unit = "   (Unit)",
    Value = "   (Value)",
    Enum = " 練 (Enum)",
    Keyword = "   (Keyword)",
    Snippet = "   (Snippet)",
    Color = "   (Color)",
    File = "   (File)",
    Reference = "   (Reference)",
    Folder = "   (Folder)",
    EnumMember = "   (EnumMember)",
    Constant = " ﲀ  (Constant)",
    Struct = " ﳤ  (Struct)",
    Event = "   (Event)",
    Operator = "   (Operator)",
    TypeParameter = "   (TypeParameter)",
}

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<cr>"] = cmp.mapping.confirm({select = true}),
        ["<s-tab>"] = cmp.mapping.select_prev_item(),
        ["<tab>"] = cmp.mapping.select_next_item(),
        ["<C-e>"] = cmp.mapping.close(),
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        format = function(entry, item)
            item.kind = lsp_symbols[item.kind]
            item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
            })[entry.source.name]

            return item
        end,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
    },
})

vim.cmd([[
augroup NvimCmp
au!
au FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
augroup END
]])

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

-- vimls
require("lspconfig").vimls.setup {
    capabilities = capabilities,
    on_attach = on_attach
}

-- JSON
require("lspconfig").jsonls.setup {
    capabilities = capabilities,
    on_attach = on_attach
}

-- Bash
require("lspconfig").bashls.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
