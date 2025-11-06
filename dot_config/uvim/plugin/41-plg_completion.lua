local later = MiniDeps.later

later(function()
  -- Note: use this to make a hook when package is installed
  local hooks = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'LuaSnip' and (kind == 'install' or kind == 'update') then
      vim.system({ 'make', 'install_jsregexp' }, { cwd = ev.data.path })
    end
  end

  vim.api.nvim_create_autocmd('PackChanged', {
    callback = hooks,
    group = _G.Config.augrp
  })

  vim.pack.add({
    { src = 'https://github.com/saghen/blink.cmp',
      version = vim.version.range('1.*') },
    { src = 'https://github.com/L3MON4D3/LuaSnip',
      version = vim.version.range('2.*') },
   'https://github.com/rafamadriz/friendly-snippets',
  })

  require('blink.cmp').setup({
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    keymap = {
      ['<Tab>'] = { 'select_next', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
      ['<C-j>'] = { 'select_next', 'fallback' },
      ['<C-k>'] = { 'select_prev', 'fallback' },
      ['<C-l>'] = { 'select_and_accept', 'fallback' },
    },
    cmdline = {
      completion = {
        menu = { auto_show = true },
        list = { selection = { preselect = false} },
      },
      keymap = { preset = "inherit"  }
    },
    appearance = { nerd_font_variant = 'mono' },
    completion = {
      documentation = { auto_show = false },
      list = { selection = { preselect = false} },
    },
    snippets = { preset = 'luasnip' },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        path = {
          opts = {
            get_cwd = function(_)
              return vim.fn.getcwd()
            end,
          },
        },
      },
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning"
    }
  })

end)