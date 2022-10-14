return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	--use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
	use 'tpope/vim-fugitive'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-lua/popup.nvim'
	use 'nvim-telescope/telescope.nvim'
	use('nvim-treesitter/nvim-treesitter', { run = ":TSUpdate" })
	use "Pocco81/auto-save.nvim"

	-- lsp
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/nvim-cmp'
	use 'williamboman/nvim-lsp-installer'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'

	use {
		"catppuccin/nvim",
		as = "catppuccin"
	}

	use 'folke/tokyonight.nvim'
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- DAP
	use 'mfussenegger/nvim-dap'
	use 'rcarriga/nvim-dap-ui'
	use 'theHamsta/nvim-dap-virtual-text'

end
)
