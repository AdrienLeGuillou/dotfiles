local later, now = MiniDeps.later, MiniDeps.now

-- Tmux Navigation
later(function()
  vim.pack.add({ 'https://github.com/alexghergh/nvim-tmux-navigation' })
  local nvim_tmux_nav = require('nvim-tmux-navigation')
  nvim_tmux_nav.setup({})
  vim.keymap.set({'n', 't'}, '<A-h>', nvim_tmux_nav.NvimTmuxNavigateLeft)
  vim.keymap.set({'n', 't'}, '<A-j>', nvim_tmux_nav.NvimTmuxNavigateDown)
  vim.keymap.set({'n', 't'}, '<A-k>', nvim_tmux_nav.NvimTmuxNavigateUp)
  vim.keymap.set({'n', 't'}, '<A-l>', nvim_tmux_nav.NvimTmuxNavigateRight)
  vim.keymap.set('i', '<A-h>', '<ESC><CMD>NvimTmuxNavigateLeft<CR>')
  vim.keymap.set('i', '<A-j>', '<ESC><CMD>NvimTmuxNavigateDown<CR>')
  vim.keymap.set('i', '<A-k>', '<ESC><CMD>NvimTmuxNavigateUp<CR>')
  vim.keymap.set('i', '<A-l>', '<ESC><CMD>NvimTmuxNavigateRight<CR>')
end)

-- treesitter
later(function()
  -- Note: use this to make a hook when package is installed but requires to be
  -- loaded
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
    }
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
end)

later(function()
  vim.pack.add({ 'https://github.com/hat0uma/csvview.nvim' })
    require('csvview')
end)

later(function()
  vim.pack.add({
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/mason-org/mason.nvim',
  })
  require('mason').setup()

  vim.lsp.enable('lua_ls')
  vim.lsp.enable('r_language_server')
  vim.lsp.enable('air')
end)

later(function()
  vim.pack.add({ 'https://github.com/MagicDuck/grug-far.nvim' })
  require('grug-far').setup()
end)

now(function()
  vim.pack.add({ 'https://github.com/akinsho/toggleterm.nvim' })
  require("toggleterm").setup()
end)