return {
  {
    "folke/neodev.nvim",
    opts = {},
    config = function()
      require("neodev").setup({
        library = { plugins = { "nvim-dap-ui" }, types = true },
      })
    end
  },
  'folke/lua-dev.nvim',
  'bfredl/nvim-luadev',
}
