return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use'wbthomason/packer.nvim'

--  -- Simple plugins can be specified as strings
--  use 'nvim-lua/popup.nvim'
--  use 'kyazdani42/nvim-web-devicons'
--
-- Theme
  use({
    'gruvbox-community/gruvbox',
    config = function()
      vim.o.termguicolors = true
      vim.o.background = 'light'
      vim.g.gruvbox_contrast_dark  = 'medium'
      vim.g.gruvbox_contrast_light = 'medium'
      vim.cmd([[colorscheme gruvbox]])
    end,
  })

  use({
    'hoob3rt/lualine.nvim',
    config = function()
      require('lualine').setup{
        options = {theme = 'gruvbox_light'}
      }
    end,
  })
--
--  -- use 'Yggdroot/indentLine'
  use({
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup {
        char = '·',
        buftype_exclude = {'terminal'},
        filetype_exclude = {'help', 'man', 'rbrowser', 'rdoc'},
        use_treesitter = false,
        show_first_indent_level = true,
        show_trailing_blankline_indent = true,
      }
    end,
  })

  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzy-native.nvim",
      {"nvim-telescope/telescope-fzf-native.nvim", run = 'make'},
    },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')
      -- telescope.load_extension('fzy_native')
      telescope.load_extension('fzf')
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
  })

  use {
    'hrsh7th/nvim-cmp',
    requires = {
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
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'nvim-lua' },
        }
      })
    end,
  }

  use({
    'neovim/nvim-lspconfig',
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
          virtual_text = true,
          underline = false,
          signs = true,
          update_in_insert = false,
        }
      )

      local lspconfig = require'lspconfig'

      lspconfig.bashls.setup({ capabilities = capabilities })

      lspconfig.sumneko_lua.setup({
        capabilities = capabilities,
        lua = {
          path = "/usr/bin/lua-language-server",
        }
      })

      lspconfig.r_language_server.setup({ capabilities = capabilities })
    end,
  })

  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
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

      vim.o.foldmethod = "expr"
      vim.wo.foldexpr = [[nvim_treesitter#foldexpr()]]
    end,
  })

use({
  'code-biscuits/nvim-biscuits',
  config = function()
    require('nvim-biscuits').setup({
      toggle_keybind = "<leader>cb",
      cursor_line_only = false,
      show_on_start = false, -- defaults to false
    })
  end
})

--  -- -- Tmux
  use 'christoomey/vim-tmux-navigator'

  -- -- MarkDown
  use({
    'vim-pandoc/vim-pandoc',
    config = function()
      vim.g['pandoc#syntax#conceal#use'] = 0
    end,
  })
  use 'vim-pandoc/vim-pandoc-syntax'
  use 'vim-pandoc/vim-rmarkdown'

--  -- -- Completion
--  use 'SirVer/ultisnips'
--
--  -- -- Utilites
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })
  use({
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  })
--  use 'editorconfig/editorconfig-vim'
  use({
    'windwp/nvim-autopairs',
    config = function ()
      require('nvim-autopairs').setup()
    end,
  })
  use({
    'akinsho/nvim-toggleterm.lua',
    config = function ()
      require('toggleterm').setup({
        size = 20,
        open_mapping = [[<C-\>]],
        hide_nubers = true,
        start_in_insert = true,
        insert_mappings = true,
        shade_filetypes = {},
        persist_size = true,
        direction = 'horizontal',
        shade_terminals = false,
      })
    end,
    after = 'which-key.nvim'
  })
  use 'tpope/vim-surround'
  use 'godlygeek/tabular'
--  use 'qpkorr/vim-bufkill'
  use 'famiu/bufdelete.nvim'
  use 'mbbill/undotree'
--
  -- Which-key
  use({
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
      require("config.keys")
    end,
  })
--
  -- Git
  use({
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  })

  -- use 'mhinz/vim-signify'
  use 'tpope/vim-fugitive'
  use({
    'TimUntersberger/neogit',
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require'plenary'
      require'neogit'.setup()
    end,
  })

--  use 'preservim/nerdtree'
--  use 'kyazdani42/nvim-tree.lua'
  use({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require'nvim-tree'.setup()
    end,
  })
--
  -- R
  use 'jalvesaq/Nvim-R'
--
  -- Lua dev
  use 'folke/lua-dev.nvim'
  use 'bfredl/nvim-luadev'

  -- use({
  --   "luukvbaal/stabilize.nvim",
  --   config = function()
  --     require("stabilize").setup()
  --   end,
  -- })
--
--  -- -- Docs
--  use 'nanotee/luv-vimdocs'
--  use 'wsdjeg/luarefvim'
--
--  -- Local plugins
--  -- use '~/Documents/Projects/Rrepl.nvim'
--
----   use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
----   use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
----   -- Use dependency and run lua function after load
----   use {
----     'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
----     config = function() require('gitsigns').setup() end
----   }
end)
