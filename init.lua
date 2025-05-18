require('basic')

-- 快捷键设置
require('keybindings')

-- 插件设置
require('plugins')

-- 主题设置
require('colorscheme')

-- 插件配置
require("plugin-config.nvim-tree")
-- require("plugin-config.nvim-treesitter")
require("plugin-config.bufferline")
-- require("plugin-config.dashboard")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.project")
require("mason").setup()
require("mason-lspconfig").setup()
-- require("lsp.setup")

vim.api.nvim_set_keymap('n', '<F10>', ':w<CR>:!python %<CR>', { noremap = true, silent = true })
