local wk = require('which-key')
local util = require('util')

wk.setup({})
vim.o.timeoutlen = 500

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- -- if tmux navigator
util.map('n', '<A-h>', '<cmd>TmuxNavigateLeft<CR>')
util.map('n', '<A-j>', '<cmd>TmuxNavigateDown<CR>')
util.map('n', '<A-k>', '<cmd>TmuxNavigateUp<CR>')
util.map('n', '<A-l>', '<cmd>TmuxNavigateRight<CR>')
util.map('i', '<A-h>', '<ESC><cmd>TmuxNavigateLeft<CR>')
util.map('i', '<A-j>', '<ESC><cmd>TmuxNavigateDown<CR>')
util.map('i', '<A-k>', '<ESC><cmd>TmuxNavigateUp<CR>')
util.map('i', '<A-l>', '<ESC><cmd>TmuxNavigateRight<CR>')
util.map('t', '<A-h>', [[<C-\><C-n><cmd>TmuxNavigateLeft<CR>]])
util.map('t', '<A-j>', [[<C-\><C-n><cmd>TmuxNavigateDown<CR>]])
util.map('t', '<A-k>', [[<C-\><C-n><cmd>TmuxNavigateUp<CR>]])
util.map('t', '<A-l>', [[<C-\><C-n><cmd>TmuxNavigateRight<CR>)]])
-- -- else
-- util.map('n', '<A-h>', '<C-w>h')
-- util.map('n', '<A-j>', '<C-w>j')
-- util.map('n', '<A-k>', '<C-w>k')
-- util.map('n', '<A-l>', '<C-w>l')
-- util.map('i', '<A-h>', '<ESC><C-w>h')
-- util.map('i', '<A-j>', '<ESC><C-w>j')
-- util.map('i', '<A-k>', '<ESC><C-w>k')
-- util.map('i', '<A-l>', '<ESC><C-w>l')
-- util.map('t', '<A-h>', [[<C-\><C-n><C-w>h]])
-- util.map('t', '<A-j>', [[<C-\><C-n><C-w>j]])
-- util.map('t', '<A-k>', [[<C-\><C-n><C-w>k]])
-- util.map('t', '<A-l>', [[<C-\><C-n><C-w>l]])

-- Use <C-j/k>, <Tab> and <S-Tab> to navigate through popup menu
util.map('i', '<Tab>',   [[ pumvisible() ? "\<C-n>" : "\<Tab>"]], {expr = true })
util.map('i', '<S-Tab>', [[ pumvisible() ? "\<C-p>" : "\<S-Tab>"]], {expr = true })
util.map('i', '<C-j>',   [[ pumvisible() ? "\<C-n>" : "\<C-j>"]],  {expr = true })
util.map('i', '<C-k>',   [[ pumvisible() ? "\<C-p>" : "\<C-k>"]],  {expr = true })
util.map('i', '<C-l>',   [[ pumvisible() ? "\<C-y>" : "\<C-l>"]],  {expr = true })

-- EasyMotion
util.map('n', 's', '<Plug>(easymotion-s)', {noremap = false})
util.map('v', 's', '<Plug>(easymotion-s)', {noremap = false})

wk.register({
  ['<leader>:'] = {'q:', 'Command-line window'},
  ['<leader>:'] = {'q:', 'Command-line window', mode = 'v'},

  ['<leader>'] = {
    ['<tab>'] = {'<C-^>', 'Alternate Buffer'},
    ['qq'] = {'<cmd>confirm quitall<CR>', 'Confirm quit-all'},
    b = {
      name = '+buffers', -- optional group name
      b = {'<cmd>Telescope buffers<CR>', 'List buffers'}, -- create a binding with label
      d = {'<cmd>Bdelete<CR>', 'Delete buffer'}, -- create a binding with label
      -- d = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, buffer = 123 }, -- additional options for creating the keymap
      -- n = { "New File" }, -- just a label. don't create any mapping
      -- e = "Edit File", -- same as above
      -- ["1"] = "which_key_ignore",  -- special label to hide it in the popup
      -- b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
    },
    w = {
      name = '+windows',
      ['/'] = {'<cmd>vs<CR>', 'Vertical split'},
      ['-'] = {'<cmd>sv<CR>', 'Horizontal split'},
      ['='] = {'<C-w>=', 'Equalize windows'},
      d = {'<C-w>q', 'Close window'},
      w = {'<cmd>Windows<CR>', 'List windows'},
      o = {'<cmd>only<CR>', 'Only window'}
    },
    p = {
      name = '+panes (tabs)',
      c = {'<cmd>tabnew<CR>', 'Create new tab'},
      ['<tab>'] = {'g<Tab>', 'Alternate tab'},
      x = {'<cmd>tabclose<CR>', 'Delete tab'},
      l = {'<cmd>tabnext<CR>', 'Next tab'},
      h = {'<cmd>tabprev<CR>', 'Previous tab'},
    },
    f = {
      name = '+file',
      b = {'<cmd>Telescope file_browser<CR>', 'File Browser'},
      f = {'<cmd>Telescope find_files<CR>', 'Open file'},
      F = {
        '<cmd>lua require("telescope.builtin").find_files({hidden = true, no_ignore = true})<CR>', 
        'Open file (Show All)'
      },
      t = {'<cmd>NvimTreeToggle<CR>', 'Toggle file tree'},
      s = {'<cmd>w<CR>', 'Save file'},
      c = {[[<cmd>lua require('util').cleanup()<CR>]], 'Cleanup file'},
    },
    s = {
      name = '+search',
      c = {'<cmd>nohl<CR>', 'Clear highlight'},
      l = {'<cmd>Telescope current_buffer_fuzzy_find<CR>', 'Search line in buffer'},
      f = {'<cmd>Telescope live_grep<CR>', 'Search line in files'},
      e = {'<cmd>Telescope command_history:<CR>', 'Search command history'},
      h = {'<cmd>Telescope help_tags<CR>', 'Search vim help'},
      s = {'<Plug>(easymotion-overwin-f2)', 'EasyMotion (2 chars)', noremap = false},
    },
    S = {
      name = '+Spell',
      S = {'<cmd>Telescope spell_suggest<CR>', 'Spelling suggestion'},
    },
    t = {
      name = '+toggles',
      m = {'<cmd>MinimapToggle<CR>', 'Toggle minimap'},
      w = {'<cmd>set wrap!<CR>', 'Toggle line wrap'},
      s = {'<cmd>set spell!<CR>', 'Toggle spell checking'},
      u = {'<cmd>UndotreeToggle<CR>', 'Toggle Undotree'},
      t = {'<cmd>ToggleTerm<CR>', 'Toggle Term'},
    },
    i = {
      name = '+insert',
      s = {'<cmd>Telescope symbols<CR>', 'Insert symbol'},
      T = {'<cmd>read !date<CR>', 'Insert timestamp'},
    },
    c = {
      name = '+code (LSP)',
      d = {'<cmd>lua vim.lsp.buf.definition()<CR>', 'Definition'},
      f = {'<cmd>lua vim.lsp.buf.formatting()<CR>', 'Format'},
      h = {'<cmd>lua vim.lsp.buf.hover()<CR>', 'Hover'},
      i = {'<cmd>lua vim.lsp.buf.implementation()<CR>', 'Go to implementation'},
      s = {'<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Signature help'},
      t = {'<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Implementation'},
      r = {'<cmd>lua vim.lsp.buf.references()<CR>', 'References'},
      l = {'<cmd>lua vim.lsp.buf.document_symbol()<CR>', 'Document symbol'},
      w = {'<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', 'Workspace symbol'},
      e = {'<cmd>lua vim.lsp.buf.declaration()<CR>', 'Declaration'},
      a = {'<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code action'},
      R = {'<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename'},
      n = {'<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', 'Next diagnostic'},
      p = {'<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', 'Previous diagnostic'},
    },
    P = {
      name = '+Packer',
      s = {'<cmd>PackerSync<CR>', 'Sync'},
    },
  },
})
