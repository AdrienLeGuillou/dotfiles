return {
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
        require("config.keys")
      })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap"},
  },
  {
    "williamboman/mason.nvim",
    config = true,
    build = ":MasonUpdate" -- :MasonUpdate updates registry contents
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    version = 'v2.20.8',
    opts = {
      char = '·',
      buftype_exclude = {'terminal'},
      filetype_exclude = {'help', 'man', 'rbrowser', 'rdoc'},
      use_treesitter = false,
      show_first_indent_level = true,
      show_trailing_blankline_indent = true,
    },
  },
  {
    'windwp/nvim-autopairs',
    opts = { enable_check_bracket_line = false },
  },
  'godlygeek/tabular',
  'mbbill/undotree',
  {
    "johmsalas/text-case.nvim",
    config = true,
  },
}
