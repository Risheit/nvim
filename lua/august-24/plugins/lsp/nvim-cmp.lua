return {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	dependencies = {
		{
			'VonHeikemen/lsp-zero.nvim',
			branch = 'v4.x',
			event = 'InsertEnter',
		},
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/vim-vsnip',
		'hrsh7th/cmp-nvim-lsp-signature-help',
	},
	config = function()
		local cmp = require('cmp')
		local lsp_zero = require('lsp-zero')
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'nvim_lsp_signature_help' },
				{ name = 'vsnip' },
				{ name = 'buffer' },
				{ name = 'path' },
			},
			formatting = lsp_zero.cmp_format(),
			mapping = {
				['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
				['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
				['<tab>'] = cmp.mapping.confirm({ select = true }),
				['<cr>'] = cmp.mapping.confirm({ select = true }),
				['<C-Space>'] = cmp.mapping.complete(), -- trigger completion menu
			},
		})
	end,
}
