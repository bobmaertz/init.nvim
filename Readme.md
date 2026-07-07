# init.nvim

Personal nvim development environment.

Requires **Neovim 0.11+** (tested against 0.12) — the LSP setup uses the
native `vim.lsp.config()` / `vim.lsp.enable()` API and nvim-treesitter's
`main` branch.

## Commands

| name | keystroke | description |
| ---- | --------- | ----------- |
| leader | space | leader |

## Plugin management (lazy.nvim)

Plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim),
which bootstraps itself on first launch — no manual install step needed.

```vim
:Lazy            " open the UI
:Lazy sync       " install/update to the lockfile
:Lazy update     " update plugins and refresh lazy-lock.json
:Lazy restore    " roll every plugin back to lazy-lock.json
```

`lazy-lock.json` is committed, so a fresh machine reproduces the exact
plugin versions with `:Lazy restore`.

## LSP / tooling

Language servers are installed through [mason](https://github.com/mason-org/mason.nvim):

```vim
:Mason           " browse/install servers
:LspInfo         " see what's attached to the current buffer
:checkhealth     " verify the whole setup
```

## Treesitter

Parsers are installed via nvim-treesitter's `main` branch:

```vim
:TSUpdate        " update installed parsers
:InspectTree     " replaces the old playground plugin
```
