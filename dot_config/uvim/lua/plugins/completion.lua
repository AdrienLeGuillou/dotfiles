return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      -- local ls = require("luasnip")
      -- vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
      -- vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
      -- vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})
      --
      -- vim.keymap.set({"i", "s"}, "<C-E>", function()
      --   if ls.choice_active() then
      --     ls.change_choice(1)
      --   end
      -- end, {silent = true})
    end
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lua',
      'saadparwaiz1/cmp_luasnip',
      "R-nvim/cmp-r"
    },
    config = function()
      local luasnip = require("luasnip")
      local cmp = require("cmp")

      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<C-j>'] = cmp.mapping.select_next_item(),
          ['<C-k>'] = cmp.mapping.select_prev_item(),
          ['<C-l>'] = cmp.mapping.confirm({ select = true }),
        }),
        preselect = cmp.PreselectMode.None,
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'luasnip' },
          { name = 'cmp_r' },
          { name = 'cmp_cmdline' },
          {
            name = 'path',
            option = {
              get_cwd = function(_) return vim.fn.getcwd(0) end,
            },
          },
          { name = 'nvim-lua' },
        },
        snippet = {
          expand = function(args)
            require 'luasnip'.lsp_expand(args.body)
          end
        },
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline({
          ['<Tab>'] = {
            c = function(fallback)
              if cmp.visible() then cmp.select_next_item() else fallback()
              end
            end,
          },
          ['<S-Tab>'] = {
            c = function(fallback)
              if cmp.visible() then cmp.select_prev_item() else fallback()
              end
            end,
          },
          ['<C-j>'] = {
            c = function(fallback)
              if cmp.visible() then cmp.select_next_item() else fallback()
              end
            end,
          },
          ['<C-k>'] = {
            c = function(fallback)
              if cmp.visible() then cmp.select_prev_item() else fallback()
              end
            end,
          },
        }),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })
    end,
  },
}
