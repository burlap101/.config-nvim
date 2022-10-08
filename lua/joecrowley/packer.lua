return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' 
	use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
	use 'nvim-lua/plenary.nvim'
	use 'nvim-lua/popup.nvim'
	use 'nvim-telescope/telescope.nvim'
end)


