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
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = {
      { 'L3MON4D3/LuaSnip', version = 'v2.*' },
      'rafamadriz/friendly-snippets'
    },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
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

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = {
        documentation = { auto_show = false },
        list = { selection = { preselect = false} },
      },

      snippets = { preset = 'luasnip' },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
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

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },
  -- {
  --   'hrsh7th/nvim-cmp',
  --   dependencies = {
  --     'hrsh7th/cmp-buffer',
  --     'hrsh7th/cmp-nvim-lsp',
  --     'hrsh7th/cmp-path',
  --     'hrsh7th/cmp-cmdline',
  --     'hrsh7th/cmp-nvim-lua',
  --     'saadparwaiz1/cmp_luasnip',
  --     "R-nvim/cmp-r"
  --   },
  --   config = function()
  --     local luasnip = require("luasnip")
  --     local cmp = require("cmp")
  --
  --     cmp.setup({
  --       mapping = cmp.mapping.preset.insert({
  --         ['<Tab>'] = cmp.mapping.select_next_item(),
  --         ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  --         ['<C-j>'] = cmp.mapping.select_next_item(),
  --         ['<C-k>'] = cmp.mapping.select_prev_item(),
  --         ['<C-l>'] = cmp.mapping.confirm({ select = true }),
  --       }),
  --       preselect = cmp.PreselectMode.None,
  --       sources = {
  --         { name = 'nvim_lsp' },
  --         { name = 'buffer' },
  --         { name = 'luasnip' },
  --         { name = 'cmp_r' },
  --         { name = 'cmp_cmdline' },
  --         {
  --           name = 'path',
  --           option = {
  --             get_cwd = function(_) return vim.fn.getcwd(0) end,
  --           },
  --         },
  --         { name = 'nvim-lua' },
  --       },
  --       snippet = {
  --         expand = function(args)
  --           require 'luasnip'.lsp_expand(args.body)
  --         end
  --       },
  --     })
  --
  --     cmp.setup.cmdline(':', {
  --       mapping = cmp.mapping.preset.cmdline({
  --         ['<Tab>'] = {
  --           c = function(fallback)
  --             if cmp.visible() then cmp.select_next_item() else fallback()
  --             end
  --           end,
  --         },
  --         ['<S-Tab>'] = {
  --           c = function(fallback)
  --             if cmp.visible() then cmp.select_prev_item() else fallback()
  --             end
  --           end,
  --         },
  --         ['<C-j>'] = {
  --           c = function(fallback)
  --             if cmp.visible() then cmp.select_next_item() else fallback()
  --             end
  --           end,
  --         },
  --         ['<C-k>'] = {
  --           c = function(fallback)
  --             if cmp.visible() then cmp.select_prev_item() else fallback()
  --             end
  --           end,
  --         },
  --       }),
  --       sources = cmp.config.sources({
  --         { name = 'path' }
  --       }, {
  --         { name = 'cmdline' }
  --       }),
  --       matching = { disallow_symbol_nonprefix_matching = false }
  --     })
  --   end,
  -- },
}
