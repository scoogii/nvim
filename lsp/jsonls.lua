--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config('jsonls', {
  capabilities = capabilities,
})

return {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = {"json", "jsonc"},
  init_options = { provideFormatter = true },
  root_markers = { ".git" }
}
