local later, now = Config.later, Config.now

later(function()
  vim.pack.add({ 'https://github.com/folke/snacks.nvim' })
  require('snacks').setup({
    picker = { enabled = true },
    terminal = { enabled = true },
    explorer = { enabled = true },
  })
end)
