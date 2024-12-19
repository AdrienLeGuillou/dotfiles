return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = {},
      gitbrowse = {},
      indent = {
        enabled = true,
        animate = { enabled = false },
      },
      lazygit = {},
      terminal = {},
      toggle = {},
    },
    keys = {
      { "<C-\\>", function() Snacks.terminal.toggle() end, mode = { "", "!", "t" }  }
    }
  }
}
