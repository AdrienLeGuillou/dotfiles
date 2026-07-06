_G.Config = {}

vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })
vim.cmd('colorscheme minisummer')

-- vim.pack.add({ 'https://github.com/ellisonleao/gruvbox.nvim' })
-- require('gruvbox')
-- vim.cmd.colorscheme("gruvbox")

local misc = require('mini.misc')
Config.now = function(f) misc.safely('now', f) end
Config.later = function(f) misc.safely('later', f) end
Config.now_if_args = vim.fn.argc(-1) > 0 and Config.now or Config.later
Config.on_event = function(ev, f) misc.safely('event:' .. ev, f) end
Config.on_filetype = function(ft, f) misc.safely('filetype:' .. ft, f) end
Config.leader_group_clues = {}

-- Define custom autocommand group and helper to create an autocommand.
-- Autocommands are Neovim's way to define actions that are executed on events
-- (like creating a buffer, setting an option, etc.).
--
-- See also:
-- - `:h autocommand`
-- - `:h nvim_create_augroup()`
-- - `:h nvim_create_autocmd()`
local gr = vim.api.nvim_create_augroup('custom-config', {})
Config.new_autocmd = function(event, pattern, callback, desc)
  local opts = { group = gr, pattern = pattern, callback = callback, desc = desc }
  vim.api.nvim_create_autocmd(event, opts)
end

-- Define custom `vim.pack.add()` hook helper. See `:h vim.pack-events`.
-- Example usage: see 'plugin/40_plugins.lua'.
Config.on_packchanged = function(plugin_name, kinds, callback, desc)
  local f = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if not (name == plugin_name and vim.tbl_contains(kinds, kind)) then return end
    if not ev.data.active then vim.cmd.packadd(plugin_name) end
    callback()
  end
  Config.new_autocmd('PackChanged', '*', f, desc)
end

function Config.cleanup()
  local cur_pos  = vim.api.nvim_win_get_cursor(0)
  vim.api.nvim_command([[ %s/\s\+$//e ]])
  vim.api.nvim_command([[ %s/\r//ge ]])
  vim.api.nvim_win_set_cursor(0, cur_pos)
end

function Config.fill_dash()
  local cur_pos  = vim.api.nvim_win_get_cursor(0)
  local line = vim.api.nvim_buf_get_lines(0, cur_pos[1] - 1, cur_pos[1], false)
  line[1] = line[1] .. " " .. string.rep("-", 80 - 1 - string.len(line[1]))
  vim.api.nvim_buf_set_lines(0, cur_pos[1] - 1, cur_pos[1], false, line)
  vim.api.nvim_win_set_cursor(0, cur_pos)
end

require('vim._core.ui2').enable()
