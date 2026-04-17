Config.now_if_args(function()
  vim.pack.add({
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/williamboman/mason.nvim',
  })

  require('mason').setup()
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

  table.insert(Config.leader_group_clues,
              { mode = 'n', keys = '<Leader>d', desc = '+Diagnostics (LSP)' })
  vim.keymap.set('n', '<leader>de', '<cmd>lua vim.diagnostic.enable(true)<CR>', { desc = 'Enable' })
  vim.keymap.set('n', '<leader>dd', '<cmd>lua vim.diagnostic.enable(false)<CR>', { desc = 'Disable' })
  vim.keymap.set('n', '<leader>dh', '<cmd>lua vim.diagnostic.hide()<CR>', { desc = 'Hide' })
  vim.keymap.set('n', '<leader>ds', '<cmd>lua vim.diagnostic.show()<CR>', { desc = 'Show' })
  vim.keymap.set('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = 'View diagnostic' })
  vim.keymap.set('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', { desc = 'Next diagnostic' })
  vim.keymap.set('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { desc = 'Previous diagnostic' })

  table.insert(Config.leader_group_clues,
  { mode = 'n', keys = '<Leader>c', desc = '+Code' })
  vim.keymap.set('n', '<leader>cd', '<cmd>lua vim.lsp.buf.definition()<CR>', { desc = 'Definition' })
  vim.keymap.set('n', '<leader>cf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', { desc = 'Format' })
  vim.keymap.set('n', '<leader>ch', '<cmd>lua vim.lsp.buf.hover()<CR>', { desc = 'Hover' })
  vim.keymap.set('n', '<leader>ci', '<cmd>lua vim.lsp.buf.implementation()<CR>', { desc = 'Go to implementation' })
  vim.keymap.set('n', '<leader>cs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { desc = 'Signature help' })
  vim.keymap.set('n', '<leader>ct', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { desc = 'Implementation' })
  vim.keymap.set('n', '<leader>cr', '<cmd>lua vim.lsp.buf.references()<CR>', { desc = 'References' })
  vim.keymap.set('n', '<leader>cl', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', { desc = 'Document symbol' })
  vim.keymap.set('n', '<leader>cw', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', { desc = 'Workspace symbol' })
  vim.keymap.set('n', '<leader>ce', '<cmd>lua vim.lsp.buf.declaration()<CR>', { desc = 'Declaration' })
  vim.keymap.set('n', '<leader>cp', '<cmd>lua vim.lsp.buf.code_action()<CR>', { desc = 'Code action' })
  vim.keymap.set('n', '<leader>cR', '<cmd>lua vim.lsp.buf.rename()<CR>', { desc = 'Rename' })

  vim.keymap.set('n', '<leader>cK', '<cmd>lsp disable<CR>', { desc = 'Disable LSP' })
  vim.keymap.set('n', '<leader>cS', '<cmd>lsp enable<CR>', { desc = 'Enable LSP' })

end)
