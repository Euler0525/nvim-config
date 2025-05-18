local packer = require("packer")

packer.startup({
  function(use)
-------------------------------- 插件列表 -------------------------------------
  -- use 'name/repo'
  -- Mason
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  -- Packer
  use('wbthomason/packer.nvim')
  -- colorscheme
  use("folke/tokyonight.nvim")

  -- dashboard
  use("nvimdev/dashboard-nvim")
  -- project
  use("ahmedkhalf/project.nvim")
  -- file-tree(侧边栏文件树浏览器)
  use({ "nvim-tree/nvim-tree.lua", requires = "nvim-tree/nvim-web-devicons" })
  -- bufferline(顶部标签页)
  use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
  -- lualine(底部状态栏)
  use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
  use("arkav/lualine-lsp-progress")
  -- telescope
  use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
  -- treesitter
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  -- dashboard
  use({
    "startup-nvim/startup.nvim",
    requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim"},
    config = function()
      require"startup".setup()
    end
  })
  -- use({
  --   "glepnir/dashboard-nvim",
  --   requires = {"nvim-tree/nvim-web-devicons"}
  -- })
  -- -- LSP
  -- use("williamboman/nvim-lsp-installer")
  -- use({ "neovim/nvim-lspconfig" })

  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = { "markdown" },
  })


  end,

  -------------------------------- 插件列表 -------------------------------------
  config = {
    max_jobs = 16,  -- 并发数限制
    display = {
      -- 浮动窗口打开安装列表
      open_fn = function()
      return require("packer.util").float({ border = "single" })
      end,
    },
  }
})

-- 保存 plugins.lua 后自动安装插件
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
