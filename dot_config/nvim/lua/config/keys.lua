local wk = require('which-key')
local util = require('util')

wk.setup({})
vim.o.timeoutlen = 500

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- prevent Q from triggering ex mode
util.map('n', 'Q', '<Nop>')

-- if tmux navigator
util.map('i', '<A-h>', '<ESC><cmd>NvimTmuxNavigateLeft<CR>')
util.map('i', '<A-j>', '<ESC><cmd>NvimTmuxNavigateDown<CR>')
util.map('i', '<A-k>', '<ESC><cmd>NvimTmuxNavigateUp<CR>')
util.map('i', '<A-l>', '<ESC><cmd>NvimTmuxNavigateRight<CR>')

-- Use <C-j/k>, <Tab> and <S-Tab> to navigate through popup menu
util.map('i', '<Tab>',   [[ pumvisible() ? "\<C-n>" : "\<Tab>"]], {expr = true })
util.map('i', '<S-Tab>', [[ pumvisible() ? "\<C-p>" : "\<S-Tab>"]], {expr = true })
util.map('i', '<C-j>',   [[ pumvisible() ? "\<C-n>" : "\<C-j>"]],  {expr = true })
util.map('i', '<C-k>',   [[ pumvisible() ? "\<C-p>" : "\<C-k>"]],  {expr = true })
util.map('i', '<C-l>',   [[ pumvisible() ? "\<C-y>" : "\<C-l>"]],  {expr = true })

-- -- hop.nvim
-- util.map('n', 's', '<cmd>HopChar1<CR>', {noremap = false})
-- util.map('v', 's', '<cmd>HopChar1<CR>', {noremap = false})

-- Alt-- to insert <-
-- util.map('i', '<A-->', '<esc>bea <- ')
util.map('i', '<A-->', '<-')

util.map('x', '<A-p>', '"_dP')

-- which-key
wk.add({
  {"<leader>:", "q:", desc = "Command-line window"},
  {"<leader>:", "q:", desc = "Command-line window", mode = "v"},
  {"<leader><tab>", "<C-^>", desc = "Alternate Buffer"},
  {"<leader>qq", "<cmd>confirm quitall<CR>", desc = "Confirm quit-all"},

  {"<leader>b", group = "Buffers"},
  {"<leader>bb", "<cmd>Telescope buffers<CR>", desc = "List buffers"},

  {"<leader>c", group = "Code (LSP)"},
  {"<leader>cd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Definition"},
  {"<leader>cf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", desc = "Format"},
  {"<leader>ch", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover"},
  {"<leader>ci", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Go to implementation"},
  {"<leader>cs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature help"},
  {"<leader>ct", "<cmd>lua vim.lsp.buf.type_definition()<CR>", desc = "Implementation"},
  {"<leader>cr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "References"},
  {"<leader>cl", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", desc = "Document symbol"},
  {"<leader>cw", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", desc = "Workspace symbol"},
  {"<leader>ce", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Declaration"},
  {"<leader>cp", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code action"},
  {"<leader>cR", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename"},

  {"<leader>d", group = "Diagnostics (LSP)"},
  {"<leader>de", "<cmd>lua vim.diagnostic.enable()<CR>", desc = "Enable"},
  {"<leader>dd", "<cmd>lua vim.diagnostic.disable()<CR>", desc = "Disable"},
  {"<leader>dh", "<cmd>lua vim.diagnostic.hide()<CR>", desc = "Hide"},
  {"<leader>ds", "<cmd>lua vim.diagnostic.show()<CR>", desc = "Show"},
  {"<leader>do", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "View diagnostic"},
  {"<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next diagnostic"},
  {"<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Previous diagnostic"},

  {"<leader>f", group = "File"},
  {"<leader>fb", "<cmd>lua require('telescope').extensions.file_browser.file_browser()<CR>", desc = "File Browser (Show All)" },
  {"<leader>fB",  "<cmd>lua require('telescope').extensions.file_browser.file_browser({hidden = true, no_ignore = true})<CR>", desc = "File Browser (Show All)"},
  {"<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Open file"},
  {"<leader>fF", "<cmd>lua require('telescope.builtin').find_files({hidden = true, no_ignore = true})<CR>", desc = "Open file (Show All)" },
  {"<leader>ft", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree"},
  {"<leader>fs", "<cmd>w<CR>", desc = "Save file"},
  {"<leader>fc", "<cmd>lua require('util').cleanup()<CR>", desc = "Cleanup file"},

  {"<leader>g", group = "Goto (Harpoon)"},
  {"<leader>gq",  "<cmd>lua require('harpoon.mark').add_file()<CR>", desc = "Add mark" },
  {"<leader>ga", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", desc = "Go to file 1"},
  {"<leader>gs", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", desc = "Go to file 2"},
  {"<leader>gd", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", desc = "Go to file 3"},
  {"<leader>gf", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", desc = "Go to file 4"},
  {"<leader>gg",  "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Harpoon quick menu"},

  {"<leader>i", group = "Insert"},
  {"<leader>id", "<cmd>lua require('util').fill_dash() <CR>", desc = "Insert dashes"},
  {"<leader>is", "<cmd>Telescope symbols<CR>", desc = "Insert symbol"},
  {"<leader>iT", "<cmd>read !date<CR>", desc = "Insert timestamp"},

  {"<leader>p", group = "Panes (tabs)"},
  {"<leader>pc", "<cmd>tabnew<CR>", desc = "Create new tab"},
  {"<leader>p<tab>", "g<Tab>", desc = "Alternate tab"},
  {"<leader>px", "<cmd>tabclose<CR>", desc = "Delete tab"},
  {"<leader>pl", "<cmd>tabnext<CR>", desc = "Next tab"},
  {"<leader>ph", "<cmd>tabprev<CR>", desc = "Previous tab"},

  {"<leader>s", group = "Search"},
  {"<leader>sc", "<cmd>nohl<CR>", desc = "Clear highlight"},
  {"<leader>se", "<cmd>Telescope command_history:<CR>", desc = "Search command history"},
  {"<leader>sf", "<cmd>Telescope live_grep<CR>", desc = "Search line in files"},
  {"<leader>sh", "<cmd>Telescope help_tags<CR>", desc = "Search vim help"},
  {"<leader>sl", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Search line in buffer"},
  {"<leader>so", "<cmd>Telescope quickfix<CR>", desc = "Search the quickfix list"},

  {"<leader>t", group = "Toggles"},
  {"<leader>tw", "<cmd>set wrap!<CR>", desc = "Toggle line wrap"},
  {"<leader>ts", "<cmd>set spell!<CR>", desc = "Toggle spell checking"},
  {"<leader>tu", "<cmd>UndotreeToggle<CR>", desc = "Toggle Undotree"},

  {"<leader>w", group = "Windows"},
  {"<leader>w/", "<cmd>vs<CR>", desc = "Vertical split"},
  {"<leader>w-", "<cmd>sv<CR>", desc = "Horizontal split"},
  {"<leader>w=", "<C-w>=", desc = "Equalize windows"},
  {"<leader>wd", "<C-w>q", desc = "Close window"},
  {"<leader>ww", "<cmd>Windows<CR>", desc = "List windows"},
  {"<leader>wo", "<cmd>only<CR>", desc = "Only window"},

  {"<leader>S", group = "Spell"},
  {"<leader>SS", "<cmd>Telescope spell_suggest<CR>", desc = "Spelling suggestion"},

  {"<localleader>xx", "<cmd>IronRepl<CR>", desc = "IronRepl"},
})

