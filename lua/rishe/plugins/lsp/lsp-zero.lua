return {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v4.x',
	event = 'InsertEnter',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		{
			'L3MON4D3/LuaSnip',
			event = 'InsertEnter',
		},
	},
	config = function()
		local lsp_zero = require('lsp-zero')

		lsp_zero.extend_lspconfig({
			sign_text = true,
			capabilities = require('cmp_nvim_lsp').default_capabilities(),
		})

		lsp_zero.on_attach(function(client, bufnr)
			lsp_zero.default_keymaps({ buffer = bufnr }) -- set to default key maps
			lsp_zero.highlight_symbol(client, bufnr)

			local lsp = vim.lsp

			local function quickfix()
				lsp.buf.code_action({
					filter = function(a)
						return a.isPreferred
					end,
					apply = true,
				})
			end

			local set = vim.keymap.set

			set('n', '<leader>rr', function()
				lsp.buf.rename()
			end, { buffer = bufnr, desc = 'Rename the selected variable' })
			set('n', '<leader>lp', function()
				lsp.diagnostic.goto_prev()
			end, { buffer = bufnr, desc = 'Go to previous error' })
			set('n', '<leader>ln', function()
				lsp.diagnostic.goto_next()
			end, { buffer = bufnr, desc = 'Go to next error' })
			set('n', '<leader>qf', quickfix, { buffer = bufnr, desc = 'Apply quickfix to error' })
		end)
	end,
}
