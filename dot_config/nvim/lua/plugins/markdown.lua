return {
  'vim-pandoc/vim-pandoc-syntax',
  'vim-pandoc/vim-rmarkdown',
  {
    'vim-pandoc/vim-pandoc',
    config = function()
      vim.g['pandoc#syntax#conceal#use'] = 0
    end,
  },
}
