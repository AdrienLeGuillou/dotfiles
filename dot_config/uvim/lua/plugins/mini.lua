return {
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.statusline').setup({ use_icons = true })
      require("mini.pairs").setup()
      require("mini.surround").setup()
      require('mini.icons').setup()
      require('mini.align').setup()
      MiniIcons.mock_nvim_web_devicons()
      require('mini.trailspace').setup()
    end,
    init = function()
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function()
          MiniTrailspace.trim()
          MiniTrailspace.trim_last_lines()
        end,
      })
    end,
  }
}
