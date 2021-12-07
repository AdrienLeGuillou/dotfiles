local indent = 4

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.o.fileencoding = 'utf-8'          -- Encode everything to UTF-8 by default
vim.o.shiftwidth = indent             -- Size of an indent
vim.o.tabstop = indent                -- Number of spaces tabs count for
vim.o.expandtab = true                -- Use spaces instead of tabs
vim.o.autoindent = true               -- Auto indent
vim.o.smartindent = true              -- Auto indent
vim.o.cindent = true                  -- Auto indent
vim.o.swapfile = false                -- No swapfiles ...
vim.o.undofile = true                 -- ... but undofiles
vim.o.formatoptions = 'jcroql'        -- autoformat text, especially comments
vim.o.completeopt = 'menuone,noselect,noinsert'
vim.opt.shortmess:append('c')
vim.o.shada = "!,'1000,<50,s10,h"     -- Shared data
vim.o.mouse = 'n'                     -- Enable mouse in normal mode
vim.o.clipboard = 'unnamedplus'       -- Use the system clipboard
vim.o.inccommand = 'split'            -- Show the result of the command as it's typed
vim.o.hidden = true                   -- Enable background buffers
vim.o.ignorecase = true               -- Ignore case when searching...
vim.o.smartcase = true                -- ... unless there is a capital letter in the query
vim.o.incsearch = true                -- Makes search act like search in modern browsers
vim.o.showmatch = true                -- show matching brackets when text indicator is over them
vim.o.joinspaces = false              -- No double spaces with join
vim.o.scrolloff = 4                   -- Lines of context
vim.o.shiftround = true               -- Round indent
vim.o.sidescrolloff = 8               -- Columns of context
vim.o.smartcase = true                -- Don't ignore case with capitals
vim.o.splitbelow = true               -- Put new windows below current
vim.o.splitright = true               -- Put new windows right of current
vim.o.equalalways = false             -- I don't like my windows changing all the time
vim.o.termguicolors = true            -- True color support
vim.o.updatetime = 100                -- Delay before swap file is saved
vim.o.wildmode = 'longest:full,full'  -- Command-line completion mode
vim.o.title = true                    -- File name as terminal title
vim.o.scrolloff = 10                  -- Make it so there are always ten lines below my cursor
vim.o.textwidth = 80                  -- Size of a line
vim.o.foldlevelstart = 99             -- Start with all folds open
vim.o.cmdheight = 1                   -- Height of the command bar
-- vim.o.shell = '/bin/bash'             -- Shell used by :term
vim.o.foldmethod = 'marker'           -- Use markers to fold
vim.o.colorcolumn = '81'              -- Margin is on column AFTER the max width (no text is allowed ON the margin
vim.o.cursorline = true               -- Highlight cursor line
-- vim.o.list = true                     -- Show some invisible characters
vim.o.relativenumber = true           -- Relative line numbers
vim.o.number = true                   -- Print line number
vim.o.signcolumn = 'yes'              -- Show sign column
vim.o.wrap = false                    -- Disable line wrap


--------------------- AUTOCMD ------------------------------
-- Cleanup file on save
vim.cmd [[ au BufWritePre * lua require('util').cleanup() ]]
-- Comment strings
-- vim.cmd [[ au FileType cpp setlocal commentstring=//\ %s ]]
-- vim.cmd [[ au FileType abc setlocal commentstring=%\ %s ]]
