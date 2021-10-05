-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/adrien/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/adrien/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/adrien/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/adrien/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/adrien/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Nvim-R"] = {
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/Nvim-R"
  },
  ["bufdelete.nvim"] = {
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/bufdelete.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  gruvbox = {
    config = { "\27LJ\1\2Î\1\0\0\2\0\v\0\0214\0\0\0007\0\1\0)\1\2\0:\1\2\0004\0\0\0007\0\1\0%\1\4\0:\1\3\0004\0\0\0007\0\5\0%\1\a\0:\1\6\0004\0\0\0007\0\5\0%\1\a\0:\1\b\0004\0\0\0007\0\t\0%\1\n\0>\0\2\1G\0\1\0\24colorscheme gruvbox\bcmd\27gruvbox_contrast_light\vmedium\26gruvbox_contrast_dark\6g\nlight\15background\18termguicolors\6o\bvim\0" },
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\1\2ï\1\0\0\3\0\b\0\v4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\0013\2\6\0:\2\a\1>\0\2\1G\0\1\0\21filetype_exclude\1\5\0\0\thelp\bman\rrbrowser\trdoc\20buftype_exclude\1\2\0\0\rterminal\1\0\4\28show_first_indent_level\2\19use_treesitter\1\tchar\aÂ·#show_trailing_blankline_indent\2\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/lua-dev.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\1\2c\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\foptions\1\0\0\1\0\1\ntheme\18gruvbox_light\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\1\2<\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\1\2ä\2\0\0\6\0\21\0*4\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\15\0003\3\5\0007\4\3\0007\4\4\4'\5üÿ>\4\2\2:\4\6\0037\4\3\0007\4\4\4'\5\4\0>\4\2\2:\4\a\0037\4\3\0007\4\b\4>\4\1\2:\4\t\0037\4\3\0007\4\n\4>\4\1\2:\4\v\0037\4\3\0007\4\f\0043\5\r\0>\4\2\2:\4\14\3:\3\3\0022\3\5\0003\4\16\0;\4\1\0033\4\17\0;\4\2\0033\4\18\0;\4\3\0033\4\19\0;\4\4\3:\3\20\2>\1\2\1G\0\1\0\fsources\1\0\1\tname\rnvim-lua\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\1\0\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\1\0\0\16scroll_docs\fmapping\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\1\2‹\4\0\0\5\0\24\0.4\0\0\0007\0\1\0007\0\2\0007\0\3\0>\0\1\0024\1\4\0%\2\5\0>\1\2\0027\1\6\1\16\2\0\0>\1\2\2\16\0\1\0004\1\0\0007\1\1\0017\1\a\0014\2\0\0007\2\1\0027\2\t\0024\3\0\0007\3\1\0037\3\n\0037\3\v\0033\4\f\0>\2\3\2:\2\b\0014\1\4\0%\2\r\0>\1\2\0027\2\14\0017\2\15\0023\3\16\0:\0\17\3>\2\2\0017\2\18\0017\2\15\0023\3\19\0:\0\17\0033\4\20\0:\4\21\3>\2\2\0017\2\22\0017\2\15\0023\3\23\0:\0\17\3>\2\2\1G\0\1\0\1\0\0\22r_language_server\blua\1\0\1\tpath!/usr/bin/lua-language-server\1\0\0\16sumneko_lua\17capabilities\1\0\0\nsetup\vbashls\14lspconfig\1\0\4\17virtual_text\2\nsigns\2\14underline\1\21update_in_insert\1\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\24update_capabilities\17cmp_nvim_lsp\frequire\29make_client_capabilities\rprotocol\blsp\bvim\0" },
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-luadev"] = {
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/nvim-luadev"
  },
  ["nvim-toggleterm.lua"] = {
    config = { "\27LJ\1\2¥\1\0\0\3\0\5\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0002\2\0\0:\2\4\1>\0\2\1G\0\1\0\20shade_filetypes\1\0\5\20shade_terminals\1\17open_mapping\n<C-\\>\17persist_size\2\14direction\15horizontal\tsize\3\20\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\1\0027\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\1\2”\3\0\0\4\0\19\0\0234\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\0013\2\6\0:\2\a\0013\2\b\0003\3\t\0:\3\n\2:\2\v\1>\0\2\0014\0\f\0007\0\r\0%\1\15\0:\1\14\0004\0\f\0007\0\16\0%\1\18\0:\1\17\0G\0\1\0\31nvim_treesitter#foldexpr()\rfoldexpr\awo\texpr\15foldmethod\6o\bvim\26incremental_selection\fkeymaps\1\0\4\19init_selection\bgnn\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\1\0\1\venable\2\vindent\1\0\2\fdisable\2\venable\1\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  tabular = {
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/tabular"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\1\2ÿ\1\0\0\b\0\17\0\0234\0\0\0%\1\1\0>\0\2\0024\1\0\0%\2\2\0>\1\2\0027\2\3\0%\3\4\0>\2\2\0017\2\5\0003\3\15\0003\4\r\0003\5\v\0003\6\a\0007\a\6\1:\a\b\0067\a\t\1:\a\n\6:\6\f\5:\5\14\4:\4\16\3>\2\2\1G\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\n<c-k>\28move_selection_previous\n<c-j>\1\0\0\24move_selection_next\nsetup\15fzy_native\19load_extension\22telescope.actions\14telescope\frequire\0" },
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/vim-easymotion"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-pandoc"] = {
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/vim-pandoc"
  },
  ["vim-pandoc-syntax"] = {
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/vim-pandoc-syntax"
  },
  ["vim-rmarkdown"] = {
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/vim-rmarkdown"
  },
  ["vim-signify"] = {
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/vim-signify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\1\2+\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\16config.keys\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/adrien/.local/share/nvim/site/pack/packer/opt/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-toggleterm.lua
time([[Config for nvim-toggleterm.lua]], true)
try_loadstring("\27LJ\1\2¥\1\0\0\3\0\5\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0002\2\0\0:\2\4\1>\0\2\1G\0\1\0\20shade_filetypes\1\0\5\20shade_terminals\1\17open_mapping\n<C-\\>\17persist_size\2\14direction\15horizontal\tsize\3\20\nsetup\15toggleterm\frequire\0", "config", "nvim-toggleterm.lua")
time([[Config for nvim-toggleterm.lua]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\2”\3\0\0\4\0\19\0\0234\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\0013\2\6\0:\2\a\0013\2\b\0003\3\t\0:\3\n\2:\2\v\1>\0\2\0014\0\f\0007\0\r\0%\1\15\0:\1\14\0004\0\f\0007\0\16\0%\1\18\0:\1\17\0G\0\1\0\31nvim_treesitter#foldexpr()\rfoldexpr\awo\texpr\15foldmethod\6o\bvim\26incremental_selection\fkeymaps\1\0\4\19init_selection\bgnn\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\1\0\1\venable\2\vindent\1\0\2\fdisable\2\venable\1\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\1\2ä\2\0\0\6\0\21\0*4\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\15\0003\3\5\0007\4\3\0007\4\4\4'\5üÿ>\4\2\2:\4\6\0037\4\3\0007\4\4\4'\5\4\0>\4\2\2:\4\a\0037\4\3\0007\4\b\4>\4\1\2:\4\t\0037\4\3\0007\4\n\4>\4\1\2:\4\v\0037\4\3\0007\4\f\0043\5\r\0>\4\2\2:\4\14\3:\3\3\0022\3\5\0003\4\16\0;\4\1\0033\4\17\0;\4\2\0033\4\18\0;\4\3\0033\4\19\0;\4\4\3:\3\20\2>\1\2\1G\0\1\0\fsources\1\0\1\tname\rnvim-lua\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\1\0\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\1\0\0\16scroll_docs\fmapping\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: gruvbox
time([[Config for gruvbox]], true)
try_loadstring("\27LJ\1\2Î\1\0\0\2\0\v\0\0214\0\0\0007\0\1\0)\1\2\0:\1\2\0004\0\0\0007\0\1\0%\1\4\0:\1\3\0004\0\0\0007\0\5\0%\1\a\0:\1\6\0004\0\0\0007\0\5\0%\1\a\0:\1\b\0004\0\0\0007\0\t\0%\1\n\0>\0\2\1G\0\1\0\24colorscheme gruvbox\bcmd\27gruvbox_contrast_light\vmedium\26gruvbox_contrast_dark\6g\nlight\15background\18termguicolors\6o\bvim\0", "config", "gruvbox")
time([[Config for gruvbox]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\1\2ï\1\0\0\3\0\b\0\v4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\0013\2\6\0:\2\a\1>\0\2\1G\0\1\0\21filetype_exclude\1\5\0\0\thelp\bman\rrbrowser\trdoc\20buftype_exclude\1\2\0\0\rterminal\1\0\4\28show_first_indent_level\2\19use_treesitter\1\tchar\aÂ·#show_trailing_blankline_indent\2\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\1\2c\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\foptions\1\0\0\1\0\1\ntheme\18gruvbox_light\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\1\2ÿ\1\0\0\b\0\17\0\0234\0\0\0%\1\1\0>\0\2\0024\1\0\0%\2\2\0>\1\2\0027\2\3\0%\3\4\0>\2\2\0017\2\5\0003\3\15\0003\4\r\0003\5\v\0003\6\a\0007\a\6\1:\a\b\0067\a\t\1:\a\n\6:\6\f\5:\5\14\4:\4\16\3>\2\2\1G\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\n<c-k>\28move_selection_previous\n<c-j>\1\0\0\24move_selection_next\nsetup\15fzy_native\19load_extension\22telescope.actions\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\0027\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\1\2<\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\1\2‹\4\0\0\5\0\24\0.4\0\0\0007\0\1\0007\0\2\0007\0\3\0>\0\1\0024\1\4\0%\2\5\0>\1\2\0027\1\6\1\16\2\0\0>\1\2\2\16\0\1\0004\1\0\0007\1\1\0017\1\a\0014\2\0\0007\2\1\0027\2\t\0024\3\0\0007\3\1\0037\3\n\0037\3\v\0033\4\f\0>\2\3\2:\2\b\0014\1\4\0%\2\r\0>\1\2\0027\2\14\0017\2\15\0023\3\16\0:\0\17\3>\2\2\0017\2\18\0017\2\15\0023\3\19\0:\0\17\0033\4\20\0:\4\21\3>\2\2\0017\2\22\0017\2\15\0023\3\23\0:\0\17\3>\2\2\1G\0\1\0\1\0\0\22r_language_server\blua\1\0\1\tpath!/usr/bin/lua-language-server\1\0\0\16sumneko_lua\17capabilities\1\0\0\nsetup\vbashls\14lspconfig\1\0\4\17virtual_text\2\nsigns\2\14underline\1\21update_in_insert\1\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\24update_capabilities\17cmp_nvim_lsp\frequire\29make_client_capabilities\rprotocol\blsp\bvim\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'which-key.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
