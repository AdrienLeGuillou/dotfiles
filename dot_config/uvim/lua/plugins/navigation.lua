return {
  {
    'alexghergh/nvim-tmux-navigation',
    opts = {},
    keys = {
      { "<A-h>", "<CMD>NvimTmuxNavigateLeft<CR>", mode = {"n", "t"} },
      { "<A-j>", "<CMD>NvimTmuxNavigateDown<CR>", mode = {"n", "t"} },
      { "<A-k>", "<CMD>NvimTmuxNavigateUp<CR>", mode = {"n", "t"} },
      { "<A-l>", "<CMD>NvimTmuxNavigateRight<CR>", mode = {"n", "t"} },
    }
  },
}
