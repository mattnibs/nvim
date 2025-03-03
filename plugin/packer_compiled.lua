-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

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
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/nibs/.cache/nvim/packer_hererocks/2.1.1725453128/share/lua/5.1/?.lua;/Users/nibs/.cache/nvim/packer_hererocks/2.1.1725453128/share/lua/5.1/?/init.lua;/Users/nibs/.cache/nvim/packer_hererocks/2.1.1725453128/lib/luarocks/rocks-5.1/?.lua;/Users/nibs/.cache/nvim/packer_hererocks/2.1.1725453128/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/nibs/.cache/nvim/packer_hererocks/2.1.1725453128/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
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
  ["Comment.nvim"] = {
    config = { "\27LJ\2\nî\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\ropleader\1\0\1\tline\14<Leader>c\ftoggler\1\0\2\ftoggler\0\ropleader\0\1\0\1\tline\14<Leader>c\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/nibs/.local/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/nibs/.local/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14next_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2Ä'\0\3\0002\0\aÄ6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0ÄL\0\2\0L\0\2\0\1¿\r<Ignore>\0\rschedule\a]c\tdiff\awo\bvim#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14prev_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2Ä'\0\3\0002\0\aÄ6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0ÄL\0\2\0L\0\2\0\1¿\r<Ignore>\0\rschedule\a[c\tdiff\awo\bvimπ\1\1\1\t\0\14\0\0226\1\0\0009\1\1\0019\1\2\0016\2\3\0009\2\4\0029\2\5\2\18\3\2\0'\5\6\0'\6\a\0003\a\b\0005\b\t\0=\0\n\bB\3\5\1\18\3\2\0'\5\6\0'\6\v\0003\a\f\0005\b\r\0=\0\n\bB\3\5\0012\0\0ÄK\0\1\0\1\0\2\texpr\2\vbuffer\0\0\a[c\vbuffer\1\0\2\texpr\2\vbuffer\0\0\a]c\6n\bset\vkeymap\bvim\rgitsigns\vloaded\fpackage[\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\14on_attach\1\0\1\14on_attach\0\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/nibs/.local/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nÙ\3\0\0\6\0\23\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0034\4\3\0005\5\v\0>\5\1\4=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\19\0025\3\21\0005\4\20\0=\4\f\3=\3\22\2B\0\2\1K\0\1\0\ftabline\1\0\1\14lualine_c\0\1\2\0\0\fbuffers\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\1\0\rfilename\tpath\3\1\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\6\14lualine_x\0\14lualine_y\0\14lualine_c\0\14lualine_z\0\14lualine_b\0\14lualine_a\0\1\2\0\0\tmode\foptions\1\0\3\foptions\0\ftabline\0\rsections\0\1\0\2\17globalstatus\2\ntheme\tauto\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/nibs/.local/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/nibs/.local/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\5\0\a6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0B\0\2\1K\0\1\0\1\0\1\nasync\2\vformat\bbuf\blsp\bvimﬂ\a\1\2\n\1+\0é\0016\2\0\0009\2\1\0029\2\2\0025\3\3\0=\1\4\3\18\4\2\0'\6\5\0'\a\6\0006\b\0\0009\b\a\b9\b\b\b9\b\t\b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a\n\0-\b\0\0009\b\v\b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a\f\0-\b\0\0009\b\r\b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a\14\0-\b\0\0009\b\15\b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a\16\0006\b\0\0009\b\17\b9\b\18\b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a\19\0006\b\0\0009\b\a\b9\b\b\b9\b\20\b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a\21\0006\b\0\0009\b\17\b9\b\22\b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a\23\0006\b\0\0009\b\17\b9\b\24\b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a\25\0006\b\0\0009\b\a\b9\b\b\b9\b\26\b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a\27\0003\b\28\0\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a\29\0-\b\0\0009\b\30\b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a\31\0-\b\0\0009\b \b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a!\0006\b\0\0009\b\a\b9\b\b\b9\b\"\b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a#\0006\b\0\0009\b\a\b9\b\b\b9\b$\b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a%\0006\b\0\0009\b\a\b9\b\b\b9\b&\b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a'\0006\b\0\0009\b\a\b9\b\b\b9\b(\b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a)\0006\b\0\0009\b\17\b9\b*\b\18\t\3\0B\4\5\1K\0\1\0\0¿\15setloclist\15<Leader>cq\28remove_workspace_folder\16<Leader>cwr\25add_workspace_folder\16<Leader>cwa\vrename\14<Leader>r\19signature_help\15<Leader>cs\25lsp_document_symbols\15<Leader>co\16diagnostics\15<Leader>cd\0\14<Leader>f\16code_action\15<Leader>ca\14goto_next\a]d\14goto_prev\a[d\15references\agr\15open_float\15diagnostic\agl\24lsp_implementations\agi\20lsp_definitions\agd\25lsp_type_definitions\agD\nhover\bbuf\blsp\6K\6n\vbuffer\1\0\2\vbuffer\0\vsilent\2\bset\vkeymap\bvimÜ\1\0\1\5\2\6\0\f6\1\0\0'\3\1\0B\1\2\0028\1\0\0019\1\2\0015\3\3\0-\4\0\0=\4\4\3-\4\1\0=\4\5\3B\1\2\1K\0\1\0\1¿\2¿\17capabilities\14on_attach\1\0\2\14on_attach\0\17capabilities\0\nsetup\14lspconfig\frequire\v\0\1\1\0\0\0\1K\0\1\0ˇ\3\0\0\18\0\21\0A)\0Ë\0036\1\0\0009\1\1\0019\1\2\0019\1\3\1B\1\1\0025\2\6\0005\3\5\0=\3\a\2=\2\4\0016\2\0\0009\2\1\0029\2\b\2)\4\0\0'\5\t\0\18\6\1\0\18\a\0\0B\2\5\0026\3\n\0\f\5\2\0X\5\1Ä4\5\0\0B\3\2\4H\6\31Ä6\b\n\0009\n\v\a\14\0\n\0X\v\1Ä4\n\0\0B\b\2\4H\v\22Ä9\r\f\f\15\0\r\0X\14\19Ä6\r\0\0009\r\1\r9\r\r\r\18\15\6\0B\r\2\2\14\0\r\0X\14\1Ä4\r\0\0009\r\14\r\14\0\r\0X\14\1Ä'\r\15\0006\14\0\0009\14\1\0149\14\2\0149\14\16\0149\16\f\f\18\17\r\0B\14\3\1F\v\3\3R\vË\127F\6\3\3R\6ﬂ\1276\3\0\0009\3\1\0039\3\17\0039\3\18\0035\5\19\0=\0\20\5B\3\2\1K\0\1\0\15timeout_ms\1\0\2\15timeout_ms\0\nasync\1\vformat\bbuf\25apply_workspace_edit\vutf-16\20offset_encoding\21get_client_by_id\tedit\vresult\npairs\28textDocument/codeAction\21buf_request_sync\tonly\1\0\1\tonly\0\1\2\0\0\27source.organizeImports\fcontext\22make_range_params\tutil\blsp\bvimî\1\1\2\b\1\t\0\0153\2\0\0006\3\1\0009\3\2\0039\3\3\3'\5\4\0005\6\5\0=\1\6\0063\a\a\0=\a\b\6B\3\3\1-\3\0\0\18\5\0\0\18\6\1\0002\0\0ÄD\3\3\0\0\0\rcallback\0\vbuffer\1\0\2\vbuffer\0\rcallback\0\16BufWritePre\24nvim_create_autocmd\bapi\bvim\0ç\1\1\0\4\2\b\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\5\0003\3\4\0=\3\6\2-\3\1\0=\3\a\2B\0\2\1K\0\1\0\1¿\2¿\17capabilities\14on_attach\1\0\2\14on_attach\0\17capabilities\0\0\nsetup\ngopls\14lspconfig\frequireÑ\3\1\0\a\0\23\0)6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\6\0006\4\3\0009\4\4\0049\4\5\4=\4\a\3=\3\t\2B\0\2\0016\0\0\0'\2\n\0B\0\2\0029\0\2\0005\2\f\0005\3\v\0=\3\r\2B\0\2\0016\0\0\0'\2\14\0B\0\2\0023\1\15\0006\2\0\0'\4\16\0B\2\2\0029\2\17\2B\2\1\0026\3\0\0'\5\n\0B\3\2\0029\3\18\0035\5\21\0003\6\19\0>\6\1\0053\6\20\0=\6\22\5B\3\2\0012\0\0ÄK\0\1\0\ngopls\1\0\1\ngopls\0\0\0\19setup_handlers\25default_capabilities\17cmp_nvim_lsp\0\22telescope.builtin\21ensure_installed\1\0\1\21ensure_installed\0\1\2\0\0\ngopls\20mason-lspconfig\aui\1\0\1\aui\0\vborder\1\0\1\vborder\0\17border_style\6g\bvim\nsetup\nmason\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/nibs/.local/nvim/site/pack/packer/opt/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["material.nvim"] = {
    config = { "\27LJ\2\nU\0\1\4\0\5\0\b6\1\0\0009\1\1\1=\0\2\0016\1\0\0009\1\3\1'\3\4\0B\1\2\1K\0\1\0\25colorscheme material\bcmd\19material_style\6g\bvimÜ\1\1\0\5\0\6\0\b6\0\0\0009\0\1\0009\0\2\0005\2\3\0005\3\4\0003\4\5\0B\0\4\1K\0\1\0\0\1\0\1\vprompt\26Select Material style\1\6\0\0\foceanic\15deep ocean\14palenight\flighter\vdarker\vselect\aui\bvimù\2\1\0\6\0\18\0\0256\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\b\0005\3\a\0=\3\t\2B\0\2\0016\0\0\0009\0\n\0009\0\v\0'\2\f\0'\3\r\0003\4\14\0006\5\15\0B\0\5\0016\0\0\0009\0\16\0'\2\17\0B\0\2\1K\0\1\0\25colorscheme material\bcmd\topts\0\a]t\6n\bset\vkeymap\fplugins\1\0\1\fplugins\0\1\6\0\0\rnvim-cmp\14nvim-tree\rgitsigns\22nvim-web-devicons\14telescope\nsetup\rmaterial\frequire\vdarker\19material_style\6g\bvim\0" },
    loaded = true,
    path = "/Users/nibs/.local/nvim/site/pack/packer/start/material.nvim",
    url = "https://github.com/marko-cerovac/material.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nj\0\0\5\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0004\3\3\0005\4\3\0>\4\1\3=\3\5\2B\0\2\1K\0\1\0\fsources\1\0\1\fsources\0\1\0\1\tname\rnvim_lsp\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/nibs/.local/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/nibs/.local/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/nibs/.local/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nı\1\0\0\4\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0016\0\b\0009\0\t\0'\2\n\0B\0\2\1K\0\1\0,set foldexpr=nvim_treesitter#foldexpr()\bcmd\bvim\14highlight\1\0\1\venable\2\21ensure_installed\1\0\2\14highlight\0\21ensure_installed\0\1\6\0\0\ago\blua\tbash\6c\bcpp\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/nibs/.local/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/nibs/.local/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/nibs/.local/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/nibs/.local/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/Users/nibs/.local/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/nibs/.local/nvim/site/pack/packer/start/telescope-fzy-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzy-native.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/Users/nibs/.local/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\né\3\0\0\b\0\22\0)6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\3B\1\2\0019\1\b\0'\3\t\0B\1\2\0019\1\b\0'\3\5\0B\1\2\0019\1\b\0'\3\n\0B\1\2\0016\1\v\0009\1\f\0019\1\r\0016\2\0\0'\4\14\0B\2\2\2\18\3\1\0'\5\15\0'\6\16\0009\a\17\2B\3\4\1\18\3\1\0'\5\15\0'\6\18\0009\a\19\2B\3\4\1\18\3\1\0'\5\15\0'\6\20\0009\a\21\2B\3\4\1K\0\1\0\fbuffers\14<leader>b\14live_grep\14<leader>a\15find_files\14<leader>o\6n\22telescope.builtin\bset\vkeymap\bvim\14ui-select\15fzy_native\19load_extension\15extensions\1\0\1\15extensions\0\17file_browser\1\0\1\17file_browser\0\1\0\1\17hijack_netrw\2\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/nibs/.local/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-bufkill"] = {
    loaded = true,
    path = "/Users/nibs/.local/nvim/site/pack/packer/start/vim-bufkill",
    url = "https://github.com/qpkorr/vim-bufkill"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14next_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2Ä'\0\3\0002\0\aÄ6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0ÄL\0\2\0L\0\2\0\1¿\r<Ignore>\0\rschedule\a]c\tdiff\awo\bvim#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14prev_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2Ä'\0\3\0002\0\aÄ6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0ÄL\0\2\0L\0\2\0\1¿\r<Ignore>\0\rschedule\a[c\tdiff\awo\bvimπ\1\1\1\t\0\14\0\0226\1\0\0009\1\1\0019\1\2\0016\2\3\0009\2\4\0029\2\5\2\18\3\2\0'\5\6\0'\6\a\0003\a\b\0005\b\t\0=\0\n\bB\3\5\1\18\3\2\0'\5\6\0'\6\v\0003\a\f\0005\b\r\0=\0\n\bB\3\5\0012\0\0ÄK\0\1\0\1\0\2\texpr\2\vbuffer\0\0\a[c\vbuffer\1\0\2\texpr\2\vbuffer\0\0\a]c\6n\bset\vkeymap\bvim\rgitsigns\vloaded\fpackage[\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\14on_attach\1\0\1\14on_attach\0\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\né\3\0\0\b\0\22\0)6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\3B\1\2\0019\1\b\0'\3\t\0B\1\2\0019\1\b\0'\3\5\0B\1\2\0019\1\b\0'\3\n\0B\1\2\0016\1\v\0009\1\f\0019\1\r\0016\2\0\0'\4\14\0B\2\2\2\18\3\1\0'\5\15\0'\6\16\0009\a\17\2B\3\4\1\18\3\1\0'\5\15\0'\6\18\0009\a\19\2B\3\4\1\18\3\1\0'\5\15\0'\6\20\0009\a\21\2B\3\4\1K\0\1\0\fbuffers\14<leader>b\14live_grep\14<leader>a\15find_files\14<leader>o\6n\22telescope.builtin\bset\vkeymap\bvim\14ui-select\15fzy_native\19load_extension\15extensions\1\0\1\15extensions\0\17file_browser\1\0\1\17file_browser\0\1\0\1\17hijack_netrw\2\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nj\0\0\5\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0004\3\3\0005\4\3\0>\4\1\3=\3\5\2B\0\2\1K\0\1\0\fsources\1\0\1\fsources\0\1\0\1\tname\rnvim_lsp\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nÙ\3\0\0\6\0\23\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0034\4\3\0005\5\v\0>\5\1\4=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\19\0025\3\21\0005\4\20\0=\4\f\3=\3\22\2B\0\2\1K\0\1\0\ftabline\1\0\1\14lualine_c\0\1\2\0\0\fbuffers\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\1\0\rfilename\tpath\3\1\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\6\14lualine_x\0\14lualine_y\0\14lualine_c\0\14lualine_z\0\14lualine_b\0\14lualine_a\0\1\2\0\0\tmode\foptions\1\0\3\foptions\0\ftabline\0\rsections\0\1\0\2\17globalstatus\2\ntheme\tauto\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: material.nvim
time([[Config for material.nvim]], true)
try_loadstring("\27LJ\2\nU\0\1\4\0\5\0\b6\1\0\0009\1\1\1=\0\2\0016\1\0\0009\1\3\1'\3\4\0B\1\2\1K\0\1\0\25colorscheme material\bcmd\19material_style\6g\bvimÜ\1\1\0\5\0\6\0\b6\0\0\0009\0\1\0009\0\2\0005\2\3\0005\3\4\0003\4\5\0B\0\4\1K\0\1\0\0\1\0\1\vprompt\26Select Material style\1\6\0\0\foceanic\15deep ocean\14palenight\flighter\vdarker\vselect\aui\bvimù\2\1\0\6\0\18\0\0256\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\b\0005\3\a\0=\3\t\2B\0\2\0016\0\0\0009\0\n\0009\0\v\0'\2\f\0'\3\r\0003\4\14\0006\5\15\0B\0\5\0016\0\0\0009\0\16\0'\2\17\0B\0\2\1K\0\1\0\25colorscheme material\bcmd\topts\0\a]t\6n\bset\vkeymap\fplugins\1\0\1\fplugins\0\1\6\0\0\rnvim-cmp\14nvim-tree\rgitsigns\22nvim-web-devicons\14telescope\nsetup\rmaterial\frequire\vdarker\19material_style\6g\bvim\0", "config", "material.nvim")
time([[Config for material.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\nî\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\ropleader\1\0\1\tline\14<Leader>c\ftoggler\1\0\2\ftoggler\0\ropleader\0\1\0\1\tline\14<Leader>c\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nı\1\0\0\4\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0016\0\b\0009\0\t\0'\2\n\0B\0\2\1K\0\1\0,set foldexpr=nvim_treesitter#foldexpr()\bcmd\bvim\14highlight\1\0\1\venable\2\21ensure_installed\1\0\2\14highlight\0\21ensure_installed\0\1\6\0\0\ago\blua\tbash\6c\bcpp\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd cmp-nvim-lsp ]]
vim.cmd [[ packadd mason.nvim ]]

-- Config for: mason.nvim
try_loadstring("\27LJ\2\n@\0\0\3\0\5\0\a6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0B\0\2\1K\0\1\0\1\0\1\nasync\2\vformat\bbuf\blsp\bvimﬂ\a\1\2\n\1+\0é\0016\2\0\0009\2\1\0029\2\2\0025\3\3\0=\1\4\3\18\4\2\0'\6\5\0'\a\6\0006\b\0\0009\b\a\b9\b\b\b9\b\t\b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a\n\0-\b\0\0009\b\v\b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a\f\0-\b\0\0009\b\r\b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a\14\0-\b\0\0009\b\15\b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a\16\0006\b\0\0009\b\17\b9\b\18\b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a\19\0006\b\0\0009\b\a\b9\b\b\b9\b\20\b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a\21\0006\b\0\0009\b\17\b9\b\22\b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a\23\0006\b\0\0009\b\17\b9\b\24\b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a\25\0006\b\0\0009\b\a\b9\b\b\b9\b\26\b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a\27\0003\b\28\0\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a\29\0-\b\0\0009\b\30\b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a\31\0-\b\0\0009\b \b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a!\0006\b\0\0009\b\a\b9\b\b\b9\b\"\b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a#\0006\b\0\0009\b\a\b9\b\b\b9\b$\b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a%\0006\b\0\0009\b\a\b9\b\b\b9\b&\b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a'\0006\b\0\0009\b\a\b9\b\b\b9\b(\b\18\t\3\0B\4\5\1\18\4\2\0'\6\5\0'\a)\0006\b\0\0009\b\17\b9\b*\b\18\t\3\0B\4\5\1K\0\1\0\0¿\15setloclist\15<Leader>cq\28remove_workspace_folder\16<Leader>cwr\25add_workspace_folder\16<Leader>cwa\vrename\14<Leader>r\19signature_help\15<Leader>cs\25lsp_document_symbols\15<Leader>co\16diagnostics\15<Leader>cd\0\14<Leader>f\16code_action\15<Leader>ca\14goto_next\a]d\14goto_prev\a[d\15references\agr\15open_float\15diagnostic\agl\24lsp_implementations\agi\20lsp_definitions\agd\25lsp_type_definitions\agD\nhover\bbuf\blsp\6K\6n\vbuffer\1\0\2\vbuffer\0\vsilent\2\bset\vkeymap\bvimÜ\1\0\1\5\2\6\0\f6\1\0\0'\3\1\0B\1\2\0028\1\0\0019\1\2\0015\3\3\0-\4\0\0=\4\4\3-\4\1\0=\4\5\3B\1\2\1K\0\1\0\1¿\2¿\17capabilities\14on_attach\1\0\2\14on_attach\0\17capabilities\0\nsetup\14lspconfig\frequire\v\0\1\1\0\0\0\1K\0\1\0ˇ\3\0\0\18\0\21\0A)\0Ë\0036\1\0\0009\1\1\0019\1\2\0019\1\3\1B\1\1\0025\2\6\0005\3\5\0=\3\a\2=\2\4\0016\2\0\0009\2\1\0029\2\b\2)\4\0\0'\5\t\0\18\6\1\0\18\a\0\0B\2\5\0026\3\n\0\f\5\2\0X\5\1Ä4\5\0\0B\3\2\4H\6\31Ä6\b\n\0009\n\v\a\14\0\n\0X\v\1Ä4\n\0\0B\b\2\4H\v\22Ä9\r\f\f\15\0\r\0X\14\19Ä6\r\0\0009\r\1\r9\r\r\r\18\15\6\0B\r\2\2\14\0\r\0X\14\1Ä4\r\0\0009\r\14\r\14\0\r\0X\14\1Ä'\r\15\0006\14\0\0009\14\1\0149\14\2\0149\14\16\0149\16\f\f\18\17\r\0B\14\3\1F\v\3\3R\vË\127F\6\3\3R\6ﬂ\1276\3\0\0009\3\1\0039\3\17\0039\3\18\0035\5\19\0=\0\20\5B\3\2\1K\0\1\0\15timeout_ms\1\0\2\15timeout_ms\0\nasync\1\vformat\bbuf\25apply_workspace_edit\vutf-16\20offset_encoding\21get_client_by_id\tedit\vresult\npairs\28textDocument/codeAction\21buf_request_sync\tonly\1\0\1\tonly\0\1\2\0\0\27source.organizeImports\fcontext\22make_range_params\tutil\blsp\bvimî\1\1\2\b\1\t\0\0153\2\0\0006\3\1\0009\3\2\0039\3\3\3'\5\4\0005\6\5\0=\1\6\0063\a\a\0=\a\b\6B\3\3\1-\3\0\0\18\5\0\0\18\6\1\0002\0\0ÄD\3\3\0\0\0\rcallback\0\vbuffer\1\0\2\vbuffer\0\rcallback\0\16BufWritePre\24nvim_create_autocmd\bapi\bvim\0ç\1\1\0\4\2\b\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\5\0003\3\4\0=\3\6\2-\3\1\0=\3\a\2B\0\2\1K\0\1\0\1¿\2¿\17capabilities\14on_attach\1\0\2\14on_attach\0\17capabilities\0\0\nsetup\ngopls\14lspconfig\frequireÑ\3\1\0\a\0\23\0)6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\6\0006\4\3\0009\4\4\0049\4\5\4=\4\a\3=\3\t\2B\0\2\0016\0\0\0'\2\n\0B\0\2\0029\0\2\0005\2\f\0005\3\v\0=\3\r\2B\0\2\0016\0\0\0'\2\14\0B\0\2\0023\1\15\0006\2\0\0'\4\16\0B\2\2\0029\2\17\2B\2\1\0026\3\0\0'\5\n\0B\3\2\0029\3\18\0035\5\21\0003\6\19\0>\6\1\0053\6\20\0=\6\22\5B\3\2\0012\0\0ÄK\0\1\0\ngopls\1\0\1\ngopls\0\0\0\19setup_handlers\25default_capabilities\17cmp_nvim_lsp\0\22telescope.builtin\21ensure_installed\1\0\1\21ensure_installed\0\1\2\0\0\ngopls\20mason-lspconfig\aui\1\0\1\aui\0\vborder\1\0\1\vborder\0\17border_style\6g\bvim\nsetup\nmason\frequire\0", "config", "mason.nvim")

time([[Sequenced loading]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
