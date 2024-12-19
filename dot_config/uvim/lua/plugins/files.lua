return {
  {
    'nvim-tree/nvim-tree.lua',
    opts = {},
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
    keys = {
      { "<leader>ft", "<CMD>NvimTreeToggle<CR>", desc = "Toggle File Tree" },
    }
  },
  'jghauser/mkdir.nvim',
  -- 'mbbill/undotree',
}
