return {
  {
    "hkupty/iron.nvim",
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
            r = require("iron.fts.r").radian,
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
    end,
  },
  -- {
  --   "R-nvim/R.nvim",
  --   config = function()
  --     local opts = {
  --       user_maps_only = true,
  --       R_args = {"--quiet", "--no-save"},
  --       R_app = "radian",
  --       hook = {
  --         after_config = function ()
  --           -- This function will be called at the FileType event
  --           -- of files supported by R.nvim. This is an
  --           -- opportunity to create mappings local to buffers.
  --           if vim.o.syntax ~= "rbrowser" then
  --             vim.api.nvim_buf_set_keymap(0, "n", "<localleader>rf", "<Plug>RStart", {})
  --             vim.api.nvim_buf_set_keymap(0, "n", "<localleader>rk", "<Plug>RKill", {})
  --             vim.api.nvim_buf_set_keymap(0, "n", "<localleader>ro", "<Plug>ROBToggle", {})
  --             vim.api.nvim_buf_set_keymap(0, "n", "<localleader>rq", "<Cmd>lua require('r.send').cmd('quit(save = \"no\")')<CR>", {})
  --
  --             vim.api.nvim_buf_set_keymap(0, "n", "<localleader><localleader>", "<Plug>RDSendLine", {})
  --             vim.api.nvim_buf_set_keymap(0, "v", "<localleader><localleader>", "<Plug>RDSendSelection", {})
  --
  --             vim.api.nvim_buf_set_keymap(0, "n", "<LocalLeader>mm", "<Cmd>lua require('r.send').cmd('targets::tar_make_future()')<CR>", {})
  --             vim.api.nvim_buf_set_keymap(0, "n", "<LocalLeader>mc", "<Cmd>lua require('r.send').cmd('targets::tar_destroy()')<CR>", {})
  --
  --             vim.api.nvim_buf_set_keymap(0, "n", "<LocalLeader>pd", "<Cmd>lua require('r.send').cmd('devtools::document()')<CR>", {})
  --             vim.api.nvim_buf_set_keymap(0, "n", "<LocalLeader>pv", "<Cmd>lua require('r.send').cmd('devtools::build_vignettes()')<CR>", {})
  --             vim.api.nvim_buf_set_keymap(0, "n", "<LocalLeader>pT", "<Cmd>lua require('r.send').cmd('devtools::check()')<CR>", {})
  --             vim.api.nvim_buf_set_keymap(0, "n", "<LocalLeader>pt", "<Cmd>lua require('r.send').cmd('devtools::test()')<CR>", {})
  --             vim.api.nvim_buf_set_keymap(0, "n", "<LocalLeader>pl", "<Cmd>lua require('r.send').cmd('devtools::load_all()')<CR>", {})
  --
  --             --Renv
  --             vim.api.nvim_buf_set_keymap(0, "n", "<localleader>ri", "<Cmd>lua require('r.send').cmd('renv::init(bare=TRUE)')<CR>", {})
  --             vim.api.nvim_buf_set_keymap(0, "n", "<localleader>re", "<Cmd>lua require('r.send').cmd('renv::install(c(\"devtools\", \"languageserver\"))')<CR>", {})
  --             vim.api.nvim_buf_set_keymap(0, "n", "<localleader>ru", "<Cmd>lua require('r.send').cmd('renv::update(prompt=F)')<CR>", {})
  --             vim.api.nvim_buf_set_keymap(0, "n", "<localleader>rs", "<Cmd>lua require('r.send').cmd('renv::snapshot(prompt=F)')<CR>", {})
  --             vim.api.nvim_buf_set_keymap(0, "n", "<localleader>rr", "<Cmd>lua require('r.send').cmd('renv::restore(prompt=F)')<CR>", {})
  --           end
  --         end
  --       }, R_cmd = "R",
  --     }
  --     require("r").setup(opts)
  --     vim.g.rout_follow_colorscheme = true
  --   end,
  --   lazy = false,
  -- },
}

