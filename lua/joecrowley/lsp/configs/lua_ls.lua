local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
				return
			end
		end
		-- Check to see if working on neovim conf
		if not string.match(vim.uv.cwd() or "", "/home/.*%.config/nvim") then
			client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
				runtime = {
					version = 'Lua 5.4',
					path = {
						'?.lua',
						'?/init.lua',
						vim.fn.expand '~/.luarocks/share/lua/5.4/?.lua',
						vim.fn.expand '~/.luarocks/share/lua/5.4/?/init.lua',
						'/usr/share/5.4/?.lua',
						'/usr/share/5.4/?/init.lua'
					},
				},
				workspace = {
					library = {
						vim.fn.expand '~/.luarocks/share/lua/5.4',
						'/usr/share/lua/5.4'
					}
				}
			})
		end
	end,
	settings = {
		Lua = {
			diagnostics = {
				disable = { "missing-fields" },
			}
		}
	}
}

