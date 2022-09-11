local wk = require('which-key')
local util = require('util')

wk.setup({})
vim.o.timeoutlen = 500

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- prevent Q from triggering ex mode
util.map('n', 'Q', '<Nop>')

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

-- hop.nvim
util.map('n', 's', '<cmd>HopChar1<CR>', {noremap = false})
util.map('v', 's', '<cmd>HopChar1<CR>', {noremap = false})

-- nvim-treehopper
-- do not try to replace `:` with `<cmd>` here. does not work
util.map('o', 'm', ':<C-U>lua require("tsht").nodes()<CR>', {noremap = false})
util.map('v', 'm', ':lua require("tsht").nodes()<CR>')

-- Alt-- to insert <-
-- util.map('i', '<A-->', '<esc>bea <- ')
util.map('i', '<A-->', '<-')

util.map('x', '<A-p>', '"_dP')

-- which-key
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
    c = {
      name = '+code (LSP)',
      d = {'<cmd>lua vim.lsp.buf.definition()<CR>', 'Definition'},
      f = {'<cmd>lua vim.lsp.buf.format({async = true})<CR>', 'Format'},
      h = {'<cmd>lua vim.lsp.buf.hover()<CR>', 'Hover'},
      i = {'<cmd>lua vim.lsp.buf.implementation()<CR>', 'Go to implementation'},
      o = {'<cmd>lua vim.diagnostic.open_float()<CR>', 'View diagnostic'},
      s = {'<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Signature help'},
      t = {'<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Implementation'},
      r = {'<cmd>lua vim.lsp.buf.references()<CR>', 'References'},
      l = {'<cmd>lua vim.lsp.buf.document_symbol()<CR>', 'Document symbol'},
      w = {'<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', 'Workspace symbol'},
      e = {'<cmd>lua vim.lsp.buf.declaration()<CR>', 'Declaration'},
      a = {'<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code action'},
      R = {'<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename'},
      n = {'<cmd>lua vim.diagnostic.goto_next()<CR>', 'Next diagnostic'},
      p = {'<cmd>lua vim.diagnostic.goto_prev()<CR>', 'Previous diagnostic'},
    },
    f = {
      name = '+file',
      b = {
        '<cmd>lua require("telescope").extensions.file_browser.file_browser()<CR>',
        'File Browser (Show All)'
      },
      B = {
        '<cmd>lua require("telescope").extensions.file_browser.file_browser({hidden = true, no_ignore = true})<CR>',
        'File Browser (Show All)'
      },
      f = {'<cmd>Telescope find_files<CR>', 'Open file'},
      F = {
        '<cmd>lua require("telescope.builtin").find_files({hidden = true, no_ignore = true})<CR>',
        'Open file (Show All)'
      },
      t = {'<cmd>NvimTreeToggle<CR>', 'Toggle file tree'},
      s = {'<cmd>w<CR>', 'Save file'},
      c = {[[<cmd>lua require('util').cleanup()<CR>]], 'Cleanup file'},
    },
    g = {
      name = '+goto (Harpoon)',
      q = { '<cmd>lua require("harpoon.mark").add_file()<CR>', 'Add mark' },
      a = {'<cmd>lua require("harpoon.ui").nav_file(1)<CR>', 'Go to file 1'},
      s = {'<cmd>lua require("harpoon.ui").nav_file(2)<CR>', 'Go to file 2'},
      d = {'<cmd>lua require("harpoon.ui").nav_file(3)<CR>', 'Go to file 3'},
      f = {'<cmd>lua require("harpoon.ui").nav_file(4)<CR>', 'Go to file 4'},
      g = {
        '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>',
        'Harpoon quick menu'
      },
    },
    i = {
      name = '+insert',
      d = {'<cmd>lua require("util").fill_dash() <CR>', 'Insert dashes'},
      s = {'<cmd>Telescope symbols<CR>', 'Insert symbol'},
      T = {'<cmd>read !date<CR>', 'Insert timestamp'},
    },
    p = {
      name = '+panes (tabs)',
      c = {'<cmd>tabnew<CR>', 'Create new tab'},
      ['<tab>'] = {'g<Tab>', 'Alternate tab'},
      x = {'<cmd>tabclose<CR>', 'Delete tab'},
      l = {'<cmd>tabnext<CR>', 'Next tab'},
      h = {'<cmd>tabprev<CR>', 'Previous tab'},
    },
    s = {
      name = '+search',
      c = {'<cmd>nohl<CR>', 'Clear highlight'},
      e = {'<cmd>Telescope command_history:<CR>', 'Search command history'},
      f = {'<cmd>Telescope live_grep<CR>', 'Search line in files'},
      h = {'<cmd>Telescope help_tags<CR>', 'Search vim help'},
      l = {'<cmd>Telescope current_buffer_fuzzy_find<CR>', 'Search line in buffer'},
      o = {'<cmd>Telescope quickfix<CR>', 'Search the quickfix list'},
      s = {'<Plug>(easymotion-overwin-f2)', 'EasyMotion (2 chars)', noremap = false},
    },
    t = {
      name = '+toggles',
      m = {'<cmd>MinimapToggle<CR>', 'Toggle minimap'},
      w = {'<cmd>set wrap!<CR>', 'Toggle line wrap'},
      s = {'<cmd>set spell!<CR>', 'Toggle spell checking'},
      u = {'<cmd>UndotreeToggle<CR>', 'Toggle Undotree'},
      t = {'<cmd>ToggleTerm<CR>', 'Toggle Term'},
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
    z = {
      name = '+Zettelkasten',
      n = {'<Cmd>ZkNew { title = vim.fn.input("Title: ") }<CR>', 'New Note'},
      o = {"<Cmd>ZkNotes { sort = { 'modified' } }<CR>", 'Search Notes'},
      t = {"<Cmd>ZkTags<CR>", 'Search Tag'},
      f = {"<Cmd>'<,'>ZkMatch<CR>", 'Search Selected', mode = 'v'},
    },
    S = {
      name = '+Spell',
      S = {'<cmd>Telescope spell_suggest<CR>', 'Spelling suggestion'},
    },
    P = {
      name = '+Packer',
      s = {'<cmd>PackerSync<CR>', 'Sync'},
    },
  },


  ['<localleader>'] = {
    ['<localleader>'] = {
      '<cmd>lua require("iron").core.send_line()<CR>j', 'Send Line',
    },
    ['<space>'] = {
      '<cmd>IronFocus<CR>',
      'Focus on REPL',
    },
    x = {
      name = '+REPL',
      x = {'<cmd>IronRepl<CR>', 'IronRepl'},
      r = {
        '<cmd>lua require("iron").core.repl_restart()<CR>',
        'Restart REPL'
      },
    },
  },
})

