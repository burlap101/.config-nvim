vim.opt.exrc = true
vim.opt.noerrorbells = true
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.smartindent = true
vim.opt.nu = true
vim.opt.hidden = true
vim.opt.nowrap = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.noswapfile = true
vim.opt.nobackup = true
vim.opt.undodir = "~/.vim/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.list = true
vim.opt.lcs= {
	tab = "| ",
	multispace = "|   "
}
vim.opt.scrolloff=8
vim.opt.nohlsearch = true
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.wildignore = vim.opt.wildignore + { "*.pyc", "node_modules" }

vim.global_opt.mapleader = ' '
vim.opt.colorcolumn=100
vim.highlight.color_column = true


vim.keymap.set('n', "<leader>u", vim.cmd("UndotreeShow"))
vim.keymap.set('n', "Y", "y$")
vim.keymap.set({'n', 'v'}, "<leader>y", "\"+y")
vim.keymap.set('n', "<leader>Y", '"+yy')
vim.keymap.set('n', "<leader>p", '"+p')
vim.keymap.set('n', "<C-p>", vim.cmd("Files"))
vim.keymap.set('n', "<leader>+", vim.cmd("vertical resize +5"))
vim.keymap.set('n', "<leader>-", vim.cmd("vertical resize -5"))
vim.keymap.set('n', "<leader>zz", vim.cmd("bd!"))
vim.keymap.set('n', "<leader>bf", vim.cmd("bf"))
vim.keymap.set('n', "<leader>bl", vim.cmd("bl"))
vim.keymap.set('n', "<leader>bn", vim.cmd("bn"))
vim.keymap.set('n', "<leader>bp", vim.cmd("bp"))

vim.keymap.set('n', "<leader>gj", vim.cmd("diffget //3"))
vim.keymap.set('n', "<leader>gf", vim.cmd("diffget //2"))

