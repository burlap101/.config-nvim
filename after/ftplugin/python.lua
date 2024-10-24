-- Debugging setup
local dap_python = require('dap-python')

dap_python.setup('$HOME/.opt/pyenv/shims/python')
dap_python.test_runner = 'pytest'

vim.keymap.set("n", "<F3>", function()
	dap_python.test_method()
end)

