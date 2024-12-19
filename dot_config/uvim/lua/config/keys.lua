local wk = require("which-key")

-- -- Use CTRL-J/K as CTRL-N/P in Ins and Cmd modes
-- vim.keymap.set({ "!" }, "<C-K>", "<C-P>")
-- vim.keymap.set({ "!" }, "<C-J>", "<C-N>")

wk.add({
  { "<leader><tab>", "<C-^>",                    desc = "Alternate Buffer" },
  { "<leader>c",     group = "Code" },

  { "<leader>qq",    "<cmd>confirm quitall<CR>", desc = "Confirm quit-all" },

  { "<leader>f",     group = "File" },
  { "<leader>fs",    "<CMD>w<CR>",               desc = "Save file" },

  { "<leader>w",     group = "Windows" },
  { "<leader>w/",    "<cmd>vs<CR>",              desc = "Vertical split" },
  { "<leader>w-",    "<cmd>sv<CR>",              desc = "Horizontal split" },
  { "<leader>w=",    "<C-w>=",                   desc = "Equalize windows" },
  { "<leader>wd",    "<C-w>q",                   desc = "Close window" },
  { "<leader>ww",    "<cmd>Windows<CR>",         desc = "List windows" },
  { "<leader>wo",    "<cmd>only<CR>",            desc = "Only window" },

  { "<leader>s",     group = "Search" },
  {"<leader>sc", "<cmd>nohl<CR>", desc = "Clear highlight"},

  {"<leader>d", group = "Diagnostics (LSP)"},
  {"<leader>de", "<cmd>lua vim.diagnostic.enable()<CR>", desc = "Enable"},
  {"<leader>dd", "<cmd>lua vim.diagnostic.disable()<CR>", desc = "Disable"},
  {"<leader>dh", "<cmd>lua vim.diagnostic.hide()<CR>", desc = "Hide"},
  {"<leader>ds", "<cmd>lua vim.diagnostic.show()<CR>", desc = "Show"},
  {"<leader>do", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "View diagnostic"},
  {"<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next diagnostic"},
  {"<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Previous diagnostic"},

})
