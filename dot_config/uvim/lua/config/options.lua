-- Must be ran before Lazy
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Lexicographical order
-- Set only if changes
local indent = 4
vim.opt.autoindent = true                     -- Auto indent
vim.opt.clipboard = 'unnamedplus'             -- Use the system clipboard
vim.opt.colorcolumn = '81'                    -- Margin AFTER the max width
vim.opt.completeopt = { 'menuone', 'noselect', 'fuzzy' }
vim.opt.cursorline = true                     -- Highlight cursor line
vim.opt.cursorlineopt = { 'number' }          -- Highlight cursor line
vim.opt.equalalways = false                   -- I don't like my windows changing all the time
vim.opt.expandtab = true                      -- Use spaces instead of tabs
vim.opt.fileencoding = 'utf-8'                -- Encode everything to UTF-8 by default
vim.opt.foldlevelstart = 99                   -- Start with all folds open
vim.opt.formatoptions = 'jcroqln'             -- autoformat text, especially comments
vim.opt.hidden = true                         -- Enable background buffers
vim.opt.ignorecase = true                     -- Ignore case when searching...
vim.opt.inccommand = 'split'                  -- Show the result of the command as it's typed
vim.opt.incsearch = true                      -- Makes search act like search in modern browsers
vim.opt.laststatus = 0                        -- Only one status line
vim.opt.mouse = 'n'                           -- Mouse only in normal mode
vim.opt.number = true                         -- Print line number
vim.opt.relativenumber = true                 -- Relative line numbers
vim.opt.shada = { "!", "'1000", "<50", "s10", "h" }
vim.opt.shiftround = true                     -- Round indent
vim.opt.shiftwidth = indent                   -- Size of an indent
vim.opt.shortmess:append('c')                 -- no msg on no match
vim.opt.sidescrolloff = 0                     -- Columns of context
vim.opt.signcolumn = 'number'                 -- show sign instead of number
vim.opt.smartcase = true                      -- ... unless there is a capital letter in the query
vim.opt.smartindent = true                    -- Auto indent
vim.opt.splitbelow = true                     -- Put new windows below current
vim.opt.splitright = true                     -- Put new windows right of current
vim.opt.swapfile = false                      -- No swapfiles ...
vim.opt.tabstop = indent                      -- Number of spaces tabs count for
vim.opt.termguicolors = true                  -- True color support
vim.opt.textwidth = 80                        -- Size of a line
vim.opt.title = true                          -- File name as terminal title
vim.opt.undofile = true                       -- ... but undofiles
vim.opt.wildmode = { 'longest:full', 'full' } -- Command-line completion mode TODO: do I want that?
vim.opt.wrap = false                          -- Disable line wrap
