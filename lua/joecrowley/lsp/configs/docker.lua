local lspconfig = require "lspconfig"

lspconfig.docker_compose_language_service.setup {}

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = { "docker-compose.yml", "docker-compose.yaml" },
    callback = function()
        vim.bo.filetype = "yaml.docker-compose"
    end,
})
