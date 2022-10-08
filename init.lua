vim.opt.exrc = true
vim.opt.errorbells = false
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.smartindent = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.hidden = true
vim.opt.wrap = false
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.swapfile = false
vim.opt.backup = true
vim.opt.undodir = "~/.vim/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.signcolumn = "yes"
vim.opt.list = true
vim.opt.listchars= {
	tab = "| ",
	multispace = "   |"
}
vim.opt.scrolloff=8
vim.opt.hlsearch = false
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.wildignore = vim.opt.wildignore + { "*.pyc", "node_modules" }
vim.opt.updatetime = 50
vim.opt.cmdheight = 1

vim.opt.colorcolumn="100"

vim.g.mapleader = ' '

-- vim.keymap.set('n', "<leader>u", vim.cmd("UndotreeShow"))
vim.keymap.set('n', "Y", "y$")
vim.keymap.set({'n', 'v'}, "<leader>y", "\"+y")
vim.keymap.set('n', "<leader>Y", '"+yy')
vim.keymap.set('n', "<leader>p", '"+p')
-- vim.keymap.set('n', "<C-p>", vim.cmd("Files"))
vim.keymap.set('n', "<leader>+", vim.cmd("vertical resize +5"))
vim.keymap.set('n', "<leader>-", vim.cmd("vertical resize -5"))
vim.keymap.set('n', "<leader>zz", vim.cmd("bd!"))
vim.keymap.set('n', "<leader>bf", vim.cmd("bf"))
vim.keymap.set('n', "<leader>bl", vim.cmd("bl"))
vim.keymap.set('n', "<leader>bn", vim.cmd("bn"))
vim.keymap.set('n', "<leader>bp", vim.cmd("bp"))

-- vim.keymap.set('n', "<leader>gj", vim.cmd("diffget //3"))
-- vim.keymap.set('n', "<leader>gf", vim.cmd("diffget //2"))
--
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
	group = yank_group,
	pattern = '*',
	callback = function()
		vim.highlight.on_yank({
			higroup = 'IncSearch',
			timeout = 40,
		})
	end,
})

require('joecrowley')

