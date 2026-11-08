local later = Config.later

later(function()
  vim.pack.add({
    { src = "https://github.com/mfussenegger/nvim-dap", },
    {
      src = "https://github.com/igorlfs/nvim-dap-view",
      version = vim.version.range("1.*")
    },
  })

  local dap = require("dap")

  -- -- No adapter yet
  -- vim.keymap.set("n", "<localleader>db", dap.toggle_breakpoint, { desc = "Breakpoint" })
  -- vim.keymap.set("n", "<localleader>dc", dap.continue,          { desc = "Continue / start" })
  -- vim.keymap.set("n", "<localleader>dn", dap.step_over,         { desc = "Step over" })
  -- vim.keymap.set("n", "<localleader>di", dap.step_into,         { desc = "Step into" })
  -- vim.keymap.set("n", "<localleader>do", dap.step_out,          { desc = "Step out" })
  -- vim.keymap.set("n", "<localleader>dr", dap.repl.toggle,       { desc = "REPL" })

end)
