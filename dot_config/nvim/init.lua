-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

-- require('packer').startup(function(use)
--
-- -- put all uses here but no configs
--
--
--   if is_bootstrap then
--     require('packer').sync()
--   end
-- end)
--
-- -- Automatically source and re-compile packer whenever you save this init.lua
-- local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
-- vim.api.nvim_create_autocmd('BufWritePost', {
--   command = 'source <afile> | PackerCompile',
--   group = packer_group,
--   pattern = vim.fn.expand '$MYVIMRC',
-- })
--
-- if is_bootstrap then
--   print '=================================='
--   print '    Plugins are being installed'
--   print '    Wait until Packer completes,'
--   print '       then restart nvim'
--   print '=================================='
--   return
-- end

require('options')

-- Colorscheme config
vim.o.termguicolors = true
vim.o.background = 'light'
vim.g.gruvbox_contrast_dark  = 'medium'
vim.g.gruvbox_contrast_light = 'medium'
vim.cmd([[colorscheme gruvbox]])

require('lualine').setup{
  options = {
    theme = 'gruvbox_light',
    globalstatus = false,
  }
}

--


vim.schedule(function ()
  require('plugins')
end)
