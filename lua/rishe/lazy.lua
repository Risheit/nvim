local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('rishe.plugins')

-- LSP Settings b/c getting them working in lsp.lua is more effort than I'm willing to put in.
local lsp_zero = require('lsp-zero')
lsp_zero.extend_lspconfig()

lsp_zero.on_attach(function(_, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })

	local function quickfix()
		vim.lsp.buf.code_action({
			filter = function(a)
				return a.isPreferred
			end,
			apply = true,
		})
	end

	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set('n', '<leader>rr', function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set('n', '<leader>lp', function()
		vim.lsp.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set('n', '<leader>ln', function()
		vim.lsp.diagnostic.goto_next()
	end, opts)
	vim.keymap.set('n', '<leader>qf', quickfix, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { 'clangd', 'tsserver', 'rust_analyzer' },
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require('lspconfig').lua_ls.setup(lua_opts)
		end,
	},
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'path' },
		{ name = 'buffer' },
	},
	formatting = lsp_zero.cmp_format(),
	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<tab>'] = cmp.mapping.confirm({ select = true }),
		['<cr>'] = cmp.mapping.confirm({ select = true }),
		['<C-Space>'] = cmp.mapping.complete(),
	},
})

require('lspconfig').clangd.setup({})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = 'utf-8'
require('lspconfig').clangd.setup({ capabilities = capabilities })
