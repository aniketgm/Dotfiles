--[[
              __________________
          /\  \   __           /  /\    /\           Author      : Aniket Meshram [AniGMe]
         /  \  \  \         __/  /  \  /  \          Description : LunarVim customized configuration. This configuration
        /    \  \       _____   /    \/    \                       is divided into following sections:
       /  /\  \  \     /    /  /            \                      - LunarVim options
      /        \  \        /  /      \/      \                     - Vim options
     /          \  \      /  /                \                    - Additional plugins and their configurations
    /            \  \    /  /                  \                   - Additional keymappings
   /              \  \  /  /                    \
  /__            __\  \/  /__                  __\   Github Repo : https://github.com/aniketgm/Dotfiles

--]]

--[[
lvim is the global options object. Linters should be filled in as strings with 
either a global executable or a path to an executable
--]]

-- #---------------------------
-- # LunarVim specific options
-- #---------------------------
lvim.log.level = "warn"
lvim.format_on_save = true
-- lvim.colorscheme = "onedarker"
lvim.leader = "space"
-- lvim.use_icons = false

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.project.show_hidden = true
lvim.builtin.terminal.active = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- #----------------------
-- # Vim specific options
-- #----------------------
vim.opt.cmdheight = 1
vim.opt.colorcolumn = '80'
vim.opt.relativenumber = true
-- vim.opt[fillchars] = {
--   diff         = '⣿',                          -- Show the specified symbol for Diff
--   vert         = '¦'                           -- Show the specified symbol for vertical split
-- },
-- vim.opt.listchars = {
--   space = '·', -- Show space with the symbol set
--   tab   = '│ ' -- Show tabs with the symbol set
-- }

-- #--------------------
-- # Additional plugins
-- #--------------------
lvim.plugins = {
  -- {
  --   "folke/trouble.nvim",
  --   cmd = "TroubleToggle",
  -- },

  -- ## Colorschemes
  -- ## ------------
  -- { "folke/tokyonight.nvim" },
  { "sainnhe/sonokai" },
  -- { "LunarVim/onedarker.nvim" },
  -- { "EdenEast/nightfox.nvim" },
  -- { "jacoborus/tender.vim" },

  -- ## Others
  -- ## ------
  {
    'rmagatti/session-lens',
    requires = {
      'rmagatti/auto-session',
      'nvim-telescope/telescope.nvim'
    }
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
    config = function()
      require("diffview").setup({})
    end,
  },
  { "kdheepak/lazygit.nvim" },
  { "nvim-telescope/telescope-file-browser.nvim" },
}

-- #--------------------
-- # Additional config
-- #--------------------

-- # Colorscheme config
-- # ------------------
-- vim.g.sonokai_style = 'default'
vim.g.sonokai_style = 'andromeda'
vim.g.sonokai_better_performance = 1
-- vim.g.sonokai_style = 'espresso'
-- vim.g.sonokai_enable_italic = 1
lvim.colorscheme = "sonokai"
-- vim.g.tokyonight_style = 'night'
-- vim.g.tokyonight_italic_functions = 1
-- lvim.colorscheme = "tokyonight"
-- lvim.colorscheme = "tender"

-- # Auto-Session
-- # ------------
require('auto-session').setup({
  auto_restore_enabled = false
})

-- # Telescope
-- # ---------
lvim.builtin.telescope.defaults.layout_strategy = "bottom_pane"
lvim.builtin.telescope.defaults.sorting_strategy = "ascending"
lvim.builtin.telescope.defaults.path_display = { truncate = true }
lvim.builtin.telescope.defaults.winblend = 15
lvim.builtin.telescope.pickers.current_buffer_fuzzy_find = { previewer = false }
lvim.builtin.telescope.pickers.live_grep = {
  previewer = false,
  shorten_path = true,
  only_sort_text = true,
}
lvim.builtin.telescope.pickers.buffers = {
  sort_lastused = true,
  mappings = {
    i = { ["<C-d>"] = "delete_buffer" }
  }
}
lvim.builtin.telescope.pickers.find_files.layout_config = { preview_width = 65 }

require("telescope").load_extension "session-lens"
require("telescope").load_extension "file_browser"

-- #--------------------
-- # Additional keymaps
-- #--------------------

-- List all keymaps: <leader>Lk
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<F3>"] = "<cmd>NvimTreeFindFileToggle<cr>"
lvim.keys.normal_mode["<F2>"] = "<cmd>DiffviewToggleFiles<cr>"
lvim.keys.normal_mode["<C-q>"] = false

-- To unmap a default keymapping: vim.keymap.del("n", "<C-Up>")
-- Override a default keymapping: lvim.keys.normal_mode["<C-q>"] = ":q<cr>" OR vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- # New which-key bindings
lvim.builtin.which_key.mappings["P"] = {
  name = "+Project",
  l = { "<cmd>Telescope projects<cr>", "Select a project" },
  s = { "<cmd>Telescope live_grep<cr>", "Search text in current project" },
}
lvim.builtin.which_key.mappings["S"] = {
  name = "+Session",
  w = { "<cmd>SaveSession<cr>", "Save current session" },
  r = { "<cmd>RestoreSession<cr>", "Restore last session" },
  s = { "<cmd>SearchSession<cr>", "Show sessions" },
  k = { "<cmd>DeleteSession<cr>", "Kill/Delete current session" },
}
lvim.builtin.which_key.mappings["d"] = {
  name = "+Diffview",
  o = { "<cmd>DiffviewOpen -uno<cr>", "Open Diffview" },
  c = { "<cmd>DiffviewClose<cr>", "Close Diffview" },
}
lvim.builtin.which_key.mappings["D"] = {
  name = "+Dotfiles",
  r = { "<cmd>edit ~/.bashrc<cr>", "Edit bashrc" },
  a = { "<cmd>edit ~/.bash_aliases<cr>", "Edit bash aliases" },
  f = { "<cmd>edit ~/.bash_functions<cr>", "Edit bash functions" },
  t = { "<cmd>edit ~/.tmux.conf<cr>", "Edit tmux config" },
  s = { "<cmd>edit ~/.config/starship.toml<cr>", "Edit starship prompt config" },
  -- c = { "<cmd>edit ~/.config/alacritty/alacritty.yml", "Edit alacritty config" },
}

-- # Additions to existing which-key bindings
lvim.builtin.which_key.mappings["sF"] = {
  "<cmd>Telescope find_files cwd=~<cr>", "Find File in HOME dir"
}
lvim.builtin.which_key.mappings["sB"] = {
  "<cmd>Telescope file_browser depth=2<cr>", "Browse Files"
}
lvim.builtin.which_key.mappings["bs"] = {
  "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search in this buffer"
}
lvim.builtin.which_key.mappings["bS"] = {
  "<cmd>Telescope live_grep grep_open_files=true<cr>", "Search in all buffers"
}
lvim.builtin.which_key.mappings["gg"] = {
  "<cmd>LazyGit<cr>", "LazyGit"
}

-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
-- }

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
