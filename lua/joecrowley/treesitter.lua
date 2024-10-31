require('nvim-treesitter.configs').setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = false },
	rainbow = { enable = true },
	playground = { enable = true },
})
