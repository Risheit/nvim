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
}
