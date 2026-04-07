Config.later(function()
  vim.pack.add({ 'https://github.com/MagicDuck/grug-far.nvim' })

  vim.keymap.set('n', '<leader>sg', '<CMD>GrugFar<CR>', { desc = 'Search & Replace'})
  vim.keymap.set('v', '<leader>sg', ":<C-U>'<,'>GrugFar<CR>", { desc = 'Search & Replace'})
end)
