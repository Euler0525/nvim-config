local status, lualine = pcall(require, "lualine")
if not status then
    vim.notify("没有找到 lualine...")
  return
end

lualine.setup({
  options = {
    theme = "tokyonight",
    -- 组件分隔符
    component_separators = { left = "|", right = "|" },
    -- 分段分隔符
    section_separators = { left = " ", right = "" },
  },
  extensions = { "nvim-tree", "toggleterm" },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
      "filename",
      {
        "lsp_progress",
        spinner_symbols = { " ", " ", " ", " ", " ", " " },
      },
    },
    lualine_x = {
      "filesize",
      {
        "fileformat",
        -- symbols = {
        --   unix = '', -- e712
        --   dos = '', -- e70f
        --   mac = '', -- e711
        -- },
        symbols = {
          unix = "LF",
          dos = "CRLF",
          mac = "CR",
        },
      },
      "encoding",
      "filetype",
    },
    lualine_y = {'progress'},
    lualine_z = {'location'},
  },
})

