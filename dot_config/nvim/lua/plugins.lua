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
  -- use({
  --   'ellisonleao/gruvbox.nvim',
  --   config = function()
  --     vim.o.termguicolors = true
  --     vim.o.background = 'light'
  --     vim.g.gruvbox_contrast_dark  = 'medium'
  --     vim.g.gruvbox_contrast_light = 'medium'
  --     vim.cmd([[colorscheme gruvbox]])
  --   end,
  -- })

  use({
    'hoob3rt/lualine.nvim',
    config = function()
      require('lualine').setup{
        options = {
          theme = 'gruvbox_light',
          globalstatus = true,
        },
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

      lspconfig.sumneko_lua.setup({
        capabilities = capabilities,
        lua = {
          path = "/usr/bin/lua-language-server",
        }
      })

      lspconfig.bashls.setup({ capabilities = capabilities })
      lspconfig.r_language_server.setup({ capabilities = capabilities })
      lspconfig.julials.setup({ capabilities = capabilities })
      lspconfig.clangd.setup({ capabilities = capabilities })
      lspconfig.rust_analyzer.setup({ capabilities = capabilities })
    end,
  })

  use({
    'mfussenegger/nvim-dap',
    config = function ()
      local dap = require('dap')

      dap.adapters.lldb = {
        type = 'executable',
        command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
        name = 'lldb'
      }

      dap.configurations.cpp = {
        {
          name = 'Launch',
          type = 'lldb',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          args = {},

          -- 💀
          -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
          --
          --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
          --
          -- Otherwise you might get the following error:
          --
          --    Error on launch: Failed to attach to the target process
          --
          -- But you should be aware of the implications:
          -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
          -- runInTerminal = false,
        },
      }

      -- If you want to use this for Rust and C, add something like this:

      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp
    end,
  })

  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
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

      vim.o.foldmethod = "expr"
      vim.wo.foldexpr = [[nvim_treesitter#foldexpr()]]
    end,
  })

-- use({
--   'code-biscuits/nvim-biscuits',
--   config = function()
--     require('nvim-biscuits').setup({
--       toggle_keybind = "<leader>cb",
--       cursor_line_only = false,
--       show_on_start = false, -- defaults to false
--     })
--   end
-- })

use({
  'ThePrimeagen/harpoon',
  config = function()
    require("harpoon").setup()
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
  use({
    'L3MON4D3/LuaSnip',
    config = function()
      local ls = require("luasnip")
      local types = require("luasnip.util.types")

      ls.config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = true,
        ext_opts = {
          [types.choiceNode] = {
            active = {
              virt_text = { { "<-", "Error" } },
            },
          },
        },
      })
      -- requires nvim 0.7
      -- -- keymaps (before k, j, l: but they don't work)
      -- vim.keymap.set({"i", "s"}, "<c-t>", function()
      --   if ls.expand_or_jumpable() then
      --     ls.expand_or_jump()
      --   end
      -- end, {silent = true})
      --
      -- vim.keymap.set({"i", "s"}, "<c-y>", function()
      --   if ls.jumpable(-1) then
      --     ls.jump(-1)
      --   end
      -- end, {silent = true})
      --
      -- vim.keymap.set({"i", "s"}, "<c-u>", function()
      --   if ls.choice_active() then
      --     ls.change_choice(1)
      --   end
      -- end)

      -- vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")

    end,
  })

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

  use ({'mfussenegger/nvim-treehopper'})

--  use 'editorconfig/editorconfig-vim'
  use({
    'windwp/nvim-autopairs',
    config = function ()
      require('nvim-autopairs').setup({ enable_check_bracket_line = false })
    end,
  })
  use({
    'akinsho/nvim-toggleterm.lua', tag = 'v1.*',
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

-- mkdir
use {
  'jghauser/mkdir.nvim',
  config = function()
    require('mkdir')
  end
}

  -- R
  -- use 'jalvesaq/Nvim-R'
  use({
    'hkupty/iron.nvim',
    config = function()
      local iron = require('iron.core')

      iron.setup {
        config = {
          highlight_last = false,
          repl_open_cmd = require("iron.view").curry.right(95),
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
          -- send_motion = "<localleader>sc",
          visual_send = "<localleader><localleader>",
          send_line = "<localleader><localleader>",
          -- repeat_cmd = "<localleader>s.",
          -- cr = "<localleader>s<cr>",
          interrupt = "<localleader>xi",
          exit = "<localleader>xk",
          clear = "<localleader>xl",
        }
      }
    end,
  })


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
