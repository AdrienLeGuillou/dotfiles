local M = {}

function M.map(mode, key, result, opts)
  opts = vim.tbl_extend('keep', opts or {}, {
    noremap = true,
    silent = true,
    expr = false
  })

  vim.api.nvim_set_keymap(mode, key, result, opts)
end

function M.cleanup()
  local cur_pos  = vim.api.nvim_win_get_cursor(0)

  vim.api.nvim_command([[ %s/\s\+$//e ]])
  vim.api.nvim_command([[ %s/\r//ge ]])

  vim.api.nvim_win_set_cursor(0, cur_pos)
end

return M
