return {
	'jay-babu/mason-null-ls.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		'williamboman/mason.nvim',
		'nvimtools/none-ls.nvim',
		'nvim-lua/plenary.nvim',
	},
	config = function()
		local mason_null_ls = require('mason-null-ls')
		local null_ls = require('null-ls')

		mason_null_ls.setup({
			ensure_installed = {
				'stylua',
				'jq',
			},
			automatic_installation = false,
			handlers = {},
		})
		null_ls.setup({
			sources = {
				-- Anything not supported by mason.
			},
		})

		vim.keymap.set('n', '<leader>oo', function()
			vim.lsp.buf.format()
		end, { desc = 'Format this file' })
	end,
}
