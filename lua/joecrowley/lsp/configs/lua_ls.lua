vim.lsp.config("lua_ls", {
    on_init = function(client)
        local root = client.workspace_folders and client.workspace_folders[1].name or vim.uv.cwd()

        -- Skip if project has its own .luarc.json
        if vim.uv.fs_stat(root .. "/.luarc.json") or vim.uv.fs_stat(root .. "/.luarc.jsonc") then
            return
        end

        if root:match(vim.fn.stdpath("config")) then
            -- Just add vim to globals, don't replace diagnostics
            local diag = client.config.settings.Lua.diagnostics or {}
            diag.globals = vim.list_extend(diag.globals or {}, { "vim" })
            client.config.settings.Lua.diagnostics = diag

            -- Add Neovim runtime for completion
            client.config.settings.Lua.workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            }
            client.config.settings.Lua.runtime = { version = "LuaJIT" }
        end
    end,
    settings = {
        Lua = {
            diagnostics = {
                disable = { "missing-fields" }, -- your existing default
            },
        },
    },
})

vim.lsp.enable("lua_ls", true)
