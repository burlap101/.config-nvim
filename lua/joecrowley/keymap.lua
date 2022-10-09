-- vim.keymap.set('n', "<leader>u", vim.cmd("UndotreeShow"))
vim.keymap.set('n', "Y", "y$")
vim.keymap.set({ 'n', 'v' }, "<leader>y", "\"+y")
vim.keymap.set('n', "<leader>Y", '"+yy')
vim.keymap.set('n', "<leader>p", '"+p')
vim.keymap.set('n', "<leader>+", vim.cmd("vertical resize +5"))
vim.keymap.set('n', "<leader>-", vim.cmd("vertical resize -5"))
vim.keymap.set('n', "<leader>zz", function()
	return vim.api.nvim_buf_delete(0,{})
end)
--vim.keymap.set('n', "<leader>bf", vim.cmd("bf"))
--vim.keymap.set('n', "<leader>bl", vim.cmd("bl"))
--vim.keymap.set('n', "<leader>bn", vim.cmd("bn"))
--vim.keymap.set('n', "<leader>bp", vim.cmd("bp"))
--
---- vim.keymap.set('n', "<leader>gj", vim.cmd("diffget //3"))
---- vim.keymap.set('n', "<leader>gf", vim.cmd("diffget //2"))
----
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local yank_group = augroup('HighlightYank', {})
--
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

local nnoremap = function(lhs, rhs, opts)
	vim.keymap.set('n', lhs, rhs, opts or {})
end

local telescope_builtin = require('telescope.builtin')

nnoremap("<C-p>", function()
	telescope_builtin.git_files()
end)

nnoremap("<leader>pf", function()
	telescope_builtin.find_files()
end)

nnoremap("<leader>ps", function()
	telescope_builtin.grep_string { search = vim.fn.input("Grep for > ") }
end)

nnoremap("<leader>pk", function()
	telescope_builtin.keymaps()
end)
