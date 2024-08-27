return {
	'williamboman/mason.nvim',
	event = 'VeryLazy',
	dependencies = {
		{
			'VonHeikemen/lsp-zero.nvim',
			branch = 'v4.x',
			event = 'InsertEnter',
		},
		{
			'williamboman/mason-lspconfig.nvim',
			event = 'VeryLazy',
		},
		{
			'neovim/nvim-lspconfig',
			event = { 'BufReadPre', 'BufNewFile' },
		},
	},
	config = function()
		local mason = require('mason')
		local mason_lspconfig = require('mason-lspconfig')
		local lsp_zero = require('lsp-zero')
		local lsp_config = require('lspconfig')

		mason.setup()
		mason_lspconfig.setup({
			ensure_installed = { -- list of servers for mason to install
				'clangd',
				'rust_analyzer',
				'lua_ls',
			},
			handlers = {
				lsp_zero.default_setup, -- default handler
				lua_ls = function()
					local lua_opts = lsp_zero.nvim_lua_ls()
					lsp_config.lua_ls.setup(lua_opts)
				end,
			},
		})
	end,
}
