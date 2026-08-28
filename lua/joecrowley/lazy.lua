require("lazy").setup({
    {
        'TimUntersberger/neogit',
        dependencies = 'nvim-lua/plenary.nvim'
    },
    'tpope/vim-fugitive',
    'nvim-lua/popup.nvim',
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            "nvim-lua/plenary.nvim",
            "debugloop/telescope-undo.nvim",
        },
    },
    { 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate" },
    --'nvim-treesitter/playground',
    --'p00f/nvim-ts-rainbow',
    'Pocco81/auto-save.nvim',
    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    },


    -- lsp and cmp
    'neovim/nvim-lspconfig',
    {
        'creativenull/efmls-configs-nvim',
        version = 'v1.x.x', -- version is optional, but recommended
        dependencies = { 'neovim/nvim-lspconfig' },
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            "onsails/lspkind.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        }
    },
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    { 'leafOfTree/vim-svelte-plugin',    run = ":TSInstall css" },
    { 'Aietes/esp32.nvim' },
    {
        'j-hui/fidget.nvim',
        opts = {
            notification = {
                window = {
                    winblend = 0,
                }
            }
        }
    },


    -- Themes
    'folke/tokyonight.nvim',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
    },
    { 'rose-pine/neovim',     name = 'rose-pine' },
    { 'rebelot/kanagawa.nvim' },

    -- DAP
    'mfussenegger/nvim-dap',
    'mfussenegger/nvim-dap-python',
    { 'rcarriga/nvim-dap-ui', dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' } },
    'theHamsta/nvim-dap-virtual-text',
    'leoluz/nvim-dap-go',
    { 'folke/neodev.nvim',    opts = {} }, -- provides type checking for dap
    {
        'ray-x/lsp_signature.nvim',
        event = "InsertEnter",
        opts = {
            bind = true,
            hint_enable = false,       -- no inline virtual text, just the floating window
            floating_window = true,
            floating_window_above_cur_line = true,
            handler_opts = { border = "rounded" },
            toggle_key = "<C-s>",      -- manually toggle the signature popup
            select_signature_key = "<C-n>", -- cycle overloads
            move_cursor_key = nil,
        },
    },
})
