return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function ()
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
      'hrsh7th/cmp-nvim-lua',
      'saadparwaiz1/cmp_luasnip',
      "R-nvim/cmp-r"
    },
    config = function()
      local luasnip = require("luasnip")
      local cmp = require("cmp")

      cmp.setup({
        mapping = {
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-j>'] = cmp.mapping.select_next_item(),
          ['<C-k>'] = cmp.mapping.select_prev_item(),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),

          -- Ctrl-l: start completion, validate it or go to next snippet elt
          ['<C-l>'] =  cmp.mapping(function(fallback)
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            -- elseif cmp.visible() then
            --   cmp.mapping.confirm({ select = true })
            else
              fallback()
            end
          end, { "i", "s" }),
          -- Ctrl-h: go to previous snippet elt
          ['<C-h>'] = cmp.mapping(function(fallback)
              if luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { "i", "s" }),

            ["<Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- that way you will only jump inside the snippet region
              elseif luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
              -- elseif has_words_before() then
              --   cmp.complete()
              else
                fallback()
              end
            end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { "i", "s" }),

        },
        preselect = cmp.PreselectMode.None,
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'luasnip' },
          { name = 'cmp_r' },
          {
            name = 'path',
            option = {
              get_cwd = function(params) -- complete files from WD
                -- return vim.fn.getcwd(params.context.bufnr)
                return vim.fn.getcwd(0)
              end,
            },
          },
          { name = 'nvim-lua' },
        },
        snippet = {
          expand = function(args)
            require'luasnip'.lsp_expand(args.body)
          end
        },
      })
    end,
  },
}
