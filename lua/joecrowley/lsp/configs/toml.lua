vim.lsp.config("taplo", {
    filetypes = { 'toml' },
    root_dir = require('lspconfig.util').root_pattern('*.toml', '.git')
})

vim.lsp.enable("taplo", true)
