--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- TODO general
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "gruvbox-material"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false
--  options
vim.opt.backup = false -- creates a backup file
vim.opt.number = true -- set numbered lines设置编号行
vim.opt.foldlevel = 99
vim.opt.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.opt.clipboard = "unnamedplus" -- 许neovim访问系统剪贴板 vim.opt.fileencoding = "utf-8" -- the encoding written to a file基于树的折叠设置为 vim.opt.foldmethod = "manual" -- 于树的折叠设置为
vim.opt.colorcolumn = "99999" --暂时修复缩进行
vim.opt.mouse = "a" --许在neovim中使用鼠标
vim.opt.showmode = true -- 我们不再需要看到——INSERT——这样的东西
vim.opt.smartindent = true -- 再次使缩进更智能
vim.opt.splitbelow = true --强制所有水平分割到当前窗口以下
vim.opt.splitright = true -- 强制所有垂直分割到当前窗口的右侧
vim.opt.timeoutlen = 180 -- 待映射序列完成的时间(单位为毫秒)
vim.opt.relativenumber = true -- 设置相对编号行
vim.opt.signcolumn = "yes" --始终显示符号列，否则每次都会移位文本
vim.opt.wrap = false -- display lines as one long line  
vim.opt.spell = false
vim.opt.spelllang = "en"
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.sidescrolloff = 8
lvim.builtin.treesitter.rainbow.enable = true --启用彩虹括号
-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- TODO: add your own keymapping

--Split window
lvim.keys.normal_mode["wv"] = ":split<Return><C-w>w"
lvim.keys.normal_mode["ww"] = ":vsplit<Return><C-w>w"
-- 保存
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
vim.keymap.set("i","<C-s>","<ESC>:w<cr>")
-- 快速跳转行首与行尾 
lvim.keys.normal_mode["L"] = "$"
lvim.keys.normal_mode["H"] = "^"
-- [PERF]向下9行
lvim.keys.normal_mode["<C-d>"] = "9j"
-- 向上9行
lvim.keys.normal_mode["<C-u>"] = "9k"
-- 强制退出
lvim.keys.normal_mode["Q"] = ":q<cr>"
-- 全选
lvim.keys.normal_mode["<C-a>"] = "gg<S-v>G"
vim.keymap.set("i","jk","<ESC>")
vim.keymap.set("i","<C-v>","<ESC>v")
-- 打开 TODO
lvim.keys.normal_mode["<C-p>"] = ":TodoTelescope<cr>"



lvim.keys.visual_mode["p"] = "P"
lvim.keys.visual_mode["H"] = "^"
lvim.keys.visual_mode["L"] = "$"
lvim.keys.visual_mode["J"] = ":m '>+2<CR>gv=gv"
lvim.keys.visual_mode["K"] = ":m '<-1<CR>gv=gv"
lvim.keys.visual_mode["<"] = "<gv"
lvim.keys.visual_mode[">"] = ">gv"

-- "-------------------------------------------------------------------------------
-- " translation 翻译
-- "-------------------------------------------------------------------------------
-- " Echo translation in the cmdline
vim.keymap.set("n","tt","<Plug>Translate")
vim.keymap.set("v","tt","<Plug>Translatev")
-- " Display translation in a window
-- vim.keymap.set("n","<Leader>w","<Plug>TranslateW")
-- vim.keymap.set("v","<Leader>w","<Plug>TranslateWV")

-- tokyonight.nvim 跳转

vim.keymap.set("n", "wh", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "wl", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "wc", ":BufferKill<CR>")

-- dap
lvim.keys.normal_mode["<F12>"] = ":Telescope dap configurations<cr>"
lvim.builtin.which_key.mappings.d = {
  name = "Debug",
  h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
  x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
  t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
  b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
  c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
  C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
  d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
  g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
  i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
  o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
  u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
  p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
  r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
  s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
  q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
  U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
}


-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

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

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }
-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

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
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d", toggle_server_expand = "o", }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
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
--     -- these cannot contain whitespaces, options such as `--line-width 81` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "101" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake9", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 81` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }


-- TODO:open Plugins

-- Leap跳转插件
require('init-config.nvim-leap')
-- color
vim.cmd('source ~/.config/lvim/colors/gruvbox_material.rc.vim')
-- 翻译
require('init-config.vim-translator')
-- tree
--require('init-config.nvim-tree')


-- TODO: Additional Plugins
lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "lewis6991/impatient.nvim" -- Speed up loading Lua modules   
  },
  {
     "rcarriga/nvim-notify" -- notify
  },
  {
    "sainnhe/gruvbox-material" --主题
  },
  {
    "ggandor/leap.nvim" -- 跳转
  },
  {
    --翻译单词
    "voldikss/vim-translator"
  },
  {
    -- 显示css的颜色代码的颜色
    "ap/vim-css-color"
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    config = function()
      require("telescope").load_extension('dap')
    end
  },
  {
  "nacro90/numb.nvim", -- 快速跳转行 ：20
  event = "BufRead",
  config = function()
  require("numb").setup {
    show_numbers = true, -- Enable 'number' for the window while peeking
    show_cursorline = true, -- Enable 'cursorline' for the window while peeking
  }
  end,
},
{
  "windwp/nvim-ts-autotag",
  config = function()
    require("nvim-ts-autotag").setup()
  end,
},
{
    -- 彩虹括号
  "mrjones2014/nvim-ts-rainbow",
},
{
    -- 直接在 Neovim 中查看 treesitter 信息！
  "nvim-treesitter/playground",
  event = "BufRead",
},
{
    --markdown实时观看
    --" Start the preview
    -- :MarkdownPreview
    -- " Stop the preview"
    -- :MarkdownPreviewStop
  "iamcco/markdown-preview.nvim",
  run = "cd app && npm install",
  ft = "markdown",
  config = function()
    vim.g.mkdp_auto_start = 1
  end,
},
    {
        -- 从你离开的地方继续
        "ethanholz/nvim-lastplace",
        event = "BufRead",
        config = function()
            require("nvim-lastplace").setup({
                lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
                lastplace_ignore_filetype = {
                    "gitcommit", "gitrebase", "svn", "hgcommit",
                },
                lastplace_open_folds = true,
            })
        end,
    },
  {
    -- 在光标下的单词下划线
  "itchyny/vim-cursorword",
    event = {"BufEnter", "BufNewFile"},
    config = function()
      vim.api.nvim_command("augroup user_plugin_cursorword")
      vim.api.nvim_command("autocmd!")
      vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0")
      vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
      vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
      vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
      vim.api.nvim_command("augroup END")
      end
},
{
    --打开网址gx 将光标定位在 URL 上并按下gx会在 Web 浏览器中打开该 URL
  "felipec/vim-sanegx",
  event = "BufRead",
},
{
    --实时编辑 html、css 和 javascript 
  "turbio/bracey.vim",
  cmd = {"Bracey", "BracyStop", "BraceyReload", "BraceyEval"},
  run = "npm install --prefix server",
},
{
    "ravenxrz/DAPInstall.nvim" -- help us install several debuggers
  },
{
    "theHamsta/nvim-dap-virtual-text"
  },
  {
  "folke/lsp-colors.nvim",
  event = "BufRead",
},
{
  "rktjmp/lush.nvim",
},
{
  "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
          RGB = true, -- #RGB hex codes
          RRGGBB = true, -- #RRGGBB hex codes
          RRGGBBAA = true, -- #RRGGBBAA hex codes
          rgb_fn = true, -- CSS rgb() and rgba() functions
          hsl_fn = true, -- CSS hsl() and hsla() functions
          css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
          })
  end,
},
{
  "folke/todo-comments.nvim",
  event = "BufRead",
  config = function()
    require("todo-comments").setup()
  end,
},
}
--  dap config
-- load non-standard json file
-- require('dap.ext.vscode').json_decode = require 'json5'.parse
-- require('dap.ext.vscode').load_launchjs()
require("dap.dap-lldb")
require("dap.dap-cppdbg")


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
--     require("nvim-treesitter.highlight").attach(1, "bash")
--   end,
-- })
