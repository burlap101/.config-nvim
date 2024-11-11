-- Setup language servers.
local lspconfig = require('lspconfig')
local vim = vim

lspconfig.gopls.setup {
	cmd = { "gopls", "serve" },
}
lspconfig.hls.setup {
	filetypes = { "haskell", "lhaskell", "cabal", "hs" },
	settings = {
		formattingProvider = "fourmolu"
	},
}
--lspconfig.sparql_ls.setup {}
-- lspconfig.denols.setup {
-- 	root_dir = vim.fs.dirname(vim.fs.find({ 'deno.json', 'deno.jsonc' }, { upward = true })[1]),
-- 	init_options = {
-- 		lint = true,
-- 	},
-- }
lspconfig.pyright.setup {
	settings = {
		pyright = {
			disableOrganizeImports = true,
			openFilesOnly = true,
		},
		python = {
			analysis = {
				autoImportCompletions = false,
				diagnosticMode = "openFilesOnly",
				typeCheckingMode = "off",
				diagnosticSeverityOverrides = {
					reportAttributeAccessIssue = "warning",
				},
			}
		},
	},
	rootMarkers = { ".git", "pyproject.toml" },
}

lspconfig.efm.setup {
    init_options = { documentFormatting = false },
    settings = {
        rootMarkers = { ".venv/", ".git/" },
        languages = {
            python = {
                {
                    lintCommand = "mypy --show-column-numbers",
                    lintFormats = {
                        "%f:%l:%c: %trror: %m",
                        "%f:%l:%c: %tarning: %m",
                        "%f:%l:%c: %tote: %m",
                    },
					lintOnSave = true,
					lintSource = "mypy",
                },
            }
        }
    }
}
lspconfig.jsonls.setup {}
lspconfig.svelte.setup {}
lspconfig.lua_ls.setup {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT'
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME
					-- Depending on the usage, you might want to add additional paths here.
					-- "${3rd}/luv/library"
					-- "${3rd}/busted/library",
				}
				-- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
				-- library = vim.api.nvim_get_runtime_file("", true)
			}
		})
	end,
	settings = {
		Lua = {
			diagnostics = {
				disable = { "missing-fields" },
			}
		}
	}
}
lspconfig.tailwindcss.setup {}
lspconfig.volar.setup {}
--lspconfig.tsserver.setup {}
lspconfig.ruff.setup {
	init_options = {
		settings = {
			configuration = "pyproject.toml",
			configurationPreferences = "filesystemFirst",
		}
	}
}

-- SVELTE GLOBAL
vim.g.vim_svelte_plugin_use_typescript = 1


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client then
			print(client.name, 'attached')
			if client.name == "hls" then
				vim.bo[ev.buf].tabstop = 8
				vim.bo[ev.buf].softtabstop = 2
				vim.bo[ev.buf].shiftwidth = 2
			end
		end

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set({ 'n', 'i', 'c' }, '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<leader>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<leader>ff', function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end
})
