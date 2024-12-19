return {
  {
    "R-nvim/R.nvim",
    -- Only required if you also set defaults.lazy = true
    lazy = false,
    -- R.nvim is still young and we may make some breaking changes from time
    -- to time. For now we recommend pinning to the latest minor version
    -- like so:
    version = "~0.1.0",
    opts = {
      objbr_place = "console,above",
      user_maps_only = true,
      open_pdf = "no",
      pdfviewer = "",

        hook = {
          on_filetype = function ()
            -- This function will be called at the FileType event
            -- of files supported by R.nvim. This is an
            -- opportunity to create mappings local to buffers.
            --
              -- R management
              vim.keymap.set("n", "<LocalLeader>xx", "<Plug>RStart")
              vim.keymap.set("n", "<LocalLeader>xq", "<Plug>RClose")
              vim.keymap.set("n", "<LocalLeader>xk", "<Cmd>RKill<CR>")
              vim.keymap.set("n", "<LocalLeader>xi", "<Cmd>RStop<CR>")
              -- RObjectBrowser
              vim.keymap.set("n", "<LocalLeader>xo", "<Plug>ROBToggle")
              -- Send Cmds
              vim.keymap.set("n", "<LocalLeader><LocalLeader>", "<Plug>RSendLine")
              vim.keymap.set("v", "<LocalLeader><LocalLeader>", "<Plug>RSendSelection")
              -- Inspect Cmds
              vim.keymap.set("n", "<LocalLeader>ii", "<Plug>RObjectPr")
              vim.keymap.set("n", "<LocalLeader>is", "<Plug>RSummary")
              vim.keymap.set("n", "<LocalLeader>it", "<Plug>RObjectStr")
              vim.keymap.set("n", "<LocalLeader>in", "<Plug>RObjectNames")
              vim.keymap.set("n", "<LocalLeader>ih", "<Plug>RHelp")
              vim.keymap.set("n", "<LocalLeader>il", "<Plug>RListSpace")

              -- Targets
              vim.keymap.set("n", "<LocalLeader>mm", "<Cmd>lua require('r.send').cmd([[targets::tar_make()]])<CR>")
              vim.keymap.set("n", "<LocalLeader>mc", "<Cmd>lua require('r.send').cmd([[targets::tar_destroy()]])<CR>")

              -- Devtools
              vim.keymap.set("n", "<LocalLeader>pd", "<Cmd>lua require('r.send').cmd([[devtools::document()]])<CR>")
              vim.keymap.set("n", "<LocalLeader>pv", "<Cmd>lua require('r.send').cmd([[devtools::build_vignettes()]])<CR>")
              vim.keymap.set("n", "<LocalLeader>pT", "<Cmd>lua require('r.send').cmd([[devtools::check()]])<CR>")
              vim.keymap.set("n", "<LocalLeader>pt", "<Cmd>lua require('r.send').cmd([[devtools::test()]])<CR>")
              vim.keymap.set("n", "<LocalLeader>pl", "<Cmd>lua require('r.send').cmd([[devtools::load_all()]])<CR>")

              -- Renv
              vim.keymap.set("n", "<LocalLeader>ri", "<Cmd>lua require('r.send').cmd([[renv::init(bare = TRUE)]])<CR>")
              vim.keymap.set("n", "<LocalLeader>re", "<Cmd>lua require('r.send').cmd([[renv::install(c('languageserver', 'devtools', 'pak'))]])<CR>")
              vim.keymap.set("n", "<LocalLeader>ru", "<Cmd>lua require('r.send').cmd([[renv::update(prompt=F)]])<CR>")
              vim.keymap.set("n", "<LocalLeader>rr", "<Cmd>lua require('r.send').cmd([[renv::snapshot(prompt=F)]])<CR>")
              vim.keymap.set("n", "<LocalLeader>rs", "<Cmd>lua require('r.send').cmd([[renv::restore(prompt=F)]])<CR>")

          end
        },
    },
    init = function()
      vim.g.rout_follow_colorscheme = true
    end,
  },
}
