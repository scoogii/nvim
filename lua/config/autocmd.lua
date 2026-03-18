local autocmd = vim.api.nvim_create_autocmd

-- For filetypes that use 2 space indent
autocmd("FileType", {
  pattern = {
    "vim",
    "html",
    "css",
    "javascript",
    "javascriptreact",
    "markdown.mdx",
    "typescript",
    "typescriptreact",
    "lua",
    "sh",
    "zsh",
  },
  callback = function()
    vim.opt.shiftwidth = 2
    vim.opt.softtabstop = 2
    vim.opt.tabstop = 2
  end,
})

-- JSON
autocmd("FileType", {
  pattern = {
    "json"
  },
  callback = function()
    vim.opt.tabstop=2
    vim.opt.shiftwidth=2
    vim.opt.expandtab=true
  end,
})

-- Lsp
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function(event)
        local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        -- defaults:
        -- https://neovim.io/doc/user/news-0.11.html#_defaults

        map("gl", vim.diagnostic.open_float, "Open Diagnostic Float")
        map("K", vim.lsp.buf.hover, "Hover Documentation")
        map("gs", vim.lsp.buf.signature_help, "Signature Documentation")
        map("gD", vim.lsp.buf.declaration, "Goto Declaration")
        map("<leader>la", vim.lsp.buf.code_action, "Code Action")
        map("<leader>lr", vim.lsp.buf.rename, "Rename all references")
        map("<leader>lf", vim.lsp.buf.format, "Format")
        map("<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Goto Definition in Vertical Split")

        local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
                return client:supports_method(method, bufnr)
            else
                return client.supports_method(method, { bufnr = bufnr })
            end
        end

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })

            -- When cursor stops moving: Highlights all instances of the symbol under the cursor
            -- When cursor moves: Clears the highlighting
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            -- When LSP detaches: Clears the highlighting
            vim.api.nvim_create_autocmd('LspDetach', {
                group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
                end,
            })
        end
    end,

})

-- SQL
autocmd("FileType", {
  pattern = "sql",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.expandtab = true
  end,
})

-- Clojure
autocmd("FileType", {
  pattern = "clojure",
  callback = function ()
    vim.opt_local.iskeyword:remove(".")
    vim.opt_local.iskeyword:append({ "?", "!", ":", "/", ";" })
  end,
})

-- Handle zipfile:// URIs for clojure-lsp jar navigation
autocmd("BufReadCmd", {
  pattern = "zipfile://*",
  callback = function(ev)
    local uri = ev.match
    local jar_path, inner_path = uri:match("^zipfile://(.+)::(.+)$")
    if jar_path and inner_path then
      local content = vim.fn.system({ "unzip", "-p", jar_path, inner_path })
      if vim.v.shell_error == 0 then
        local lines = vim.split(content, "\n", { plain = true })
        vim.api.nvim_buf_set_lines(ev.buf, 0, -1, false, lines)
        vim.bo[ev.buf].buftype = "nofile"
        vim.bo[ev.buf].modifiable = false
        vim.bo[ev.buf].filetype = "clojure"
      end
    end
  end,
})
