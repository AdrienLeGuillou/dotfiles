return {
  {
    'nvim-tree/nvim-web-devicons',
  },
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      -- disable netrw at the very start of your init.lua
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- optionally enable 24-bit colour
      vim.opt.termguicolors = true

      -- empty setup using defaults
      require("nvim-tree").setup()
		end,
  },
  {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
  },
  'jghauser/mkdir.nvim',
}
