local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("没有找到 telescope...")
  return
end

telescope.setup({
  defaults = {
    -- 初始模式，默认为 insert --> normal
    initial_mode = "insert",
    -- 窗口内快捷键
    mappings = require("keybindings").telescopeList,
  },
  pickers = {
    -- 内置 pickers 配置
    find_files = {
      -- 支持的样式有: dropdown, cursor, ivy
      theme = "dropdown", 
    }
  },
  extensions = {
     -- 扩展插件配置
  },
})

