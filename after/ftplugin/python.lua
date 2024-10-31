local vim = vim

vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.autoindent = true

-- Debugging setup
local dap_python = require('dap-python')

dap_python.setup('$HOME/.opt/pyenv/shims/python')
dap_python.test_runner = 'pytest'

vim.keymap.set("n", "<F3>", function()
	dap_python.test_method()
end)

