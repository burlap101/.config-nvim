---@return [string]
local function root_marker()
    if vim.fs.find("buf.yaml", {})[1] then
        return { 'buf.yaml' }
    end
    return { '.git/' }
end

vim.lsp.config('buf_ls', {
    cmd = { 'buf', 'lsp', 'serve' },
    filetypes = { 'proto', 'buf-config' },
    root_markers = { 'buf.yaml', '.git/' },
})

vim.lsp.enable("buf_ls", true)
