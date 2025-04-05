local lspconfig = require("lspconfig")

-- EFM lang server using efmls configs
local function generate_efm_config()
	local eslint = require('efmls-configs.linters.eslint')
	local prettier = require('efmls-configs.formatters.prettier')
	local biome_f = require('efmls-configs.formatters.biome')
	local mypy = require('efmls-configs.linters.mypy')
	local languages = {
		typescript = { eslint, prettier, biome_f },
		javascript = { eslint, prettier, biome_f },
		python = { mypy },
	}

	return {
		filetypes = vim.tbl_keys(languages),
		settings = {
			rootMarkers = { '.git/' },
			languages = languages,
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
		},
	}
end

lspconfig.efm.setup(generate_efm_config());
