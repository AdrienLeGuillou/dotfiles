return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = {},
      gitbrowse = {},
      indent = {
        enabled = true,
        animate = { enabled = false },
      },
      lazygit = {},
      picker = {enabled = false},
      terminal = {},
      toggle = {},
    },
    keys = {
      { "<C-\\>", function() Snacks.terminal.toggle() end, mode = { "", "!", "t" }  },

      -- -- picker
      -- { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
      -- { "<leader>fF", function() Snacks.picker.files({ignored = true, hidden = true}) end, desc = "Find Files (Show All)" },
      -- { "<leader>bb", function() Snacks.picker.buffers() end, desc = "List Buffers" },
      -- { "<leader>se", function() Snacks.picker.command_history() end, desc = "Search Command History"},
      -- { "<leader>dl", function() Snacks.picker.diagnostics_buffer() end, desc = "List Buffer Diagnostics"},
      -- { "<leader>dL", function() Snacks.picker.diagnostics() end, desc = "List All Diagnostics"},
      -- { "<leader>sf", function() Snacks.picker.grep() end, desc = "Search in Files"},
      -- { "<leader>sl", function() Snacks.picker.lines() end, desc = "Search in Buffer"},
      -- { "<leader>so", function() Snacks.picker.qflist() end, desc = "Search the quickfix list"},
      -- { "<leader>sh", function() Snacks.picker.help() end, desc = "Search Help"},
    }
  }
}
