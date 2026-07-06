Config.later(function()
  vim.pack.add({
    'https://github.com/jghauser/mkdir.nvim',
    'https://github.com/nvim-tree/nvim-tree.lua',
  })

  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  require('nvim-tree').setup()
  vim.cmd.packadd('nvim.undotree')

  -- keymaps
  table.insert(Config.leader_group_clues, { mode = 'n', keys = '<Leader>f', desc = '+Files' })
  vim.keymap.set('n', '<leader>fs', '<CMD>w<CR>', { desc = 'Save file' })
  vim.keymap.set('n', '<leader>fd', '<CMD>lua MiniFiles.open()<CR>', { desc = 'Directory' })
  vim.keymap.set('n', '<leader>fu', '<CMD>Undotree<CR>', { desc = 'Toggle undotree' })
  vim.keymap.set('n', '<leader>ft', '<CMD>NvimTreeToggle<CR>', { desc = 'Toggle file tree' })
end)
