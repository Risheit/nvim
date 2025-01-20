return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local builtin = require('telescope.builtin')

		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Search all files' })
		vim.keymap.set('v', '<leader>fg', builtin.grep_string, { desc = 'Search for highlighted text under all files' })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffer' })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Search all help tags' })
	end,
}
