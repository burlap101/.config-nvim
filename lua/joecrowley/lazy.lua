
require("lazy").setup({
	{ 'TimUntersberger/neogit', dependencies = 'nvim-lua/plenary.nvim' },
	'tpope/vim-fugitive',
	'nvim-lua/plenary.nvim',
	'nvim-lua/popup.nvim',
	'nvim-telescope/telescope.nvim',
	{'nvim-treesitter/nvim-treesitter', build = ":TSUpdate" },
	"Pocco81/auto-save.nvim",
--
--	-- lsp
	'neovim/nvim-lspconfig',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/nvim-cmp',
	'williamboman/nvim-lsp-installer',
	'L3MON4D3/LuaSnip',
	'saadparwaiz1/cmp_luasnip',
	{'leafOfTree/vim-svelte-plugin', run = ":TSInstall css"}, 

	'folke/tokyonight.nvim',
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
	},
	-- DAP
	'mfussenegger/nvim-dap',
	'rcarriga/nvim-dap-ui',
	'theHamsta/nvim-dap-virtual-text',
	'leoluz/nvim-dap-go',
})
