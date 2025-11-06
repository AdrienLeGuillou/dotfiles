return {
  {
    'nvim-mini/mini.nvim',
    config = function()
      require("mini.pairs").setup()
      require("mini.surround").setup()
      require('mini.align').setup()
      require('mini.icons').setup()
      MiniIcons.mock_nvim_web_devicons()
      require('mini.trailspace').setup()
      require('mini.statusline').setup()
      require('mini.files').setup({ windows = { preview = true } })
      require('mini.notify').setup()
      require('mini.pairs').setup({ modes = { command = true } })
      require('mini.indentscope').setup({
        draw = { animation = require('mini.indentscope').gen_animation.none() }
      })
      -- require('mini.diff').setup()
      require('mini.git').setup()
      -- TODO: check miniMax for their configs
      -- require('mini.pick').setup()
      -- require('mini.clue').setup()
      -- require('mini.comment').setup()
      -- require('mini.sessions').setup()
      -- require('mini.bufremove').setup()
      -- require('mini.hipatterns')
      -- require('mini.jump').setup()
      -- require('mini.jump2d').setup()
      -- require('mini.keymap').setup()
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