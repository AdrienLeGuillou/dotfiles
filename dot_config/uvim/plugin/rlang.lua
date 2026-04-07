Config.later(function()
  vim.pack.add({ 'https://github.com/hkupty/iron.nvim' })

  local iron = require("iron.core")
  iron.setup({
    config = {
      highlight_last = false,
      repl_open_cmd = require("iron.view").split.vertical.botright(85),
      -- repl_open_cmd = require("iron.view").right(85),
      scratch_repl = false,
      -- should_map_plug = false,
      visibility = require("iron.visibility").toggle, -- toggle, focus, single
      close_window_on_exit = true,
      repl_definition = {
        sh = {
          command = { "zsh" },
        },
        r = {
          command = { "R", "--no-save" },
          format = require("iron.fts.common").bracketed_paste,
        },
        -- r = require("iron.fts.r").radian,
        -- r = require("iron.fts.r").r,
        python = require("iron.fts.python").ipython,
      },
    },
    -- Iron doesn't set keymaps by default anymore. Set them here
    -- or use `should_map_plug = true` and map from you vim files
    keymaps = {
      visual_send = "<localleader><localleader>",
      send_line = "<localleader><localleader>",
      interrupt = "<localleader>xi",
      exit = "<localleader>xk",
      clear = "<localleader>xl",
    },
  })

  vim.keymap.set("n", "<LocalLeader><space>", "<Cmd>IronFocus<CR>", { desc = 'Iron Focus' })
  vim.keymap.set("n", "<LocalLeader>h", "<Cmd>IronHide<CR>", { desc = 'Iron Hided' })
  vim.keymap.set("n", "<LocalLeader>mm", "<Cmd>lua require('iron.core').send('r', {[[targets::tar_make()]]})<CR>", { desc = 'R: tar_make' })
  vim.keymap.set("n", "<LocalLeader>mc", "<Cmd>lua require('iron.core').send('r', {[[targets::tar_destroy()]]})<CR>", { desc = 'R: tar_destroy' })
  -- Devtools
  vim.keymap.set("n", "<LocalLeader>pd", "<Cmd>lua require('iron.core').send('r', {[[devtools::document()]]})<CR>", { desc = 'R: Document' })
  vim.keymap.set("n", "<LocalLeader>pT", "<Cmd>lua require('iron.core').send('r', {[[devtools::check()]]})<CR>", { desc = 'R: Check' })
  vim.keymap.set("n", "<LocalLeader>pt", "<Cmd>lua require('iron.core').send('r', {[[devtools::test()]]})<CR>", { desc = 'R: Test' })
  vim.keymap.set("n", "<LocalLeader>pl", "<Cmd>lua require('iron.core').send('r', {[[devtools::load_all()]]})<CR>", { desc = 'R: Load all' })
  -- Renv
  vim.keymap.set("n", "<LocalLeader>ri", "<Cmd>lua require('iron.core').send('r', {[[renv::init(bare = TRUE)]]})<CR>", { desc = 'R: renv init' })
  vim.keymap.set("n", "<LocalLeader>re", "<Cmd>lua require('iron.core').send('r', {[[renv::install(c('languageserver', 'devtools'))]]})<CR>", { desc = 'R: Equip' })
  vim.keymap.set("n", "<LocalLeader>ru", "<Cmd>lua require('iron.core').send('r', {[[renv::update(prompt=F)]]})<CR>", { desc = 'R: renv update' })
  vim.keymap.set("n", "<LocalLeader>rs", "<Cmd>lua require('iron.core').send('r', {[[renv::snapshot(prompt=F)]]})<CR>", { desc = 'R: renv snapshot' })
  vim.keymap.set("n", "<LocalLeader>rr", "<Cmd>lua require('iron.core').send('r', {[[renv::restore(prompt=F)]]})<CR>", { desc = 'R: renv restore' })

end)
