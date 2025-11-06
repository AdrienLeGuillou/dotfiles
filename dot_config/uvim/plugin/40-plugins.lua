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

now(function()
  require('mini.notify').setup()
  require('mini.statusline').setup()
end)

later(function()
  require('mini.align').setup()
  -- require('mini.bracketed').setup()
  -- require('mini.bufremove').setup()

  local miniclue = require('mini.clue')
  -- stylua: ignore
  miniclue.setup({
    -- Define which clues to show. By default shows only clues for custom mappings
    -- (uses `desc` field from the mapping; takes precedence over custom clue).
    clues = {
      -- This is defined in 'plugin/20_keymaps.lua' with Leader group descriptions
      Config.leader_group_clues,
      miniclue.gen_clues.builtin_completion(),
      miniclue.gen_clues.g(),
      miniclue.gen_clues.marks(),
      miniclue.gen_clues.registers(),
      -- This creates a submode for window resize mappings. Try the following:
      -- - Press `<C-w>s` to make a window split.
      -- - Press `<C-w>+` to increase height. Clue window still shows clues as if
      --   `<C-w>` is pressed again. Keep pressing just `+` to increase height.
      --   Try pressing `-` to decrease height.
      -- - Stop submode either by `<Esc>` or by any key that is not in submode.
      miniclue.gen_clues.windows({ submode_resize = true }),
      miniclue.gen_clues.z(),
    },
    -- Explicitly opt-in for set of common keys to trigger clue window
    triggers = {
      { mode = 'n', keys = '<Leader>' }, -- Leader triggers
      { mode = 'x', keys = '<Leader>' },
      { mode = 'n', keys = '\\' },       -- mini.basics
      { mode = 'n', keys = '[' },        -- mini.bracketed
      { mode = 'n', keys = ']' },
      { mode = 'x', keys = '[' },
      { mode = 'x', keys = ']' },
      { mode = 'i', keys = '<C-x>' },    -- Built-in completion
      { mode = 'n', keys = 'g' },        -- `g` key
      { mode = 'x', keys = 'g' },
      { mode = 'n', keys = "'" },        -- Marks
      { mode = 'n', keys = '`' },
      { mode = 'x', keys = "'" },
      { mode = 'x', keys = '`' },
      { mode = 'n', keys = "'" },        -- Registers
      { mode = 'x', keys = "'" },
      { mode = 'i', keys = '<C-r>' },
      { mode = 'c', keys = '<C-r>' },
      { mode = 'n', keys = '<C-w>' },    -- Window commands
      { mode = 'n', keys = 'z' },        -- `z` key
      { mode = 'x', keys = 'z' },
    },
  })

  -- require('mini.diff').setup()
  require('mini.extra').setup()
  require('mini.files').setup({ windows = { preview = true } })
  -- require('mini.git').setup()

  local hipatterns = require('mini.hipatterns')
  local hi_words = MiniExtra.gen_highlighter.words
  hipatterns.setup({
    highlighters = {
      -- Highlight a fixed set of common words. Will be highlighted in any place,
      -- not like "only in comments".
      fixme = hi_words({ 'FIXME', 'Fixme', 'fixme' }, 'MiniHipatternsFixme'),
      hack = hi_words({ 'HACK', 'Hack', 'hack' }, 'MiniHipatternsHack'),
      todo = hi_words({ 'TODO', 'Todo', 'todo' }, 'MiniHipatternsTodo'),
      note = hi_words({ 'NOTE', 'Note', 'note' }, 'MiniHipatternsNote'),

      -- Highlight hex color string (#aabbcc) with that color as a background
      hex_color = hipatterns.gen_highlighter.hex_color(),
    },
  })

  require('mini.icons').setup()
  MiniIcons.mock_nvim_web_devicons()
  MiniIcons.tweak_lsp_kind()

  require('mini.indentscope').setup({
    draw = {
      delay = 0,
      animation = require('mini.indentscope').gen_animation.none(),
    }
  })

  require('mini.jump').setup()
  require('mini.jump2d').setup()
  require('mini.pairs').setup({ modes = { command = true } })
  require('mini.pick').setup({
    mappings = {
      move_down  = '<C-j>',
      move_up    = '<C-k>',
    },
  })

  require('mini.trailspace').setup()
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    group = _G.Config.augrp,
    callback = function()
      MiniTrailspace.trim()
      MiniTrailspace.trim_last_lines()
    end,
  })

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

now(function()
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