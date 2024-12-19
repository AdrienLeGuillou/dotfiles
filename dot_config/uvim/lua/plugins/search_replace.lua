return {
  {
    'MagicDuck/grug-far.nvim',
    opts = {},
    keys = {
      { "<leader>sg", "<CMD>GrugFar<CR>",  desc = "Search & Replace" },
      { "<leader>sg", ":<C-U>'<,'>GrugFar<CR>",  desc = "Search & Replace", mode = "v"},
    },
  }
}
