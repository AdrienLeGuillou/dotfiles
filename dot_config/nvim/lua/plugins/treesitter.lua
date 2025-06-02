return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "c", "lua", "r", "rust",
        "vim", "vimdoc", "query",
        "markdown", "markdown_inline"
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true, },
      incremental_selection = { enable = true, },
    },
  },
  "nvim-treesitter/nvim-treesitter-context",
}
