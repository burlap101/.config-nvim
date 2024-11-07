local vim = vim

local nnoremap = function(lhs, rhs, opts)
	vim.keymap.set('n', lhs, rhs, opts or {})
end

-- vim.keymap.set('n', "<leader>u", vim.cmd("UndotreeShow"))
vim.keymap.set('n', "Y", "y$")
vim.keymap.set({ 'n', 'v' }, "<leader>y", "\"+y")
vim.keymap.set('n', "<leader>Y", '"+yy')
vim.keymap.set('n', "<leader>p", '"+p')
nnoremap(
	"<leader>+",
	function() vim.cmd("vertical resize +5") end,
	{ desc = "Vertical resize +5" }
)
nnoremap(
	"<leader>-",
	function() vim.cmd("vertical resize -5") end,
	{ desc = "Vertical resize -5" }
)
nnoremap(
	"<leader>zz",
	function() return vim.api.nvim_buf_delete(0, {}) end,
	{ desc = "Close current buffer" }
)

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

-- Delete all buffers except current
nnoremap("<leader>bo", function()
	vim.cmd("%bdelete!|edit #|normal `")
end)

-- Fugitive
nnoremap("<leader>gj", function()
	vim.cmd("diffget //3")
end)
nnoremap("<leader>gf", function()
	vim.cmd("diffget //2")
end)

-- Oil.nvim
nnoremap(
	"-",
	function()
		vim.cmd("vsplit")
		require("oil").open()
		if vim.api.nvim_win_get_width(0) > 50 then
			vim.api.nvim_win_set_width(0, 50)
		end
	end,
	{ desc = "Oil: Open parent directory." }
)

-- Telescope
local telescope_builtin = require('telescope.builtin')

nnoremap(
	"<C-p>",
	function()
		telescope_builtin.git_files({
			show_untracked = true
		})
	end,
	{ desc = "Telescope: Find files within repo" }
)

nnoremap(
	"<leader>pf",
	function()
		telescope_builtin.find_files({
			hidden = true,
			no_ignore = true,
			no_ignore_parent = true
		})
	end,
	{ desc = "Telescope: Find files everywhere." }
)

nnoremap(
	"<leader>ps",
	function()
		telescope_builtin.grep_string { search = vim.fn.input("Grep for > ") }
	end,
	{ desc = "Telescope: Grep" }
)

nnoremap(
	"<leader>pk",
	function()
		telescope_builtin.keymaps()
	end,
	{ desc = "Telescope: Keymaps" }
)

nnoremap(
	"<leader>pt",
	function()
		telescope_builtin.buffers()
	end,
	{ desc = "Telescope: Buffers" }
)

nnoremap(
	"<leader>pd",
	function()
		telescope_builtin.diagnostics({
			bufnr = 0
		})
	end,
	{ desc = "Telescope: Diagnostics" }
)

nnoremap(
	"<leader>pq",
	function()
		telescope_builtin.quickfix()
	end,
	{ desc = "Telescope: Quickfix list" }
)

nnoremap(
	"<leader>ph",
	function()
		telescope_builtin.help_tags()
	end,
	{ desc = "Telescope: Help tags" }
)

nnoremap(
	"<leader>pn",
	function()
		telescope_builtin.current_buffer_fuzzy_find()
	end,
	{ desc = "Telescope: Fuzzy find in current buffer" }
)

-- DAP
local dap = require('dap')

nnoremap(
	"<leader>b",
	function() dap.toggle_breakpoint() end,
	{ desc = "DAP: Toggle breakpoint" }
)

nnoremap(
	"<leader>B",
	function() dap.clear_breakpoints() end,
	{ desc = "DAP: Clear all breakpoints" }
)

nnoremap(
	"<F5>",
	function() dap.continue() end,
	{ desc = "DAP: Continue" }
)

nnoremap(
	"<F6>",
	function() dap.step_over() end,
	{ desc = "DAP: Step over" }
)

nnoremap(
	"<F7>",
	function() dap.step_into() end,
	{ desc = "DAP: Step into" }
)

nnoremap(
	"<F8>",
	function() dap.step_out() end,
	{ desc = "DAP: Step out" }
)

nnoremap(
	"<F4>",
	function() dap.terminate() end,
	{ desc = "DAP: Terminate session" }
)


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
