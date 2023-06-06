return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		lazy = false,
		config = function ()
			-- setup must be called before loading the colorscheme
			-- Default options:
			require("gruvbox").setup({
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = false,
			})
			vim.cmd("colorscheme gruvbox")
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
    'alexghergh/nvim-tmux-navigation',
    config = function()
      local nvim_tmux_nav = require('nvim-tmux-navigation')
      nvim_tmux_nav.setup {
        disable_when_zoomed = false, -- defaults to false
      }

      vim.keymap.set('n', "<A-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set('n', "<A-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set('n', "<A-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set('n', "<A-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
      -- vim.keymap.set('n', "<A-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
      -- vim.keymap.set('n', "<A-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
      vim.keymap.set('t', "<A-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set('t', "<A-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set('t', "<A-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set('t', "<A-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
      -- vim.keymap.set('t', "<A-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
      -- vim.keymap.set('t', "<A-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
    end
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
      lspconfig.wgsl_analyzer.setup({ capabilities = capabilities })
    end,
  },
  {
    "williamboman/mason.nvim",
    config = true,
    build = ":MasonUpdate" -- :MasonUpdate updates registry contents
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
        ensure_installed = {"r", "rust", "bash", "lua"},
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
          repl_open_cmd = require("iron.view").right(85),
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
