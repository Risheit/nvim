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
		local opts = { reuse_win = true }

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
		vim.keymap.set('n', '<leader>fr', function()
			vim.lsp.buf.references(nil, opts)
		end, { desc = 'Find function references' })
		vim.keymap.set('n', '<leader>fi', function()
			vim.lsp.buf.implementation(opts)
		end, { desc = 'Go to function implementation' })
		vim.keymap.set('n', '<leader>fd', function()
			vim.lsp.buf.definition(opts)
		end, { desc = 'Go to function definition' })
		vim.keymap.set('n', '<leader>ft', function()
			vim.lsp.buf.type_definition(opts)
		end, { desc = 'Go to type definition' })
	end,
}
