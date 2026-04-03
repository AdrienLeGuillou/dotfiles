return {
  -- {
  --   'alexghergh/nvim-tmux-navigation',
  --   enable = false,
  --   opts = {},
  --   keys = {
  --     { "<A-h>", "<CMD>NvimTmuxNavigateLeft<CR>", mode = {"n", "t"} },
  --     { "<A-j>", "<CMD>NvimTmuxNavigateDown<CR>", mode = {"n", "t"} },
  --     { "<A-k>", "<CMD>NvimTmuxNavigateUp<CR>", mode = {"n", "t"} },
  --     { "<A-l>", "<CMD>NvimTmuxNavigateRight<CR>", mode = {"n", "t"} },
  --     { "<A-h>", "<ESC><CMD>NvimTmuxNavigateLeft<CR>", mode = {"i"} },
  --     { "<A-j>", "<ESC><CMD>NvimTmuxNavigateDown<CR>", mode = {"i"} },
  --     { "<A-k>", "<ESC><CMD>NvimTmuxNavigateUp<CR>", mode = {"i"} },
  --     { "<A-l>", "<ESC><CMD>NvimTmuxNavigateRight<CR>", mode = {"i"} },
  --   }
  -- },
  {
    'mrjones2014/smart-splits.nvim',
    lazy = false,
    opts = {},
    keys = {
      { "<A-h>", "<CMD>lua require('smart-splits').move_cursor_left()<CR>", mode = {"n", "t"} },
      { "<A-j>", "<CMD>lua require('smart-splits').move_cursor_down()<CR>", mode = {"n", "t"} },
      { "<A-k>", "<CMD>lua require('smart-splits').move_cursor_up()<CR>", mode = {"n", "t"} },
      { "<A-l>", "<CMD>lua require('smart-splits').move_cursor_right()<CR>", mode = {"n", "t"} },
      { "<A-h>", "<ESC><CMD>lua require('smart-splits').move_cursor_left()<CR>", mode = {"i"} },
      { "<A-j>", "<ESC><CMD>lua require('smart-splits').move_cursor_down()<CR>", mode = {"i"} },
      { "<A-k>", "<ESC><CMD>lua require('smart-splits').move_cursor_up()<CR>", mode = {"n", "t", "i"} },
      { "<A-l>", "<ESC><CMD>lua require('smart-splits').move_cursor_right()<CR>", mode = {"n", "t", "i"} },
      { "<A-left>", "<CMD>lua require('smart-splits').resize_left()<CR>", mode = {"n", "t", "i"} },
      { "<A-down>", "<CMD>lua require('smart-splits').resize_down()<CR>", mode = {"n", "t", "i"} },
      { "<A-up>", "<CMD>lua require('smart-splits').resize_up()<CR>", mode = {"n", "t", "i"} },
      { "<A-right>", "<CMD>lua require('smart-splits').resize_right()<CR>", mode = {"n", "t", "i"} },
    }
  },
}
