return {
    {
        'williamboman/mason.nvim',
        event = "VeryLazy",
    },
    {
        'williamboman/mason-lspconfig.nvim',
        event = "VeryLazy",
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            vim.keymap.set("n", "<leader>oo", ":LspZeroFormat<CR>")
        end
    },
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        'hrsh7th/cmp-nvim-lsp',
        event = 'InsertEnter',
    },
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
    },
    {
        'L3MON4D3/LuaSnip',
        event = 'InsertEnter',
    },
    {
        'hrsh7th/cmp-buffer',
        event = 'InsertEnter',
    },
    {
        'hrsh7th/cmp-path',
        event = 'InsertEnter',
    },
    {
        'hrsh7th/cmp-vsnip',
        event = 'InsertEnter',
    },
}
