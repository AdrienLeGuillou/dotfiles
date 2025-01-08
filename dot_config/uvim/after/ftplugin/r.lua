local set = vim.opt_local
set.shiftwidth = 2
set.tabstop = 2
set.softtabstop = 2
set.expandtab = true

-- better indent with R.nvim
vim.cmd([[ let r_indent_align_args = 0 ]])

vim.keymap.set({ "i" }, "<A-->", "<-", { buffer = true, desc = "Insert `<-`" })
-- :s/\$\([a-zA-Z._0-9]*\)/[["\1"]]/ge<CR>
-- need split string to avoid ]] as end string
vim.keymap.set({"n", "v"}, "<LocalLeader>ss", [[ :s/\$\([a-zA-Z._0-9]*\)/[["\1"] ]] .. [[ ]/ge<CR> ]])

vim.cmd([[ TSBufEnable highlight ]])
vim.cmd([[ TSBufEnable indent ]])
vim.cmd([[ TSBufEnable incremental_selection ]])
