require('nvim-dap-virtual-text').setup()
require('dap-go').setup()
require('dapui').setup()
require('neodev').setup({
	library = { plugins = { 'nvim-dap-ui' }, types = true },
})

local dap, dapui = require('dap'), require('dapui')
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

--table.insert(dap.configurations.python, {
--	justMyCode = false,
--})
