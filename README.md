# Neovim

> [Topics#neovim-colorscheme](https://github.com/topics/neovim-colorscheme)

```shell
.
├── init.lua
├── lua
│   ├── basic.lua
│   ├── colorscheme.lua
│   ├── keybindings.lua
│   ├── lsp
│   │   ├── config
│   │   │   └── lua.lua
│   │   └── setup.lua
│   ├── plugin-config
│   │   ├── bufferline.lua
│   │   ├── dashboard.lua
│   │   ├── lualine.lua
│   │   ├── nvim-tree.lua
│   │   ├── project.lua
│   │   └── telescope.lua
│   └── plugins.lua
├── plugin
│   └── packer_compiled.lua
└── README.md

6 directories, 15 files
```

**插件管理**`plugins.lua`

> 插件管理器：[packer.nvim](https://github.com/wbthomason/packer.nvim), [lazy.nvim](https://github.com/folke/lazy.nvim)
>
> ```shell
> git clone --depth 1 https://github.com/wbthomason/packer.nvim \
> ~/.local/share/nvim/site/pack/packer/start/packer.nvim
> ```

安装/更新插件`:PackerSync`（已配置为保存`plugins.lua`文件后自动更新）

```
:PackerSync   包含了 :PackerUpdate 和 :PackerCompile
:PackerUpdate 包含了 :PackerClean  和 :PackerInstall
```


Packer默认将插件默认安装在`~/.local/share/nvim/site/pack/packer/start`目录下

---

**语言服务协议（LSP, Language Server Protocol）**

LSP将编程工具解耦为了Language Server与Language Client两部分，定义了编辑器与语言服务器之间的交互协议。

- Client用于显示样式；
- Server提供语言支持，包括补全、跳转、引用、悬停等功能；

通过`:h lsp`查看LSP文档

1. 配置客户端，安装`nvim-lspconfig`

2. 安装语言服务器`nvim-lsp-installer`

3. 安装LSP Servers，`:LspInstallInfo`命令查看可安装的server列表

> `i`安装，`X`卸载，`u`更新，`U`更新所有，`c`检查版本，`C`检查所有的版本，`?`查看帮助



## 参考资料

[Neovim 配置实战：从0到1打造自己的IDE](https://juejin.cn/book/7051157342770954277/section)
