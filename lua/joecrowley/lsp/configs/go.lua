vim.lsp.config("gopls", {
	cmd = { "gopls", "serve" },
})

vim.lsp.enable("gopls", true)
