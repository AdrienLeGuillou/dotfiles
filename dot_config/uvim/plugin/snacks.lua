Config.now(function()
  vim.pack.add({
    'https://github.com/folke/snacks.nvim',
  })

  require('snacks').setup({
      picker = {},
      terminal = {},
  })

  vim.keymap.set({ "", "!", "t" }, '<C-\\>', function() Snacks.terminal.toggle() end, { desc = 'Find Files' })

   -- picker
  vim.keymap.set('n', '<leader>ff', function() Snacks.picker.files() end, { desc = 'Find Files' })
  vim.keymap.set('n', '<leader>fF', function() Snacks.picker.files({ignored = true, hidden = true}) end, { desc = 'Find Files (Show All)' })
  vim.keymap.set('n', '<leader>bb', function() Snacks.picker.buffers() end, { desc = 'List Buffers' })
  vim.keymap.set('n', '<leader>se', function() Snacks.picker.command_history() end, { desc = 'Search Command History' })
  vim.keymap.set('n', '<leader>dl', function() Snacks.picker.diagnostics_buffer() end, { desc = 'List Buffer Diagnostics' })
  vim.keymap.set('n', '<leader>dL', function() Snacks.picker.diagnostics() end, { desc = 'List All Diagnostics' })
  vim.keymap.set('n', '<leader>sf', function() Snacks.picker.grep() end, { desc = 'Search in Files' })
  vim.keymap.set('n', '<leader>sl', function() Snacks.picker.lines() end, { desc = 'Search in Buffer' })
  vim.keymap.set('n', '<leader>so', function() Snacks.picker.qflist() end, { desc = 'Search the quickfix list' })
  vim.keymap.set('n', '<leader>sh', function() Snacks.picker.help() end, { desc = 'Search Help' })
  vim.keymap.set('n', '<leader>ft', function() Snacks.explorer.open() end, { desc = 'Explorer' })

end)
