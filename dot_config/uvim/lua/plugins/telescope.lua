return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    enabled = true,
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = "make", },
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('telescope').setup({
        extensions = {
          fzf = {},
        },
        defaults = {
          mappings = {
            i = {
              ["<Tab>"] = require('telescope.actions').move_selection_next,
              ["<S-Tab>"] = require('telescope.actions').move_selection_previous,
              ["<C-J>"] = require('telescope.actions').move_selection_next,
              ["<C-K>"] = require('telescope.actions').move_selection_previous,
            },
          },
        },
      })

      require('telescope').load_extension('fzf')

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
      { "<leader>sh", "<cmd>Telescope help_tags<CR>",  desc = "Search Help" },
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
      { "<leader>fF", "<cmd>lua require('telescope.builtin').find_files({hidden = true, no_ignore = true})<CR>", desc = "Open file (Show All)" },
      { "<leader>se", "<cmd>Telescope command_history:<CR>", desc = "Search command history"},
      { "<leader>sf", "<cmd>Telescope live_grep<CR>", desc = "Search line in files"},
      { "<leader>sl", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Search line in buffer"},
      { "<leader>so", "<cmd>Telescope quickfix<CR>", desc = "Search the quickfix list"},
      { "<leader>is", "<cmd>Telescope symbols<CR>", desc = "Insert symbol"},
      { "<leader>bb", "<cmd>Telescope buffers<CR>", desc = "List buffers"},
    }
  }
}
