vim.lsp.config("rust_analyzer", {
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
})

vim.lsp.enable("rust_analyzer", true)
