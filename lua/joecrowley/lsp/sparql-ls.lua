local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'

if not configs.sparql_ls then
	configs.sparql_ls = {
		default_config = {
			cmd = { 'sparql-language-server', '--stdio' },
			filetypes = { 'turtle' },
			root_dir = function(fname)
				return lspconfig.util.find_git_ancestor(fname)
			end,
			settings = {},
		},
	}
end

