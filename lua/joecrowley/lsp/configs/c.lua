local lspconfig = require("lspconfig")

lspconfig.cmake.setup {
    init_options = {
        format = { enable = true },
        lint = { enable = true },
    },
    root_markers = { "CMakeLists.txt" }
}
