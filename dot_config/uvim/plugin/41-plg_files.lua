Config.later(function()
  vim.pack.add({
    'https://github.com/jghauser/mkdir.nvim',
    'https://github.com/nvim-tree/nvim-tree.lua',
  })

  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  require('nvim-tree').setup()
  vim.cmd.packadd('nvim.undotree')
end)
