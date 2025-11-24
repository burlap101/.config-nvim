local lspconfig = require("lspconfig")

lspconfig.rust_analyzer.setup {
    settings = {
        -- The following entered in to deal with shared workspaces
        ["rust-analyzer"] = {
            cargo = {
                autoreload = true,
                allFeatures = true,
                features = { "dev-tools" }
            },
            procMacro = {
                enable = true
            },
        }
    }
}
