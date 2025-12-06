# Fahim's Neovim Configuration

A modern, feature-rich Neovim configuration inspired by NvChad, with a strong focus on Go development. This setup uses [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager and provides a beautiful, efficient development environment.

![Neovim](https://img.shields.io/badge/Neovim-0.9+-blueviolet.svg?style=flat-square&logo=Neovim)

## ✨ Features

- **Modern UI**: Catppuccin Mocha colorscheme, bufferline, lualine statusline, and a custom dashboard
- **Smart Completion**: nvim-cmp with LSP, snippets, buffer, and path sources
- **Powerful Search**: Telescope for fuzzy finding files, text, buffers, and more
- **File Explorer**: Neo-tree for a sleek file tree sidebar
- **Git Integration**: Gitsigns, LazyGit, and git blame
- **LSP Support**: Pre-configured for Go, Lua, Python, TypeScript, Rust, JSON, YAML
- **Go Development**: Extensive Go tooling including debugging, testing, coverage, and code generation
- **Which-Key**: Interactive keybinding hints to help you remember all shortcuts

## 📦 Prerequisites

Before installing, make sure you have:

- **Neovim** 0.9+ (with Lua support)
- **Git** for plugin management
- **A Nerd Font** for icons (e.g., JetBrainsMono Nerd Font)
- **ripgrep** for Telescope live grep (`brew install ripgrep` or `apt install ripgrep`)
- **Node.js** for some LSP servers
- **Go** for Go development features

### Optional (for full Go support)

- `gopls` - Go language server (installed via Mason)
- `dlv` - Delve debugger for Go
- `gofumpt` - Stricter gofmt
- `gomodifytags`, `gotests`, `impl`, `iferr` - Go code generation tools

## 🚀 Installation

1. **Backup your existing configuration**:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   mv ~/.local/share/nvim ~/.local/share/nvim.backup
   ```

2. **Clone this repository**:
   ```bash
   git clone https://github.com/fahimimam/nvim.git ~/.config/nvim
   ```

3. **Start Neovim**:
   ```bash
   nvim
   ```
   On the first run, lazy.nvim will automatically install all plugins.

4. **Install LSP servers**:
   Open Neovim and run `:Mason` to install language servers.

## 🎹 Leader Key

The **leader key** is set to `<Space>`. Most keybindings start with `<Space>` followed by a key sequence.

Press `<Space>` and wait to see all available keybindings via **which-key**.

---

## ⌨️ Keybindings Reference

### 📁 File Explorer (Neo-tree)

| Keybinding | Description |
|------------|-------------|
| `<leader>e` | Toggle file explorer |

### 🔍 Find / Telescope

| Keybinding | Description |
|------------|-------------|
| `<leader>ff` | Find files |
| `<leader>fw` | Find words (live grep) |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Find help tags |
| `<leader>fo` | Find old/recent files |
| `<leader>fc` | Find word under cursor |

### 🌿 Git

| Keybinding | Description |
|------------|-------------|
| `<leader>gg` | Open LazyGit |
| `<leader>gb` | Git blame current line |
| `<leader>gp` | Preview git hunk |

### 💻 Terminal (ToggleTerm)

| Keybinding | Description |
|------------|-------------|
| `<C-\>` | Toggle floating terminal |
| `<leader>th` | Horizontal terminal |
| `<leader>tv` | Vertical terminal (80 cols) |
| `<leader>tf` | Floating terminal |

### 📝 Buffers & Windows

| Keybinding | Description |
|------------|-------------|
| `<leader>x` | Close current buffer |
| `<leader>q` | Quit current window |
| `<leader>Q` | Quit all (force) |
| `<leader>fm` | Format current buffer |

### 🔧 LSP (Language Server Protocol)

| Keybinding | Description |
|------------|-------------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `gI` | Go to implementation |
| `gD` | Go to declaration |
| `K` | Hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |

### 🐛 Diagnostics (Trouble)

| Keybinding | Description |
|------------|-------------|
| `<leader>td` | Toggle diagnostics panel |
| `<leader>tr` | Toggle LSP references |
| `<leader>ts` | Toggle symbols |
| `<leader>tq` | Toggle quickfix list |

---

## 🐹 Go Development

This configuration has extensive support for Go development.

### 🧪 Go Testing (Neotest)

| Keybinding | Description |
|------------|-------------|
| `<leader>gt` | Run nearest test |
| `<leader>gT` | Run all tests in file |
| `<leader>gP` | Run all tests in package |
| `<leader>gs` | Toggle test summary |
| `<leader>go` | Open test output window |
| `<leader>gO` | Open test output (focus) |
| `<leader>gx` | Stop running tests |

### 📊 Go Coverage

| Keybinding | Description |
|------------|-------------|
| `<leader>gC` | Load coverage file |
| `<leader>gc` | Toggle coverage signs |
| `<leader>gR` | Show coverage summary |

### 🏷️ Go Struct Tags (Gopher)

| Keybinding | Description |
|------------|-------------|
| `<leader>ga` | Add json,yaml,db tags |
| `<leader>grm` | Remove json,yaml,db tags |
| `<leader>gtg` | Add json tag only |

### 🔨 Go Code Generation

| Keybinding | Description |
|------------|-------------|
| `<leader>gtt` | Generate tests for functions |
| `<leader>gtf` | Generate tests file |
| `<leader>gim` | Implement interface |
| `<leader>gie` | Insert `if err != nil` block |

### 🔎 Go LSP Enhancements

| Keybinding | Description |
|------------|-------------|
| `<leader>gh` | Toggle inlay hints |
| `<leader>gl` | Run code lenses (e.g., run test) |
| `<leader>gi` | Organize imports |

### 🐞 Go Debugging (DAP)

| Keybinding | Description |
|------------|-------------|
| `<leader>db` | Toggle breakpoint |
| `<leader>dB` | Conditional breakpoint |
| `<leader>dc` | Continue execution |
| `<leader>di` | Step into |
| `<leader>do` | Step over |
| `<leader>dO` | Step out |
| `<leader>dr` | Restart debugger |
| `<leader>dq` | Terminate debugging |
| `<leader>du` | Toggle DAP UI |
| `<leader>dR` | Run last debug session |
| `<leader>dt` | Debug nearest Go test |
| `<leader>dT` | Debug last Go test |

### 📝 Go Snippets

In insert mode, type these prefixes and press `<Tab>` to expand:

| Snippet | Description |
|---------|-------------|
| `main` | Main function boilerplate |
| `test` | Test function template |
| `bench` | Benchmark function template |
| `errwrap` | `if err != nil` block |
| `iface` | Interface definition |

---

## 🎨 Completion (nvim-cmp)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<Tab>` | Insert | Select next item / expand snippet |
| `<S-Tab>` | Insert | Select previous item |
| `<CR>` | Insert | Confirm selection |
| `<C-Space>` | Insert | Trigger completion |
| `<C-e>` | Insert | Abort completion |
| `<C-b>` | Insert | Scroll docs up |
| `<C-f>` | Insert | Scroll docs down |

---

## 📚 Comments (Comment.nvim)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `gcc` | Normal | Toggle line comment |
| `gbc` | Normal | Toggle block comment |
| `gc` | Visual | Toggle line comment (selection) |
| `gb` | Visual | Toggle block comment (selection) |

---

## 🔄 Surround (nvim-surround)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `ys{motion}{char}` | Normal | Add surrounding |
| `ds{char}` | Normal | Delete surrounding |
| `cs{old}{new}` | Normal | Change surrounding |
| `S{char}` | Visual | Add surrounding to selection |

Examples:
- `ysiw"` - Surround word with double quotes
- `ds(` - Delete surrounding parentheses
- `cs'"` - Change single quotes to double quotes

---

## 🎯 Dashboard Actions

When you open Neovim without a file, you'll see the dashboard with these shortcuts:

| Key | Action |
|-----|--------|
| `f` | Find file |
| `e` | New file |
| `r` | Recent files |
| `w` | Find word |
| `c` | Open config |
| `q` | Quit |

---

## ⚙️ Quick Close

These special buffers can be closed with `q`:

- Help pages
- LSP info
- Man pages
- Quickfix lists

---

## 🔧 Auto Commands

This configuration includes helpful auto commands:

1. **Highlight on Yank**: Brief visual feedback when you yank text
2. **Trim Whitespace**: Automatically removes trailing whitespace on save
3. **Last Location**: Returns to the last cursor position when reopening a file
4. **Go Format**: Automatically formats Go files on save
5. **Go Code Lens**: Refreshes code lenses for Go files

---

## 🗂️ Directory Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lazy-lock.json           # Plugin version lock file
└── lua/
    ├── config/
    │   ├── autocmds.lua     # Auto commands
    │   ├── keymaps.lua      # Core keymaps
    │   └── options.lua      # Vim options
    └── plugins/
        ├── colorscheme.lua  # Catppuccin theme
        ├── completion.lua   # nvim-cmp setup
        ├── editor.lua       # Core editing plugins
        ├── go_dap.lua       # Go debugging
        ├── go_snippets.lua  # Go snippets
        ├── go_test.lua      # Go testing
        ├── go_tools.lua     # Go code generation
        ├── lsp.lua          # LSP configuration
        ├── lsp_go_enhancements.lua  # Go LSP extras
        ├── mini-icons.lua   # Mini icons
        ├── nio.lua          # Async IO library
        ├── trouble.lua      # Diagnostics panel
        ├── ui.lua           # UI plugins
        └── whichkey.lua     # Which-key configuration
```

---

## 🔍 Troubleshooting

### Plugins not loading?
Run `:Lazy sync` to sync all plugins.

### LSP not working?
1. Run `:LspInfo` to check LSP status
2. Run `:Mason` to install/update language servers
3. Check `:messages` for errors

### Icons not showing correctly?
Make sure you have a [Nerd Font](https://www.nerdfonts.com/) installed and configured in your terminal.

### Go tools missing?
Open a Go file and run `:GoInstallDeps` to install Go development tools.

### Debugger not working?
Make sure Delve is installed: `go install github.com/go-delve/delve/cmd/dlv@latest`

### Which-key not showing?
Press `<Space>` (leader key) and wait ~300ms for the popup to appear.

### Want to see all keybindings?
Press `<Space>` to see leader-based keybindings, or check this README!

---

## 📝 Core Settings

| Setting | Value | Description |
|---------|-------|-------------|
| Leader | `<Space>` | Main modifier key |
| Tab width | 4 spaces | Indentation size |
| Line numbers | Relative | Shows relative line numbers |
| Clipboard | System | Synced with system clipboard |
| Mouse | Enabled | Full mouse support |
| Undo | Persistent | Undo history saved across sessions |

---

## 🎨 Theme

The colorscheme is **Catppuccin Mocha** - a warm, pastel-inspired dark theme. To change flavors, edit `lua/plugins/colorscheme.lua` and set `flavour` to:
- `latte` (light)
- `frappe` (medium dark)
- `macchiato` (dark)
- `mocha` (darkest)

---

## 📖 Quick Tips

1. **Press `<Space>` and wait** - Which-key will show you all available keybindings
2. **Use `<Tab>` in completion** - Navigate through suggestions and expand snippets
3. **`K` over any symbol** - Get hover documentation
4. **`gd` on any symbol** - Jump to its definition
5. **`<leader>e`** - Quick access to file tree
6. **`<leader>ff`** - Fuzzy find any file
7. **`<leader>fw`** - Search for text across all files
8. **`<C-\>`** - Toggle a floating terminal

---

## 🙏 Credits

- [lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager
- [Catppuccin](https://github.com/catppuccin/nvim) - Colorscheme
- [NvChad](https://github.com/NvChad/NvChad) - Design inspiration

---

Made with ❤️ by [@fahimimam](https://github.com/fahimimam)
