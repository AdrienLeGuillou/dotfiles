-- Things I may want to try at some point:
--
-- ToDo:
-- * treesitter
-- * folds using LSP or treesitter?
--
-- * :set cuc -- cursor column. Could be usefull for align. Contextual
-- * Highlight on yank augroup (apparently on kickstart)
-- * mini.nvim
-- * snacks.nvim
-- * help ins-completion
-- * quickfix list

-- Update pacakges with `:lua vim.pack.update()`
vim.pack.add({
  'https://github.com/nvim-mini/mini.nvim',
})
require('mini.deps').setup() -- to get `now` and `later`

-- Define config table to be able to pass data between scripts
_G.Config = {}
_G.Config.augrp = vim.api.nvim_create_augroup('custom-config', {})

vim.api.nvim_create_autocmd('BufEnter', {
    group = _G.Config.augrp,
    pattern = 'README',
    callback = function() vim.cmd.set("ft=markdown") end,
    desc = "Set README as markdown filetype",
})