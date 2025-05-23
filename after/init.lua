local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local buf_set_option = vim.api.nvim_buf_set_option
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
	vim.keymap.set('n', lhs, rhs, opts or {} )
end

local telescope_builtin = require('telescope.builtin')

nnoremap("<C-p>", function() 
	telescope_builtin.git_files()
end)

nnoremap("<leader>pf", function()
	telescope_builtin.find_files()
end)

nnoremap("<leader>ps", function()
	telescope_builtin.grep_string { search = vim.fn.input("Grep for > "), hidden = true}
end)

nnoremap("<leader>pk", function()
	telescope_builtin.keymaps()
end)


