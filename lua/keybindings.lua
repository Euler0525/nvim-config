-- 使用map配置全局快捷键
local map = vim.api.nvim_set_keymap
-- 重新映射
local opts = {noremap = true, silent = true }

-------------------------------- 常规 -----------------------------------------
-- 退出
map("n", "qq", ":q!<CR>", opts)
map("n", "Q", ":wq<CR>", opts)
map("n", "W", ":w<CR>", opts)
map("i", "jk", "<Esc>", opts)
map("v", "v", "<C-v>", opts)
map("n", "<Space>", ":", { silent = false})


-- Insert: 行首行尾
map("i", "<C-h>", "<ESC>I", opts)
map("i", "<C-l>", "<ESC>A", opts)

-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opts)
map("v", "K", ":move '<-2<CR>gv-gv", opts)

-- 上下滚动浏览
map("n", "<C-j>", "4j", opts)
map("n", "<C-k>", "4k", opts)

-- ctrl u / ctrl + d  只移动8行，默认移动半屏
map("n", "<C-u>", "8k", opts)
map("n", "<C-d>", "8j", opts)

-------------------------------- 常规 -----------------------------------------


-------------------------------- 窗口 -----------------------------------------
-- 关闭 s 默认功能
map("n", "s", "", opts)
-- 窗口分屏
map("n", "sv", ":vsp<CR>", opts) -- 垂直
map("n", "sh", ":sp<CR>", opts)  -- 水平
map("n", "sc", "<C-w>c", opts)   -- 关闭当前
map("n", "so", "<C-w>o", opts)   -- 关闭其它

-- Alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opts)
map("n", "<A-j>", "<C-w>j", opts)
map("n", "<A-k>", "<C-w>k", opts)
map("n", "<A-l>", "<C-w>l", opts)

-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)
map("n", "s,", ":vertical resize -20<CR>", opts)
map("n", "s.", ":vertical resize +20<CR>", opts)
-- 上下比例
map("n", "sj", ":resize +10<CR>", opts)
map("n", "sk", ":resize -10<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Up>", ":resize -2<CR>", opts)
-- 等比例
map("n", "s=", "<C-w>=", opts)

-------------------------------- 窗口 -----------------------------------------


-------------------------------- bufferline -----------------------------------
-- bufferline
-- 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", { silent = false })
map("n", "<C-l>", ":BufferLineCycleNext<CR>", { silent = false })
-- 关闭
--"moll/vim-bbye"
map("n", "<C-w>", ":Bdelete!<CR>", opts)


-------------------------------- bufferline -----------------------------------


-------------------------------- telescope ------------------------------------
-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opts)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opts)


-------------------------------- telescope ------------------------------------

-------------------------------- 文件树 ---------------------------------------
-- 插件快捷键
local pluginKeys = {}

-- alt + m 键打开关闭tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opts)
-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  -- 分屏打开文件
  { key = "v", action = "vsplit" },
  { key = "h", action = "split" },
  -- 显示隐藏文件
  { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
  { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)

  -- 文件操作
  { key = "<F5>", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "s", action = "system_open" },
}

-- telescope 插入模式快捷键
pluginKeys.telescopeList = {
  i = {
    -- 上下移动
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    ["<Up>"] = "move_selection_previous",
    -- 历史记录
    ["<C-n>"] = "cycle_history_next",
    ["<C-p>"] = "cycle_history_prev",
    -- 关闭窗口
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}

-------------------------------- 文件树 ---------------------------------------


---------------------------------- LSP ----------------------------------------

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
  -- rename
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  -- code action
  mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  -- go xx
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  -- diagnostic
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  -- 没用到
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
end

---------------------------------- LSP ----------------------------------------


----------------------------- MarkdownPreview ---------------------------------
map("n", "<C-s>", "<Plug>MarkdownPreview", opts)
map("i", "<C-s>", "<Plug>MarkdownPreview", opts)
map("n", "<A-s>", "<Plug>MarkdownPreviewStop", opts)
map("i", "<A-s>", "<Plug>MarkdownPreviewStop", opts)
----------------------------- MarkdownPreview ---------------------------------

return pluginKeys
