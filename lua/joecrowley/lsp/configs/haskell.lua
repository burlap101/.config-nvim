vim.lsp.config("hls", {
	filetypes = { "haskell", "lhaskell", "cabal", "hs" },
	settings = {
		formattingProvider = "fourmolu"
	},
})

vim.lsp.enable("hls", true)

