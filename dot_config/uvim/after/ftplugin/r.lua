-- better indent with R.nvim
vim.cmd([[ let r_indent_align_args = 0 ]])

vim.keymap.set({ "i" }, "<A-->", "<-", { buffer = true, desc = "Insert `<-`" })
-- :s/\$\([a-zA-Z._0-9]*\)/[["\1"]]/ge<CR>
-- need split string to avoid ]] as end string
vim.keymap.set({"n", "v"}, "<LocalLeader>ss", [[ :s/\$\([a-zA-Z._0-9]*\)/[["\1"] ]] .. [[ ]/ge<CR> ]])

-- vim.cmd([[ TSBufEnable highlight ]])
-- vim.cmd([[ TSBufEnable indent ]])
-- vim.cmd([[ TSBufEnable incremental_selection ]])

---- Recognize RStudio-style section headers: "# Title ----", "# Title ====", etc.
-- Tune the trailing-run length/characters to taste.
local SECTION_PATTERN = "^%s*#+.*[%-=#][%-=#][%-=#][%-=#]+%s*$"

local function is_section_header(bufnr, lnum)
  local line = vim.api.nvim_buf_get_lines(bufnr, lnum - 1, lnum, false)[1]
  if not line or not line:match(SECTION_PATTERN) then
    return false
  end
  local ok, parser = pcall(vim.treesitter.get_parser, bufnr, "r")
  if not ok or not parser then
    return true
  end
  local root = parser:parse()[1]:root()
  local col = (line:find("#") or 1) - 1
  local node = root:named_descendant_for_range(lnum - 1, col, lnum - 1, col + 1)
  return node ~= nil and node:type() == "comment"
end

_G.RFoldExpr = function()
  local lnum = vim.v.lnum
  local bufnr = vim.api.nvim_get_current_buf()

  if is_section_header(bufnr, lnum) then
    return ">1"
  end

  local in_section = false
  for l = lnum - 1, 1, -1 do
    if is_section_header(bufnr, l) then
      in_section = true
      break
    end
  end

  local ts_level = vim.treesitter.foldexpr()
  if not in_section then
    return ts_level
  end

  local prefix, num = ts_level:match("^([<>]?)(%d+)$")
  if not num then
    return ts_level
  end
  return prefix .. tostring(tonumber(num) + 1)
end

vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr = "v:lua.RFoldExpr()"
