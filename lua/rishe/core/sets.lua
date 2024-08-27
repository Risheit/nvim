local set = vim.keymap.set

set('n', '<leader>pp', vim.cmd.Ex, { desc = 'Exits to netrw' })

set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })
set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })

set('n', 'J', 'mzJ`z', { desc = 'Join the line down' })
set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll window downwards in the buffer' })
set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll window upwards in the buffer' })
set('n', 'n', 'nzzzv', { desc = 'Repeat the latest "/" or "?"' })
set('n', 'N', 'Nzzzv', { desc = 'Rpeat the latest "/" or "?" in the opposite direction' })

set('n', 'U', '<C-r>', { desc = 'Undo' })

set('x', '<leader>p', '"_dP', { desc = 'Paste over selection' })

set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
set('n', '<leader>Y', '"+Y', { desc = 'Copy rest of line to system clipboard' })

set({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete without yanking' })
set({ 'n', 'v' }, '<leader>D', '"_D', { desc = 'Delete rest of line without yanking' })

set(
	'n',
	'<leader>s',
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = 'Find and replace the word under the cursor' }
)

set('n', 'Q', '<nop>') -- Remove Q

set('v', '>', '>gv', { desc = 'Increase indent' })
set('v', '<', '<gv', { desc = 'Decrease indent' })
