vim.opt.exrc = true
vim.opt.errorbells = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.hidden = true
vim.opt.wrap = false
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.signcolumn = "yes"
vim.opt.list = true
vim.opt.listchars = {
	tab = "| ",
	multispace = "   |"
}
vim.opt.scrolloff = 8
vim.opt.hlsearch = false
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.wildignore = vim.opt.wildignore + { "*.pyc", "node_modules" }
vim.opt.updatetime = 50
vim.opt.cmdheight = 1

vim.opt.colorcolumn = "100"

vim.g.mapleader = " "
--

require('joecrowley')
-- end

