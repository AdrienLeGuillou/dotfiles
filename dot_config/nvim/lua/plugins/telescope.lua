return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzy-native.nvim",
      {"nvim-telescope/telescope-fzf-native.nvim", build = 'make'},
      "nvim-telescope/telescope-file-browser.nvim",
      "ThePrimeagen/harpoon",
    },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')
      -- telescope.load_extension('fzy_native')
      telescope.load_extension('fzf')
      telescope.load_extension('file_browser')
      telescope.load_extension('harpoon')
      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<c-j>"] =  actions.move_selection_next,
              ["<c-k>"] =  actions.move_selection_previous,
            },
          },
        },
      })
    end,
  },
}
