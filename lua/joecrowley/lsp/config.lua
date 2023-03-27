-- Setup language servers.
local lspconfig = require('lspconfig')

lspconfig.gopls.setup {
	cmd = { "gopls", "serve" },
}
lspconfig.hls.setup {
	filetypes = { "haskell", "lhaskell", "cabal", "hs" },
	settings = {
		formattingProvider = "fourmolu"
	},
}
lspconfig.denols.setup {
	root_dir = vim.fs.dirname(vim.fs.find({ 'deno.json', 'deno.jsonc' }, { upward = true })[1]),
	init_options = {
		lint = true,
	},
}
lspconfig.rome.setup {
	root_dir = vim.fs.dirname(vim.fs.find({ 'package.json' }, { upward = true })[1]),
	init_options = {
		lint = true,
	},
}
lspconfig.sumneko_lua.setup {
	settings = {
		Lua = {
			runtime = {
				version = _VERSION,
			},
		},
	},
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
		print(client.name, 'attached')

		if client.name == "hls" then
			vim.bo[ev.buf].tabstop = 8
			vim.bo[ev.buf].softtabstop = 2
			vim.bo[ev.buf].shiftwidth = 2
		end

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
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
