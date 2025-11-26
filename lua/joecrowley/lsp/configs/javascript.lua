-- Helper function to check if a dependency exists in the project's node_modules
local function is_dependency_installed(dependency)
	local cwd = vim.fn.getcwd()
	local package_json_path = cwd .. '/package.json'
	if vim.fn.filereadable(package_json_path) == 0 then
		return false
	end

	local package_json = vim.fn.json_decode(vim.fn.readfile(package_json_path))
	local dev_dependencies = package_json.devDependencies or {}
	local dependencies = package_json.dependencies or {}

	return dev_dependencies[dependency] ~= nil or dependencies[dependency] ~= nil
end

-- Configure tsserver
vim.lsp.config("ts_ls", {
	---Disable formatting for ts_ls if certain formatters installed
	---@param client vim.lsp.Client
	on_attach = function(client)
		-- Disable tsserver formatting if prettier or biome is present
		if is_dependency_installed('prettier') or is_dependency_installed('@biomejs/biome') then
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
		end
	end,
})

vim.lsp.enable("ts_ls", true)
vim.lsp.enable("biome", true)
