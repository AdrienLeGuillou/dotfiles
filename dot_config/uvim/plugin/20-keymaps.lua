_G.Config.leader_group_clues = {
  -- { mode = 'n', keys = '<Leader>b', desc = '+Buffer' },
  { mode = 'n', keys = '<Leader>c', desc = '+Code (lsp)' },
  { mode = 'n', keys = '<Leader>f', desc = '+Files' },
  -- { mode = 'n', keys = '<Leader>g', desc = '+Git' },
  -- { mode = 'n', keys = '<Leader>l', desc = '+Language' },
  -- { mode = 'n', keys = '<Leader>m', desc = '+Map' },
  -- { mode = 'n', keys = '<Leader>o', desc = '+Other' },
  { mode = 'n', keys = '<Leader>s', desc = '+Search' },
  -- { mode = 'n', keys = '<Leader>t', desc = '+Terminal' },
  -- { mode = 'n', keys = '<Leader>v', desc = '+Visits' },
  { mode = 'n', keys = '<Leader>w', desc = '+Windows' },

  -- { mode = 'x', keys = '<Leader>g', desc = '+Git' },
  { mode = 'c', keys = '<Leader>c', desc = '+Code (lsp)' },
}

vim.keymap.set('n', '<leader><tab>', '<C-^>',  { desc = 'Alternate Buffer' })

vim.keymap.set('n', '<Leader>ff', '<CMD>Pick files<CR>',  { desc = 'Find' })
vim.keymap.set('n', '<Leader>fs', '<CMD>w<CR>',  { desc = 'Save' })
vim.keymap.set('n', '<leader>fd', '<CMD>lua MiniFiles.open()<CR>', { desc = 'Directory' })

vim.keymap.set('n', '<leader>w/', '<CMD>vs<CR>', { desc = 'Vertical Split' })
vim.keymap.set('n', '<leader>w-', '<CMD>sv<CR>', { desc = 'Horizontal Split' })
vim.keymap.set('n', '<leader>wd', '<CMD>q<CR>', { desc = 'Close' })
vim.keymap.set('n', '<leader>wo', '<CMD>only<CR>', { desc = 'Only' })
vim.keymap.set('n', '<leader>w=', '<C-w>=', { desc = 'Equal Size' })

vim.keymap.set('n', '<Leader>sc', '<CMD>nohl<CR>',  { desc = 'Clear' })
vim.keymap.set('n', '<Leader>sh', '<CMD>Pick help<CR>',  { desc = 'Help' })
vim.keymap.set('n', '<Leader>sg', '<CMD>Pick grep_live<CR>',  { desc = 'Grep live' })
vim.keymap.set('n', '<Leader>sh', '<CMD>GrugFar<CR>',  { desc = 'Search & Replace' })
vim.keymap.set('v', '<Leader>sh', ":<C-U>'<,'>GrugFar<CR>",  { desc = 'Search & Replace' })

vim.keymap.set('n', '<Leader>qq', '<CMD>confirm quitall<CR>',  { desc = 'Quit All' })

vim.keymap.set('n', "<leader>cd", "<cmd>lua vim.lsp.buf.definition()<CR>",           { desc = "Definition" })
vim.keymap.set('n', "<leader>cf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", { desc = "Format" })
vim.keymap.set('n', "<leader>ch", "<cmd>lua vim.lsp.buf.hover()<CR>",                { desc = "Hover" })
vim.keymap.set('n', "<leader>ci", "<cmd>lua vim.lsp.buf.implementation()<CR>",       { desc = "Go to implementation" })
vim.keymap.set('n', "<leader>cs", "<cmd>lua vim.lsp.buf.signature_help()<CR>",       { desc = "Signature help" })
vim.keymap.set('n', "<leader>ct", "<cmd>lua vim.lsp.buf.type_definition()<CR>",      { desc = "Implementation" })
vim.keymap.set('n', "<leader>cr", "<cmd>lua vim.lsp.buf.references()<CR>",           { desc = "References" })
vim.keymap.set('n', "<leader>cl", "<cmd>lua vim.lsp.buf.document_symbol()<CR>",      { desc = "Document symbol" })
vim.keymap.set('n', "<leader>cw", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>",     { desc = "Workspace symbol" })
vim.keymap.set('n', "<leader>ce", "<cmd>lua vim.lsp.buf.declaration()<CR>",          { desc = "Declaration" })
vim.keymap.set('n', "<leader>cp", "<cmd>lua vim.lsp.buf.code_action()<CR>",          { desc = "Code action" })
vim.keymap.set('n', "<leader>cR", "<cmd>lua vim.lsp.buf.rename()<CR>",               { desc = "Rename" })


vim.keymap.set({ "", "!", "t" }, "<C-\\>", "<cmd>ToggleTerm<CR>", { desc = "Toggle Term" })