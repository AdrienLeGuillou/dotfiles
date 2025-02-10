-- Things I may want to try at some point:
--
-- * :set cuc -- cursor column. Could be usefull for align. Contextual
-- * Highlight on yank augroup (apparently on kickstart)
-- * mini.nvim
-- * snacks.nvim
-- * help ins-completion
-- * quickfix list

require("config.options")
require("config.lazy")
require("config.keys")

vim.opt.background = "light"
vim.cmd.colorscheme("tokyonight")

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "README",
  callback = function()
    vim.cmd.set("ft=markdown")
  end,
})
