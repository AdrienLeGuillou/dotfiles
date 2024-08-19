return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require'lspconfig'
      lspconfig.bashls.setup({ capabilities = capabilities })
      lspconfig.r_language_server.setup({ capabilities = capabilities })
      lspconfig.wgsl_analyzer.setup({ capabilities = capabilities })
      lspconfig.pylsp.setup({ capabilities = capabilities })
      lspconfig.clangd.setup({ capabilities = capabilities })
      lspconfig.zls.setup({ capabilities = capabilities })
    end,
  },
}
