return {
  {
    "hkupty/iron.nvim",
    enabled = true,
    config = function()
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
            python = require("iron.fts.python").python,
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

      vim.keymap.set("n", "<LocalLeader><space>", "<Cmd>IronFocus<CR>")
      vim.keymap.set("n", "<LocalLeader>h", "<Cmd>IronHide<CR>")

      vim.keymap.set("n", "<LocalLeader>mm", "<Cmd>lua require('iron.core').send('r', {[[targets::tar_make()]]})<CR>")
      vim.keymap.set("n", "<LocalLeader>mc", "<Cmd>lua require('iron.core').send('r', {[[targets::tar_destroy()]]})<CR>")

      -- Devtools
      vim.keymap.set("n", "<LocalLeader>pd", "<Cmd>lua require('iron.core').send('r', {[[devtools::document()]]})<CR>")
      vim.keymap.set("n", "<LocalLeader>pv", "<Cmd>lua require('iron.core').send('r', {[[devtools::build_vignettes()]]})<CR>")
      vim.keymap.set("n", "<LocalLeader>pT", "<Cmd>lua require('iron.core').send('r', {[[devtools::check()]]})<CR>")
      vim.keymap.set("n", "<LocalLeader>pt", "<Cmd>lua require('iron.core').send('r', {[[devtools::test()]]})<CR>")
      vim.keymap.set("n", "<LocalLeader>pl", "<Cmd>lua require('iron.core').send('r', {[[devtools::load_all()]]})<CR>")

      -- Renv
      vim.keymap.set("n", "<LocalLeader>ri", "<Cmd>lua require('iron.core').send('r', {[[renv::init(bare = TRUE)]]})<CR>")
      vim.keymap.set("n", "<LocalLeader>re", "<Cmd>lua require('iron.core').send('r', {[[renv::install(c('languageserver', 'devtools'))]]})<CR>")
      vim.keymap.set("n", "<LocalLeader>ru", "<Cmd>lua require('iron.core').send('r', {[[renv::update(prompt=F)]]})<CR>")
      vim.keymap.set("n", "<LocalLeader>rs", "<Cmd>lua require('iron.core').send('r', {[[renv::snapshot(prompt=F)]]})<CR>")
      vim.keymap.set("n", "<LocalLeader>rr", "<Cmd>lua require('iron.core').send('r', {[[renv::restore(prompt=F)]]})<CR>")
    end,
  },
  -- {
  --   "R-nvim/R.nvim",
  --   -- Only required if you also set defaults.lazy = true
  --   lazy = false,
  --   -- R.nvim is still young and we may make some breaking changes from time
  --   -- to time. For now we recommend pinning to the latest minor version
  --   -- like so:
  --   version = "~0.1.0",
  --   opts = {
  --     objbr_place = "console,above",
  --     user_maps_only = true,
  --     open_pdf = "no",
  --     pdfviewer = "",
  --     pipe_keymap = "",
  --     assignment_keymap = "",
  --
  --     hook = {
  --       on_filetype = function()
  --         -- This function will be called at the FileType event
  --         -- of files supported by R.nvim. This is an
  --         -- opportunity to create mappings local to buffers.
  --         --
  --         -- R management
  --         vim.keymap.set("n", "<LocalLeader>xx", "<Plug>RStart")
  --         vim.keymap.set("n", "<LocalLeader>xq", "<Plug>RClose")
  --         vim.keymap.set("n", "<LocalLeader>xk", "<Cmd>RKill<CR>")
  --         vim.keymap.set("n", "<LocalLeader>xi", "<Cmd>RStop<CR>")
  --         -- RObjectBrowser
  --         vim.keymap.set("n", "<LocalLeader>xo", "<Plug>ROBToggle")
  --         -- Send Cmds
  --         vim.keymap.set("n", "<LocalLeader><LocalLeader>", "<Plug>RSendLine")
  --         vim.keymap.set("v", "<LocalLeader><LocalLeader>", "<Plug>RSendSelection")
  --         -- Inspect Cmds
  --         vim.keymap.set("n", "<LocalLeader>ii", "<Plug>RObjectPr")
  --         vim.keymap.set("n", "<LocalLeader>is", "<Plug>RSummary")
  --         vim.keymap.set("n", "<LocalLeader>it", "<Plug>RObjectStr")
  --         vim.keymap.set("n", "<LocalLeader>in", "<Plug>RObjectNames")
  --         vim.keymap.set("n", "<LocalLeader>ih", "<Plug>RHelp")
  --         vim.keymap.set("n", "<LocalLeader>il", "<Plug>RListSpace")
  --
  --         -- Targets
  --         vim.keymap.set("n", "<LocalLeader>mm", "<Cmd>lua require('r.send').cmd([[targets::tar_make()]])<CR>")
  --         vim.keymap.set("n", "<LocalLeader>mc", "<Cmd>lua require('r.send').cmd([[targets::tar_destroy()]])<CR>")
  --
  --         -- Devtools
  --         vim.keymap.set("n", "<LocalLeader>pd", "<Cmd>lua require('r.send').cmd([[devtools::document()]])<CR>")
  --         vim.keymap.set("n", "<LocalLeader>pv", "<Cmd>lua require('r.send').cmd([[devtools::build_vignettes()]])<CR>")
  --         vim.keymap.set("n", "<LocalLeader>pT", "<Cmd>lua require('r.send').cmd([[devtools::check()]])<CR>")
  --         vim.keymap.set("n", "<LocalLeader>pt", "<Cmd>lua require('r.send').cmd([[devtools::test()]])<CR>")
  --         vim.keymap.set("n", "<LocalLeader>pl", "<Cmd>lua require('r.send').cmd([[devtools::load_all()]])<CR>")
  --
  --         -- Renv
  --         vim.keymap.set("n", "<LocalLeader>ri", "<Cmd>lua require('r.send').cmd([[renv::init(bare = TRUE)]])<CR>")
  --         vim.keymap.set("n", "<LocalLeader>re",
  --           "<Cmd>lua require('r.send').cmd([[renv::install(c('languageserver', 'devtools', 'pak'))]])<CR>")
  --         vim.keymap.set("n", "<LocalLeader>ru", "<Cmd>lua require('r.send').cmd([[renv::update(prompt=F)]])<CR>")
  --         vim.keymap.set("n", "<LocalLeader>rs", "<Cmd>lua require('r.send').cmd([[renv::snapshot(prompt=F)]])<CR>")
  --         vim.keymap.set("n", "<LocalLeader>rr", "<Cmd>lua require('r.send').cmd([[renv::restore(prompt=F)]])<CR>")
  --       end
  --     },
  --   },
  --   init = function()
  --     vim.g.rout_follow_colorscheme = true
  --   end,
  -- },
}
