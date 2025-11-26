# New Neovim Config


## First

- UndoTree: use same or from mini?
- polish

## ToDo Later

- make a list of pack hooks in `_G.Config.`
    - make the autocmd that hooks the pluging first
    - make make it go through the hooks list
    - because the list is global, it can be filled later on. It just needs to
    contain the relevant entries when the packages is updated (so before the
    `vim.pack.add` for this package)
```lua
pkg_hook = {
    pkg_name = "LuaSnip",
    hook = function(ev)
        -- first line is handled by the autocmd
        -- if name == 'LuaSnip' and (kind == 'install' or kind == 'update') then
        -- so just this one
        vim.system({ 'make', 'install_jsregexp' }, { cwd = ev.data.path })
    end,
    }

  vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
      local name, kind = ev.data.spec.name, ev.data.kind
      -- here add a loop throuhg the hooks
      if name == 'LuaSnip' and (kind == 'install' or kind == 'update') then
      vim.system({ 'make', 'install_jsregexp' }, { cwd = ev.data.path })
    end,
    group = _G.Config.augrp
  })
```