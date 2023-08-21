local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("joecrowley.lsp.handlers").on_attach,
		capabilities = require("joecrowley.lsp.handlers").capabilities,
	}

	if server.name == "jsonls" then
		local jsonls_opts = require("joecrowley.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server.name == "sumneko_lua" then
		local sumneko_opts = require("joecrowley.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server.name == "pyright" then
		local pyright_opts = require("joecrowley.lsp.settings.pyright")
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end

	if server.name == "gopls" then
		local gopls_opts = require("joecrowley.lsp.settings.gopls")
		opts = vim.tbl_deep_extend("force", gopls_opts, opts)
	end

	if server.name == "svelte" then
		local svelte_opts = require("joecrowley.lsp.settings.svelte")
		opts = vim.tbl_deep_extend("force", svelte_opts, opts)
	end

	if server.name == "hls" then
		local hls_opts = require("joecrowley.lsp.settings.hls")
		opt = vim.tbl_deep_extend("force", hls_opts, opts)
	end

	if server.name == "denols" then
		local denols_opts = require("joecrowley.lsp.settings.hls")
		opt = vim.tbl_deep_extend("force", denols_opts, opts)
	end
	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
