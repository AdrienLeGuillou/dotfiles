return {
  {
    'alexghergh/nvim-tmux-navigation',
    opts = {},
    keys = {
      { "<A-h>", "<CMD>NvimTmuxNavigateLeft<CR>", mode = {"n", "t"} },
      { "<A-j>", "<CMD>NvimTmuxNavigateDown<CR>", mode = {"n", "t"} },
      { "<A-k>", "<CMD>NvimTmuxNavigateUp<CR>", mode = {"n", "t"} },
      { "<A-l>", "<CMD>NvimTmuxNavigateRight<CR>", mode = {"n", "t"} },
      { "<A-h>", "<ESC><CMD>NvimTmuxNavigateLeft<CR>", mode = {"i"} },
      { "<A-j>", "<ESC><CMD>NvimTmuxNavigateDown<CR>", mode = {"i"} },
      { "<A-k>", "<ESC><CMD>NvimTmuxNavigateUp<CR>", mode = {"i"} },
      { "<A-l>", "<ESC><CMD>NvimTmuxNavigateRight<CR>", mode = {"i"} },
    }
  },
}
