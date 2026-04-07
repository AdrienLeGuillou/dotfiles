Config.leader_group_clues = {}

vim.keymap.set('n', '<leader><tab>', '<C-^>', { desc = 'Alternate Buffer'})


vim.keymap.set('n', '<leader>qq', '<cmd>confirm quitall<CR>', { desc = 'Confirm quit-all'})


table.insert(Config.leader_group_clues,
             { mode = 'n', keys = '<Leader>b', desc = '+Buffers' })

table.insert(Config.leader_group_clues,
             { mode = 'n', keys = '<Leader>s', desc = '+Search' })
vim.keymap.set('n', '<leader>sc', '<cmd>nohl<CR>', { desc = 'Clear highlight'})


table.insert(Config.leader_group_clues,
             { mode = 'n', keys = '<Leader>i', desc = '+Inserts' })
vim.keymap.set('n', '<leader>id', '<cmd>lua Config.fill_dash() <CR>', { desc = 'Insert dashes' })
vim.keymap.set('n', '<leader>iT', '<cmd>read !date<CR>', { desc = 'Insert timestamp' })

table.insert(Config.leader_group_clues,
             { mode = 'n', keys = '<Leader>t', desc = '+Toggles' })
vim.keymap.set('n', '<leader>tw', '<cmd>set wrap!<CR>', { desc = 'Toggle line wrap' })
vim.keymap.set('n', '<leader>ts', '<cmd>set spell!<CR>', { desc = 'Toggle spell checking' })

-- stylua: ignore end

-- s/.*"\(.*\)",.*"\(.*\)",.*desc = .*"\(.*\)".*/vim.keymap.set('n', '\1', '\2', { desc = '\3' })
