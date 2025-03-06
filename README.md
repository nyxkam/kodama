# Mi configuración de Neovim

Bienvenido a mi repositorio de configuración de Neovim! Aqui encontrarás mi
configuracipón presonsalizada para Neovim.

## Tabla de Contenidos

--[Requisitos](#requisitos)
--[Instalación](#instalaci%C3%B3n)
--[Estructura del Repositorio](#estructura-del-repositorio)
--[Plugins](#plugins)
--[Atajos](#atajos)
--[Licencia](#licencia)

## Requisitos

Antes de comenzar, asegúrate de tener instalados los siguientes requisitos:

- [Neovim](https://github.com/neovim/neovim) (v0.8.0 o superior)
- [Git](https://git-scm.com/downloads)
- [Node.js](https://nodejs.org/es/download/) (opcional, para poder usar el plugin de `Mason`)

## Instalación

1. Clona este repositorio en tu directorio de configuración de Neovim:

   ```bash
   git clone https://github.com/alexlafroscia/nvim ~/.config/nvim
   ```

1. Ingresa al directorio del repositorio y ejecuta neovim:

   ```bash
   cd ~/.config/nvim && nvim
   ```

## Estructura del Repositorio

El repositorio está dividido en varios directorios, cada uno de ellos representa
un plugin o una carpeta de configuración.

```bash
nvim/
├── init.lua
├── lazy-lock.json
├── LICENSE.md
├── lua/
│   ├── core/
│   │   ├── autocommands.lua
│   │   ├── colors.lua
│   │   ├── functions.lua
│   │   ├── lazy.lua
│   │   ├── mappings.lua
│   │   └── options.lua
│   ├── hls/
│   └── plugins/
│       ├── comment/
│       │   ├── comments.lua
│       │   └── todo_comments.lua
│       ├── dap/
│       │   ├── adapters/
│       │   └── init.lua
│       ├── git/
│       │   ├── diffview.lua
│       │   └── gitsigns.lua
│       ├── ia/
│       │   ├── codeium.lua
│       │   └── supermaven.lua
│       ├── learn/
│       │   └── leetcode.lua
│       ├── lsp/
│       │   ├── autopair.lua
│       │   ├── cmp.lua
│       │   ├── conform.lua
│       │   ├── lspconfig.lua
│       │   ├── lspsaga.lua
│       │   ├── luasnip.lua
│       │   └── mason.lua
│       ├── nvzone/
│       │   ├── minty.lua
│       │   ├── showkeys.lua
│       │   ├── timerly.lua
│       │   └── typr.lua
│       ├── ts/
│       │   ├── indent.lua
│       │   ├── rainbow.lua
│       │   └── treesitter.lua
│       ├── ui/
│       │   ├── bufferline.lua
│       │   ├── lualine.lua
│       │   ├── markdownview.lua
│       │   └── prism.lua
│       └── utils/
│           ├── alpha.lua
│           ├── devicons.lua
│           ├── dressing.lua
│           ├── noice.lua
│           ├── notify.lua
│           ├── nvimtree.lua
│           ├── project.lua
│           ├── telescope.lua
│           ├── terminal.lua
│           └── whichkey.lua
└── README.md
```

- `init.lua`: archivo principal de configuración de Neovim.
- `lua/`: directorio donde se encuentran los archivos de configuración.
- `lua/core/`: directorio donde se encuentran los archivos de configuración genrales.
- `lua/plugins/`: directorio donde se encuentran los archivos de configuración
  de los diferentes plugins.

## Plugins

Aqui hay una lsita con algunos de los plugins que utilizo en mi configuración.

| Plugin | Description | Lazy |
| ------------- |-------------| :-----:|
| [folke/lazy](https://github.com/folke/lazy.nvim) | the package manager, better than packer.nvim for newbies | `false` |
| [chadcat7/prism](https://github.com/chadcat7/prism) | my own plugin written for making fast colorschemes | `true` |
| [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | syntax highlighting, most popular one for neovim | `true` |
| [NvChad/nvim-colorizer.lua](https://github.com/NvChad/nvim-colorizer.lua) | highlights colors and is really frickin fast | `true` |
| [kyazdani42/nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) | a very neat, simple and clean file tree | `true` |
| [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | lua fork of vim devicons | `true`
| [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | probably the most popular menu. can be used for a lot of stuff | `true` |
| [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | terminal integration in neovim | `true` |
| [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Super fast git decorations implemented purely in Lua. | `true` |
| [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | super cool for keeping track of code | `true` |
| [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) | installing LSPs made super easy | `true` |
| [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) | very simple and easy to use snippet engine | `true` |
| [echasnovski/mini.starter](https://github.com/echasnovski/mini.starter) | a very minimal and good looking dashboard | `true` |
| [terrortylor/nvim-comment](https://github.com/terrortylor/nvim-comment) | quik and easy commenting | `true` |
| [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | beautiful highlights for TODO comments | `true` |

## Temas

Para los temas usé el plugin [prism](https://github.com/namishh/prism) :
