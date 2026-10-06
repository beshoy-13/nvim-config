<div align="center">

# ✦ nvim-config

**My personal NvChad-based Neovim setup for competitive programming, C/C++, Java, Python, C#/.NET, and full-stack web dev**

![Neovim](https://img.shields.io/badge/Editor-Neovim-57A143?style=flat-square&logo=neovim)
![NvChad](https://img.shields.io/badge/Framework-NvChad%20v2.5-red?style=flat-square)
![Lua](https://img.shields.io/badge/Config-Lua-2C2D72?style=flat-square&logo=lua)
![C#](https://img.shields.io/badge/Lang-C%23%20%2F%20.NET-512BD4?style=flat-square&logo=csharp)
![C++](https://img.shields.io/badge/Lang-C%2FC%2B%2B-00599C?style=flat-square&logo=cplusplus)
![License](https://img.shields.io/badge/License-Unlicense-informational?style=flat-square)

</div>

---

## 🖥 Overview

| Component | Choice |
|---|---|
| Base | NvChad v2.5+ |
| Plugin manager | lazy.nvim |
| LSP | mason.nvim + nvim-lspconfig |
| Formatter | conform.nvim (Prettier / clang-format / stylua) |
| Debugger | nvim-dap + nvim-dap-ui (C# via netcoredbg) |
| Database | vim-dadbod + vim-dadbod-ui (SQL Server) |
| Snippets | LuaSnip + friendly-snippets |
| Theme | bearded-arc |

---

## 🚀 Installation

> Requires Neovim ≥ 0.10, git, a [Nerd Font](https://www.nerdfonts.com/), and a C compiler (for treesitter).

```bash
git clone https://github.com/beshoy-13/nvim-config.git ~/.config/nvim
nvim
```

`lazy.nvim` bootstraps itself and installs every plugin pinned in `lazy-lock.json` on first launch. Mason then pulls the LSP servers, formatters, and debug adapters listed below.

### External tools worth having installed

| Tool | Used for |
|---|---|
| `gcc` / `g++` | C/C++ |
| `python3` | Python |
| JDK + JavaFX SDK | Java (update the hardcoded path in `mappings.lua` to match your machine) |
| .NET SDK | C# (`omnisharp`, `netcoredbg`) |
| `node`/`npm` | Web LSPs |
| `sqlcmd` | SQL Server access for the database explorer (see below) |

---

## 🈯 Language facilities

| Language | LSP | Formatter | Snippets | Debugger |
|---|---|---|---|---|
| C | `clangd` | `clang-format` | `cmain` | — |
| C++ | `clangd` | `clang-format` | `cpp`, `cp` (CP template) | — |
| Java | — | — | `jmain` | — |
| Python | — | — | `pymain` | — |
| C# | `omnisharp` | — | `cw`, `ctor`, `prop` | `netcoredbg` via DAP |
| HTML | `html-lsp` | Prettier | Emmet | — |
| CSS/SCSS | `css-lsp` | Prettier | Emmet | — |
| JS/TS/JSX/TSX | `ts_ls`, `eslint-lsp` | Prettier | Emmet | — |
| Lua | — | `stylua` | — | — |

---

## ⌨️ My shortcuts

### Compile & run

| Keymap | Action |
|---|---|
| `<leader>cc` | Compile current file (C/C++/Java) |
| `<leader>cr` | Run current file (C/C++/Python/Java) |
| `<leader>cb` | Compile then run — one-key build |
| `<leader>cd` | Compile with sanitizers (C/C++), auto-runs on success |

C# projects go through the shell `dn build`/`dn run`/`dn br` instead, since .NET operates on the whole project, not a single file.

### Editing

| Keymap | Mode | Action |
|---|---|---|
| `;` | Normal | Enter command mode |
| `jk` | Insert | Escape to normal mode |
| `<C-s>` | Normal/Insert/Visual | Save file |
| `<C-a>` | Normal | Select entire file |
| `<`, `>` | Visual | Indent left/right, keep selection |
| `J` / `K` | Visual | Move selection down/up |
| `<A-Down>` / `<A-Up>` | Insert | Move current line down/up |
| `<A-Down>` / `<A-Up>` | Visual | Move selection down/up |
| `<S-A-Down>` / `<S-A-Up>` | Normal/Insert | Duplicate line down/up |
| `<S-A-Down>` / `<S-A-Up>` | Visual | Duplicate selection down/up |
| `<C-S-k>` | Normal | Delete line without yanking |
| `<C-d>` | Normal | Change next occurrence of word under cursor |
| `<C-q>` | Terminal | Close the terminal buffer |

### Windows & layout

| Keymap | Action |
|---|---|
| `<leader>v` | Vertical split (overrides NvChad's default "new vertical terminal" on this key) |
| `<C-Left>` / `<C-Right>` | Grow/shrink file tree width |
| `<A-Up>` / `<A-Down>` | Grow/shrink split height |
| `<A-Left>` / `<A-Right>` | Shrink/grow split width |
| `zR` / `zM` | Open/close all folds |
| `zK` | Peek folded block, or hover if nothing's folded |

### LSP & diagnostics

| Keymap | Action |
|---|---|
| `<leader>ca` | LSP code action |
| `<leader>xx` | Toggle project-wide diagnostics (Trouble) |
| `<leader>xb` | Toggle diagnostics for current buffer only |

### Web

| Keymap | Action |
|---|---|
| `<leader>wf` | Format file (Prettier) |
| `<leader>we` | ESLint fix all |
| `<leader>ws` | Open current file in browser |
| `<leader>wt` | Wrap word under cursor in an HTML tag I type in |

### C# debugging (DAP)

| Keymap | Action |
|---|---|
| `<leader>db` | Toggle breakpoint |
| `<leader>dc` | Start/continue (prompts for the `.dll` path on first launch) |
| `<leader>di` | Step into |
| `<leader>do` | Step over |
| `<leader>dO` | Step out |
| `<leader>dr` | Open DAP REPL |
| `<leader>du` | Toggle DAP UI |

UI opens automatically when a debug session starts and closes when it ends.

### Database explorer

| Keymap | Action |
|---|---|
| `<leader>Dp` | Pick a database from the server and open it in the explorer |
| `<leader>Dt` | Toggle the explorer drawer |
| `<leader>S` | Run the query in the buffer (or the visual selection) |
| `<leader>W` | Save the query under "Saved queries" |

The capital `D` is deliberate: lowercase `<leader>d` is the DAP prefix above.

Inside the drawer: `Enter` expands/collapses, `R` refreshes, `A` adds a connection, `d` deletes one, `q` closes the drawer. Expanding a table offers List, Columns, Indexes, Foreign Keys, and more — each opens as a query you run with `<leader>S`.

---

## 🗄 Database explorer (SQL Server)

`vim-dadbod` + `vim-dadbod-ui` browse databases, tables, columns, and rows inside Neovim, with no external GUI. The config lives in `lua/plugins/dadbod.lua`.

**How it works:** `<leader>Dp` asks the server for its databases through `sqlcmd` and shows them in a picker. The chosen database becomes the explorer's connection. Nothing is hardcoded except `sa` on `localhost:1433`.

### Setup

1. Install `sqlcmd` (on Arch: `yay -S mssql-tools`).
2. Put the SA password in an environment variable, kept outside this repo:

```bash
cat > ~/.secrets.zsh << 'EOF'
export MSSQL_SA_PASSWORD='your_password_here'
EOF
chmod 600 ~/.secrets.zsh
```

Source it from your shell config (`[ -f ~/.secrets.zsh ] && source ~/.secrets.zsh`), and start Neovim from a shell where it is set. The password is read from the environment at runtime, so it never appears in this repo.

3. If `sqlcmd` fails with a self-signed certificate error (ODBC Driver 18 encrypts by default), put a wrapper first in your `PATH`:

```bash
mkdir -p ~/.local/bin
printf '#!/bin/bash\nexec /usr/bin/sqlcmd -C "$@"\n' > ~/.local/bin/sqlcmd
chmod +x ~/.local/bin/sqlcmd
```

4. Test the connection: `sqlcmd -S localhost -U sa -P "$MSSQL_SA_PASSWORD" -Q "SELECT name FROM sys.databases"`

---

## 🧩 Emmet (HTML/CSS/JS)

Type an abbreviation, hit **Tab** to expand. Enabled for `html`, `css`, `scss`, `sass`, `js`, `jsx`, `ts`, `tsx`, `vue`, `svelte`.

The one I use constantly — **`!`** + Tab at the top of an HTML file:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
  
</body>
</html>
```

Standard Emmet abbreviations (`div.container>ul>li*3`, `p{Hello}`, etc.) work as usual on top of that.

---

## ✂️ Snippets

Tab to expand, Shift-Tab to jump back to the previous placeholder.

| Trigger | Filetype | Expands to |
|---|---|---|
| `cmain` | C | Include boilerplate + `main()` |
| `cpp` | C++ | `iostream` boilerplate + `main()` |
| `cp` | C++ | Full CP template — fast I/O, `solve()`, multi-test-case loop |
| `jmain` | Java | Class + `main()` with `Scanner` wired up |
| `pymain` | Python | `def main():` + `__main__` guard |
| `cw` | C# | `Console.WriteLine();` |
| `ctor` | C# | Constructor skeleton |
| `prop` | C# | Auto-property |

VS Code–style snippet packs (`friendly-snippets`) are also loaded, so other languages get baseline snippets even without a custom trigger above.

---

## 🔑 NvChad defaults I actually use

The rest of NvChad's defaults still work as-is — these are just the ones in regular rotation:

| Keymap | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fw` | Live grep project |
| `<C-n>` | Toggle file tree |
| `<leader>e` | Focus file tree |
| `<Tab>` / `<S-Tab>` | Next/previous buffer |
| `<leader>x` | Close buffer |
| `<leader>/` | Toggle comment |
| `<leader>ch` | Open NvCheatsheet |
| `<A-i>` | Toggle floating terminal |
| `<C-h/j/k/l>` | Switch window left/down/up/right |

Full default list: [nvchad.com/docs/config/mappings](https://nvchad.com/docs/config/mappings)

---

## 🧱 Plugins

Managed by `lazy.nvim`, pinned in `lazy-lock.json`:

`NvChad`, `base46`, `ui`, `volt`, `bg.nvim` — core framework and theming
`telescope.nvim`, `plenary.nvim` — fuzzy finding
`nvim-treesitter`, `nvim-ts-autotag`, `indent-blankline.nvim` — syntax-aware editing
`nvim-lspconfig`, `mason.nvim`, `nvim-cmp` + cmp sources, `cmp_luasnip` — LSP + autocomplete
`conform.nvim` — formatting on save
`LuaSnip`, `friendly-snippets` — snippets
`emmet-vim` — HTML/CSS abbreviation expansion
`nvim-dap`, `nvim-dap-ui`, `nvim-nio`, `nvim-lightbulb` — debugging + code actions
`vim-dadbod`, `vim-dadbod-ui` — SQL Server database explorer
`nvim-tree.lua`, `nvim-web-devicons` — file explorer
`bufferline.nvim` — buffer tabs
`gitsigns.nvim` — git gutter signs
`nvim-colorizer.lua` — inline color previews
`nvim-ufo`, `promise-async` — better code folding
`todo-comments.nvim`, `trouble.nvim` — TODO highlighting + diagnostics list
`which-key.nvim`, `menu`, `minty` — keymap discovery and UI helpers

---

## 📁 Structure

```
.
├── init.lua
├── lazy-lock.json
├── lua
│   ├── autocmds.lua
│   ├── chadrc.lua
│   ├── mappings.lua        # custom keymaps + compile/run functions
│   ├── options.lua
│   ├── configs
│   │   ├── conform.lua      # formatter config
│   │   ├── lazy.lua
│   │   └── lspconfig.lua    # LSP servers + diagnostics config
│   └── plugins
│       ├── init.lua         # LSP, snippets, emmet, autopairs, etc.
│       ├── bufferline.lua
│       ├── csharp.lua       # nvim-lightbulb (code action hints)
│       ├── dadbod.lua       # SQL Server explorer + database picker
│       ├── dap.lua          # C# debugging setup
│       ├── nvimtree.lua
│       └── ufo.lua
└── pywal                    # HyDE/pywal colorscheme integration
```

---

## 👤 Author

**Beshoy Fomail Labib**

[![GitHub](https://img.shields.io/badge/GitHub-beshoy--13-181717?style=flat-square&logo=github)](https://github.com/beshoy-13)
[![Portfolio](https://img.shields.io/badge/Portfolio-beshoy--fomail-000000?style=flat-square&logo=vercel)](https://beshoy-fomail.vercel.app/)
[![Email](https://img.shields.io/badge/Email-beshoy.f.labib%40outlook.com-0078D4?style=flat-square&logo=microsoft-outlook)](mailto:beshoy.f.labib@outlook.com)

---

## Credits

Built on [NvChad](https://github.com/NvChad/NvChad), which credits [LazyVim](https://github.com/LazyVim/starter) as an inspiration for its starter structure.
