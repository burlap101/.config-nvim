local vim = vim
local tree_sitter = require('nvim-treesitter')

local function proj_path()
	return vim.fn.expand('%:h')
end

local function metals_status()
	return vim.g['metals_status']
end

local function tree_sitter_status()
	return tree_sitter.statusline({
		separator = ' 󰁕 '
	})
end

require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_c = { proj_path, 'filename' },
		lualine_x = { tree_sitter_status, 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' }
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {
		lualine_a = {
			{
				'buffers',
				mode = 4
			}
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}
