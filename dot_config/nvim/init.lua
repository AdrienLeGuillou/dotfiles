local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- Set leaderkey early
--   must happened before `lazy.nvim`
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

require('lazy').setup('plugins')

require('options')

-- Colorscheme config
vim.o.termguicolors = true
vim.o.background = 'light'
-- vim.o.background = 'dark'
