vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Lexicographical order
-- Set only if changes
local indent = 4
vim.opt.background = 'light'
vim.opt.clipboard = 'unnamedplus'
vim.opt.colorcolumn = '+1'
vim.opt.completeopt = { 'menuone', 'noselect', 'fuzzy' }
vim.opt.cursorline = true
vim.opt.equalalways = false       -- Don't resize window on split / close
vim.opt.expandtab = true
vim.opt.fileencoding = 'utf-8'
vim.opt.foldlevelstart = 99       -- Start with all folds open
vim.opt.formatoptions = 'cqjroln' -- autoformat text, especially comments (default: tcqj)
vim.opt.ignorecase = true         -- Ignore case when searching...
vim.opt.inccommand = 'split'      -- Show the result of the command as it's typed
vim.opt.number = false            -- Print line number
vim.opt.numberwidth = 2           -- 2 width line number
vim.opt.relativenumber = true     -- Relative line numbers
vim.opt.shada = { "!", "'1000", "<50", "s10", "h" }
vim.opt.shiftround = true
vim.opt.shiftwidth = indent
vim.opt.shortmess:append('c')
vim.opt.sidescrolloff = 0         -- Columns of context
vim.opt.signcolumn = 'yes:1'      -- show sign in a single column (use "number" to overlay the numbers)
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.switchbuf   = 'usetab'       -- Use already opened buffers when switching
vim.opt.swapfile = false
vim.opt.tabstop = indent
vim.opt.termguicolors = true
vim.opt.textwidth = 80
vim.opt.timeoutlen = 500
vim.opt.title = true              -- File name as terminal title
vim.opt.undofile = true
vim.opt.wildmode = { 'longest:full', 'full' }
vim.opt.wrap = false

vim.cmd('colorscheme minisummer')