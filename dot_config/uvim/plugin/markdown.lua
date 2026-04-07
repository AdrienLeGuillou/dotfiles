Config.now_if_args(function()
  vim.pack.add({ 'https://github.com/MeanderingProgrammer/render-markdown.nvim' })

  vim.keymap.set('n', '<leader>tm', '<cmd>RenderMarkdown toggle<CR>', { desc = 'Render markdown'})
end)
