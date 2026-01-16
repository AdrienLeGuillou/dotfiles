return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      {"neovim/nvim-lspconfig", lazy = false},
    },
    config = function()
      require('mason').setup()

      -- r_language_server config -- disable default formatting to use `air` instead
      --   (must install air with :MasonInstall air)
      vim.lsp.config(
        "r_language_server", {
          on_attach = function(client, _)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
        }
      )

      vim.lsp.config(
        "pylsp", {
          capabilities = {
            window = {
              workDoneProgress = false
            }
          }
        }
      )
      vim.lsp.enable("air")
      vim.lsp.enable("r_language_server")
      vim.lsp.enable("clangd")
      vim.lsp.enable("pylsp")
    end,
  },

  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   lazy = false,
  --   dependencies = {
  --     {"neovim/nvim-lspconfig", lazy = false},
  --     { "williamboman/mason.nvim", opts = {} },
  --   },
  --   keys = {
  --     { "<leader>cd", "<cmd>lua vim.lsp.buf.definition()<CR>",           desc = "Definition" },
  --     { "<leader>cf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", desc = "Format" },
  --     { "<leader>ch", "<cmd>lua vim.lsp.buf.hover()<CR>",                desc = "Hover" },
  --     { "<leader>ci", "<cmd>lua vim.lsp.buf.implementation()<CR>",       desc = "Go to implementation" },
  --     { "<leader>cs", "<cmd>lua vim.lsp.buf.signature_help()<CR>",       desc = "Signature help" },
  --     { "<leader>ct", "<cmd>lua vim.lsp.buf.type_definition()<CR>",      desc = "Implementation" },
  --     { "<leader>cr", "<cmd>lua vim.lsp.buf.references()<CR>",           desc = "References" },
  --     { "<leader>cl", "<cmd>lua vim.lsp.buf.document_symbol()<CR>",      desc = "Document symbol" },
  --     { "<leader>cw", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>",     desc = "Workspace symbol" },
  --     { "<leader>ce", "<cmd>lua vim.lsp.buf.declaration()<CR>",          desc = "Declaration" },
  --     { "<leader>cp", "<cmd>lua vim.lsp.buf.code_action()<CR>",          desc = "Code action" },
  --     { "<leader>cR", "<cmd>lua vim.lsp.buf.rename()<CR>",               desc = "Rename" },
  --   },
  -- },

  -- {
  --   "neovim/nvim-lspconfig",
  --   dependencies = {
  --     -- 'hrsh7th/cmp-nvim-lsp',
  --     'saghen/blink.cmp',
  --     {
  --       "folke/lazydev.nvim",
  --       ft = "lua", -- only load on lua files
  --       opts = {
  --         library = {
  --           { path = "${3rd}/luv/library", words = { "vim%.uv" } },
  --         },
  --       },
  --     },
  --   },
  --   -- opts = {
  --   --   servers = {
  --   --     lua_ls = {},
  --   --     clangd = {},
  --   --     r_language_server = {},
  --   --   }
  --   -- },
  --   -- config = function(_, opts)
  --   --   local lspconfig = require('lspconfig')
  --   --   for server, config in pairs(opts.servers) do
  --   --     -- config.capabilities = require('cmp_nvim_lsp').default_capabilities()
  --   --     -- config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
  --   --     -- lspconfig[server].setup(config)
  --   --     vim.lsp.config(server, {})
  --   --   end
  --   -- end,

}