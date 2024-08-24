local map = vim.keymap.set

map('n', '<leader>pp', vim.cmd.Ex, { desc = 'Exits to netrw.' })

map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up.' })
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down.' })

map('n', 'J', 'mzJ`z', { desc = 'Join the line down' })
map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll window downwards in the buffer' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll window upwards in the buffer' })
map('n', 'n', 'nzzzv', { desc = 'Repeat the latest "/" or "?".' })
map('n', 'N', 'Nzzzv', { desc = 'Rpeat the latest "/" or "?" in the opposite direction.' })

map('n', 'U', '<C-r>', { desc = 'Undo' })

map('x', '<leader>p', '"_dP', { desc = 'Paste over selection.' })

map({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Copy to system clipboard.' })
map('n', '<leader>Y', '"+Y', { desc = 'Copy line to system clipboard.' })

map({ 'n', 'v' }, '<leader>d', [['_d]], { desc = 'Exits to netrw' })

map(
  'n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = 'Find and replace the word under the cursor.' }
)

map('n', 'Q', '<nop>') -- Remove Q

map('v', '>', '>gv', { desc = 'Increase indent.' })
map('v', '<', '<gv', { desc = 'Decrease indent.' })
