local vim = vim

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
vim.keymap.set('n', "<leader>n", function()
	return vim.cmd("Explore")
end)

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

local nnoremap = function(lhs, rhs, opts)
	vim.keymap.set('n', lhs, rhs, opts or {})
end

-- Fugitive
nnoremap("<leader>gj", function()
	vim.cmd("diffget //3")
end)
nnoremap("<leader>gf", function()
	vim.cmd("diffget //2")
end)

-- Telescope
local telescope_builtin = require('telescope.builtin')

nnoremap("<C-p>", function()
	telescope_builtin.git_files({
		show_untracked = true
	})
end)

nnoremap("<leader>pf", function()
	telescope_builtin.find_files({
		hidden = true,
		no_ignore = true,
		no_ignore_parent = true
	})
end)

nnoremap("<leader>ps", function()
	telescope_builtin.grep_string { search = vim.fn.input("Grep for > ") }
end)

nnoremap("<leader>pk", function()
	telescope_builtin.keymaps()
end)

nnoremap("<leader>pt", function()
	telescope_builtin.buffers()
end)

nnoremap("<leader>pd", function()
	telescope_builtin.diagnostics({
		bufnr = 0
	})
end)

nnoremap("<leader>pq", function()
	telescope_builtin.quickfix()
end)

nnoremap("<leader>ph", function()
	telescope_builtin.help_tags()
end)
nnoremap("<leader>pn", function()
	telescope_builtin.current_buffer_fuzzy_find()
end)

local dap = require('dap')

nnoremap("<leader>b", function()
	dap.toggle_breakpoint()
end)

nnoremap("<leader>B", function()
	dap.clear_breakpoints()
end)

nnoremap("<F5>", function()
	dap.continue()
end)

nnoremap("<F6>", function()
	dap.step_over()
end)

nnoremap("<F7>", function()
	dap.step_into()
end)

nnoremap("<F8>", function()
	dap.step_out()
end)

nnoremap("<F4>", function()
	dap.terminate()
end)


-- autobracketing hack

--local inoremap = function(lhs, rhs, opts)
--	opts = opts or {}
--	vim.keymap.set('i', lhs, rhs, opts)
--end
--
--inoremap("(", "()<left>")
--inoremap("[", "[]<left>")
--inoremap("{", "{}<left>")
--inoremap("'", "''<left>")
--inoremap("`", "``<left>")
--inoremap('"', '""<left>')




