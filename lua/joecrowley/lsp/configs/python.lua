local lspconfig = require("lspconfig")

lspconfig.pyright.setup {
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
	rootMarkers = { ".git", "pyproject.toml" },
}

lspconfig.ruff.setup {
	init_options = {
		settings = {
			configuration = "pyproject.toml",
			configurationPreferences = "filesystemFirst",
		}
	}
}


