require("mason").setup()

-- Neovim 0.11+ native LSP configuration. Server definitions come from
-- nvim-lspconfig's lsp/ directory; the old require('lspconfig') framework
-- is deprecated and removed on 0.12-era nvim-lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Applied to every server
vim.lsp.config('*', {
    capabilities = capabilities,
})

-- Server-specific overrides (merged on top of nvim-lspconfig defaults)
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

vim.lsp.config('gopls', {
    settings = {
        gopls = {
            buildFlags = { "-tags=testing" },
            analyses = {
                shadow = true,
                unusedparams = true,
            },
            completeUnimported = true,
            staticcheck = true,
            gofumpt = true,
        }
    },
})

-- mason-lspconfig v2 automatically calls vim.lsp.enable() for every
-- server installed through mason, so no handlers table is needed.
require('mason-lspconfig').setup()

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- [d / ]d are builtin since 0.10; this keeps the float-on-jump behavior
-- the old custom mappings had
vim.diagnostic.config({ jump = { float = true } })

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
-- This is useful for when you have multiple language servers and perfoms as a global on_attach
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        --
        -- Builtins (0.11+) intentionally NOT remapped here:
        --   K = hover, grr = references, gra = code action, grn = rename,
        --   gri = implementation, [d/]d = diagnostics,
        --   <C-s> (insert) = signature help
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)

        vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
