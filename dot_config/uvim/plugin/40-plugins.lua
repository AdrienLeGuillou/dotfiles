local later, now = Config.later, Config.now

-- Smart-splits
later(function()
vim.pack.add({ 'https://github.com/mrjones2014/smart-splits.nvim' })
  require('smart-splits').setup()
   -- moving between splits
  vim.keymap.set({'n', 't'}, '<A-h>', "<CMD>lua require('smart-splits').move_cursor_left()<CR>")
  vim.keymap.set({'n', 't'}, '<A-j>', "<CMD>lua require('smart-splits').move_cursor_down()<CR>")
  vim.keymap.set({'n', 't'}, '<A-k>', "<CMD>lua require('smart-splits').move_cursor_up()<CR>")
  vim.keymap.set({'n', 't'}, '<A-l>', "<CMD>lua require('smart-splits').move_cursor_right()<CR>")
  vim.keymap.set('i', '<A-h>', "<ESC><CMD>lua require('smart-splits').move_cursor_left()<CR>")
  vim.keymap.set('i', '<A-j>', "<ESC><CMD>lua require('smart-splits').move_cursor_down()<CR>")
  vim.keymap.set('i', '<A-k>', "<ESC><CMD>lua require('smart-splits').move_cursor_up()<CR>")
  vim.keymap.set('i', '<A-l>', "<ESC><CMD>lua require('smart-splits').move_cursor_right()<CR>")
  -- Resize splits
  vim.keymap.set({'n', 't'}, '<A-left>',  "<CMD>lua require('smart-splits').resize_left()<CR>")
  vim.keymap.set({'n', 't'}, '<A-down>',  "<CMD>lua require('smart-splits').resize_down()<CR>")
  vim.keymap.set({'n', 't'}, '<A-up>',    "<CMD>lua require('smart-splits').resize_up()<CR>")
  vim.keymap.set({'n', 't'}, '<A-right>', "<CMD>lua require('smart-splits').resize_right()<CR>")

  -- treesitter
  local hooks = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and (kind == 'install' or kind == 'update') then
      -- TSUpdate requires the package to be there. Apparently 'packadd' is not
      -- called when 'PackChanged' is triggered
      if not ev.data.active then
        vim.cmd.packadd('nvim-treesitter')
      end
      vim.cmd('TSUpdate')
    end
  end

  vim.api.nvim_create_autocmd('PackChanged', {
    callback = hooks,
    group = _G.Config.augrp
  })

  vim.pack.add({
    {
      src = 'https://github.com/nvim-treesitter/nvim-treesitter',
      version = 'main',
    },
    'https://github.com/nvim-treesitter/nvim-treesitter-context',
  })
  require('nvim-treesitter').setup({
    ensure_installed = {
      'c', 'lua', 'r', 'rust',
      'vim', 'vimdoc', 'query',
      'markdown', 'markdown_inline'
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true, },
    incremental_selection = { enable = true, },
  })

  -- LSPs
  vim.pack.add({
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/mason-org/mason.nvim',
  })
  require('mason').setup()

  vim.lsp.enable('lua_ls')
  vim.lsp.enable('r_language_server')
  vim.lsp.enable('air')

  -- Misc
  vim.pack.add({ 'https://github.com/hat0uma/csvview.nvim' })
  require('csvview')

  vim.pack.add({ 'https://github.com/MagicDuck/grug-far.nvim' })
  require('grug-far').setup()

  vim.pack.add({ 'https://github.com/dlyongemallo/diffview-plus.nvim' })
end)


now(function()
  vim.pack.add({ 'https://github.com/akinsho/toggleterm.nvim' })
  require("toggleterm").setup()
end)

Config.now_if_args(function()
  vim.pack.add({ 'https://github.com/MeanderingProgrammer/render-markdown.nvim' })
  require('render-markdown').setup({ enabled = false })
  vim.pack.add({ 'https://github.com/noisesfromspace/touchup.nvim' })
  require("touchup").setup()
end)
