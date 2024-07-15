return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require("mini.surround").setup()
      require('mini.icons').setup()
      MiniIcons.mock_nvim_web_devicons()
    end
  },
}
