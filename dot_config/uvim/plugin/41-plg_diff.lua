local later = Config.later

-- Iron REPL
later(function()
  local hooks = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'differ.nvim' and (kind == 'install' or kind == 'update') then
        vim.system({ "make", "go-build" }, { cwd = ev.data.path }):wait()
    end
  end

  vim.api.nvim_create_autocmd('PackChanged', {
    callback = hooks,
    group = _G.Config.augrp
  })

  vim.pack.add({ "https://github.com/undont/differ.nvim" })
  require("differ").setup()

end)
