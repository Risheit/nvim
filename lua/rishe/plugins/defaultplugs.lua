return {
    'sitiom/nvim-numbertoggle',
    {
        'nvim-treesitter/nvim-treesitter-context',
        event = { 'BufReadPre', 'BufNewFile' },
        config = true,
    },
    {
        'numToStr/Comment.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        config = true,
    },
    {
        'Darazaki/indent-o-matic',
        config = true,
    },
}
