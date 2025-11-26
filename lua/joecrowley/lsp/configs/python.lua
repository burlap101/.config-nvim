vim.lsp.config("pyright", {
	settings = {
		pyright = {
			disableOrganizeImports = true,
			openFilesOnly = false,
		},
		python = {
			analysis = {
				autoImportCompletions = false,
				diagnosticMode = "openFilesOnly",
				typeCheckingMode = "off",
			}
		},
	},
	rootMarkers = { ".git/", "pyproject.toml", ".venv/" },
})

vim.lsp.config("ruff", {
	init_options = {
		settings = {
			configuration = "pyproject.toml",
			configurationPreferences = "filesystemFirst",
		}
	}
})

vim.lsp.enable("pyright", true)
vim.lsp.enable("ruff", true)


