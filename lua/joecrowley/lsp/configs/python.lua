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
	},
    rootMarkers = { ".git/", "pyproject.toml", ".venv/" },
})

vim.lsp.config("ty", {
    rootMarkers = { ".git/", "pyproject.toml", ".venv/" },
})

vim.lsp.enable("ruff", true)

local function has_ty()
    return vim.fn.executable("ty") == 1
end

-- If ty is installed favour it over pyright.
if has_ty() then
    vim.lsp.enable("ty", true)
    vim.lsp.enable("pyright", false)
else
    vim.lsp.enable("pyright", true)
    vim.lsp.enable("ty", false)
end

