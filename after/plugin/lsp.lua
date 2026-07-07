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

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
-- vim.diagnostic.goto_prev/goto_next were deprecated in 0.11 in favor of jump()
vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end)
vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

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
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
