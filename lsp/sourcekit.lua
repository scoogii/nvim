return {
  cmd = { 'sourcekit-lsp' },
  filetypes = { 'swift', 'objc', 'objcpp', 'c', 'cpp' },
  root_markers = {
    'Package.swift',
    '.git',
    'compile_commands.json',
    'buildServer.json',
  },
}
