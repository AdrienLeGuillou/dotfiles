return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      vim.o.foldmethod = "expr"
      vim.wo.foldexpr = [[nvim_treesitter#foldexpr()]]

      require'nvim-treesitter.configs'.setup {
        ensure_installed = {
          "r",
          "markdown",
          "markdown_inline",
          "rnoweb",
          "rust",
          "bash",
          "lua",
          "python"
        },
        highlight = {
          enable = true,              -- false will disable the whole extension
          -- disable = { "c", "rust" },  -- list of language that will be disabled
        },
        indent = {
          enable = false,
          disable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
      }
    end,
  },
  "nvim-treesitter/nvim-treesitter-context",
}
