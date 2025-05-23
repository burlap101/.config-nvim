require("lazy").setup({
	{
		'TimUntersberger/neogit',
		dependencies = 'nvim-lua/plenary.nvim'
	},
	'tpope/vim-fugitive',
	'nvim-lua/popup.nvim',
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim",
		},
	},
	{ 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate" },
	--'nvim-treesitter/playground',
	--'p00f/nvim-ts-rainbow',
	'Pocco81/auto-save.nvim',
	{
		'stevearc/oil.nvim',
		opts = {},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	},


	-- lsp and cmp
	'neovim/nvim-lspconfig',
	{
		'creativenull/efmls-configs-nvim',
		version = 'v1.x.x', -- version is optional, but recommended
		dependencies = { 'neovim/nvim-lspconfig' },
	},
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		}
	},
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	{ 'leafOfTree/vim-svelte-plugin',    run = ":TSInstall css" },

	-- Themes
	'folke/tokyonight.nvim',
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
	},
	{ 'rose-pine/neovim',     name = 'rose-pine' },

	-- DAP
	'mfussenegger/nvim-dap',
	'mfussenegger/nvim-dap-python',
	{ 'rcarriga/nvim-dap-ui', dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' } },
	'theHamsta/nvim-dap-virtual-text',
	'leoluz/nvim-dap-go',
	{ 'folke/neodev.nvim', opts = {} }, -- provides type checking for dap
})
