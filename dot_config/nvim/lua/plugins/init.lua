return {
  {
    'gruvbox-community/gruvbox',
    lazy = false,
    priority = 1000,
    config = function ()
      vim.g.gruvbox_contrast_dark  = 'medium'
      vim.g.gruvbox_contrast_light = 'medium'
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
    },
    config = function()
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
          ['<Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
          ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end,
        },
        preselect = cmp.PreselectMode.None,
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
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
        }
      })
    end,
  },
  {
    'akinsho/nvim-toggleterm.lua',
    config = function()
      require('toggleterm').setup({
        size = 20,
        open_mapping = [[<C-\>]],
        hide_numbers = true,
        start_in_insert = true,
        insert_mappings = true,
        shade_filetypes = {},
        persist_size = true,
        direction = 'float', -- 'horizontal'
        shade_terminals = false,
      })
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
        require("config.keys")
      })
    end,
  },
  'tpope/vim-surround',
  'godlygeek/tabular',
  'mbbill/undotree',
  {
    'lewis6991/gitsigns.nvim',
    config = true,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require'lspconfig'
      lspconfig.bashls.setup({ capabilities = capabilities })
      lspconfig.r_language_server.setup({ capabilities = capabilities })
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    config = {
      options = {
        theme = 'gruvbox_light',
        globalstatus = false,
      }
    },
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = {
      char = '·',
      buftype_exclude = {'terminal'},
      filetype_exclude = {'help', 'man', 'rbrowser', 'rdoc'},
      use_treesitter = false,
      show_first_indent_level = true,
      show_trailing_blankline_indent = true,
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzy-native.nvim",
      {"nvim-telescope/telescope-fzf-native.nvim", build = 'make'},
      "nvim-telescope/telescope-file-browser.nvim",
      "ThePrimeagen/harpoon",
    },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')
      -- telescope.load_extension('fzy_native')
      telescope.load_extension('fzf')
      telescope.load_extension('file_browser')
      telescope.load_extension('harpoon')
      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<c-j>"] =  actions.move_selection_next,
              ["<c-k>"] =  actions.move_selection_previous,
            },
          },
        },
      })
    end,
  },
  {
    'simrat39/rust-tools.nvim',
    config = true,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      vim.o.foldmethod = "expr"
      vim.wo.foldexpr = [[nvim_treesitter#foldexpr()]]

      require'nvim-treesitter.configs'.setup {
        ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        highlight = {
          enable = true,              -- false will disable the whole extension
          -- disable = { "c", "rust" },  -- list of language that will be disabled
        },
        indent = {
          enable = false,
          disable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
      }
    end,
  },
  'christoomey/vim-tmux-navigator',
  'vim-pandoc/vim-pandoc-syntax',
  'vim-pandoc/vim-rmarkdown',
  {
    'vim-pandoc/vim-pandoc',
    config = function()
      vim.g['pandoc#syntax#conceal#use'] = 0
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = true,
  },
  {
    'windwp/nvim-autopairs',
    config = { enable_check_bracket_line = false },
  },
  'tpope/vim-surround',
  'godlygeek/tabular',
  'mbbill/undotree',

  {
    'lewis6991/gitsigns.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    config = true,
  },
  'tpope/vim-fugitive',
  'jghauser/mkdir.nvim',

  -- R
  {
    'hkupty/iron.nvim',
    config = function()
      local iron = require('iron.core')
      iron.setup {
        config = {
          highlight_last = false,
          -- repl_open_cmd = require("iron.view").split.vertical.botright(95),
          repl_open_cmd = require("iron.view").right(95),
          scratch_repl = false,
          -- should_map_plug = false,
          visibility = require("iron.visibility").toggle, -- toggle, focus, single
          close_window_on_exit = true,
          repl_definition = {
            sh = {
              command = {"zsh"}
            },
            r = require("iron.fts.r").radian,
          },
        },
        -- Iron doesn't set keymaps by default anymore. Set them here
        -- or use `should_map_plug = true` and map from you vim files
        keymaps = {
          visual_send = "<localleader><localleader>",
          send_line = "<localleader><localleader>",
          interrupt = "<localleader>xi",
          exit = "<localleader>xk",
          clear = "<localleader>xl",
        }
      }
    end,
  },
  {
    "johmsalas/text-case.nvim",
    config = true,
  },
  -- Lua dev
  'folke/lua-dev.nvim',
  'bfredl/nvim-luadev',
}
