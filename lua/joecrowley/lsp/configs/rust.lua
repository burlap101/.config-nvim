vim.lsp.config("rust_analyzer", {
    settings = {
        -- The following entered in to deal with shared workspaces
        ["rust-analyzer"] = {
            cargo = {
                autoreload = true,
                allFeatures = true,
                features = "all",
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
            check = {
                command = "clippy",
                extraArgs = { "--no-deps" },
            },
            workspace = {
                symbol = {
                    search = {
                        scope = "workspace_and_dependencies",
                    },
                },
            },
        }
    }
})

vim.lsp.enable("rust_analyzer", true)
