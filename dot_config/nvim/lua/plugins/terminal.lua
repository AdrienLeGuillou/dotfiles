return {
  {
    'akinsho/nvim-toggleterm.lua',
    config = function()
      require('toggleterm').setup({
        size = 20,
        open_mapping = [[<C-\>]],
        hide_numbers = true,
        start_in_insert = true,
        insert_mappings = true,
        shade_filetypes = {},
        persist_size = true,
        direction = 'float', -- 'horizontal'
        shade_terminals = false,
      })
    end,
  },
}
