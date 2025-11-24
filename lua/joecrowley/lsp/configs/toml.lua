local lspconfig = require("lspconfig")

lspconfig.taplo.setup {
    filetypes = { 'toml' },
    root_dir = require('lspconfig.util').root_pattern('*.toml', '.git')
}
