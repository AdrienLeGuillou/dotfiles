-- Things I may want to try at some point:
--
-- * :set cuc -- cursor column. Could be usefull for align. Contextual
-- * Highlight on yank augroup (apparently on kickstart)
-- * mini.nvim
-- * snacks.nvim
-- * help ins-completion
-- * quickfix list

require("config.options")
require("config.lazy")
require("config.keys")

vim.opt.background = "light"
vim.cmd.colorscheme("gruvbox")

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "README",
  callback = function()
    vim.cmd.set("ft=markdown")
  end,
})

-- r_language_server config -- disable default formatting to use `air` instead
--   (must install air with :MasonInstall air)
require("lspconfig").r_language_server.setup({
    on_attach = function(client, _)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
})
vim.lsp.enable("air")
vim.lsp.enable("r_language_server")
