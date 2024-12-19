return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = "make", },
      'nvim-lua/plenary.nvim',
      'debugloop/telescope-undo.nvim',
    },
    config = function()
      require('telescope').setup({
        extensions = {
          fzf = {},
          undo = {},
        },
        defaults = {
          mappings = {
            i = {
              ["<c-j>"] = require('telescope.actions').move_selection_next,
              ["<c-k>"] = require('telescope.actions').move_selection_previous,
            },
          },
        },
      })

      require('telescope').load_extension('fzf')
      require('telescope').load_extension('undo')

      vim.keymap.set("n", "<leader>en", function()
        local opts = require('telescope.themes').get_ivy({
          cwd = vim.fn.stdpath("config")
        })
        require('telescope.builtin').find_files(opts)
      end)

      vim.keymap.set("n", "<leader>ep", function()
        local opts = require('telescope.themes').get_ivy({
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
        })
        require('telescope.builtin').find_files(opts)
      end)
    end,
    keys = {
      { "<leader>su", "<CMD>Telescope undo<CR>",  desc = "Search Undo" },
      { "<leader>sh", require('telescope.builtin').help_tags,  desc = "Search Help" },
      { "<leader>ff", require('telescope.builtin').find_files, desc = "Find Files" },
      { "<leader>se", "<cmd>Telescope command_history:<CR>", desc = "Search command history"},
      { "<leader>sf", "<cmd>Telescope live_grep<CR>", desc = "Search line in files"},
      { "<leader>sl", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Search line in buffer"},
      { "<leader>so", "<cmd>Telescope quickfix<CR>", desc = "Search the quickfix list"},
    }
  }
}
