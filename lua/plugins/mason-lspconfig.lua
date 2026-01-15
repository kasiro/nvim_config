require('mason-lspconfig').setup({
    ensure_installed = {
        'pyright',
    },
    handlers = {
        -- Explicit handler for pyright
        ["pyright"] = function()
            local lspconfig = require('lspconfig')
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            lspconfig.pyright.setup({
                capabilities = capabilities,
                filetypes = { "python" },
            })
        end,

        ["rust_analyzer"] = function()
            local lspconfig = require('lspconfig')
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
            })
        end,

        -- Generic handler for other servers
        function(server_name)
            local lspconfig = require('lspconfig')
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            lspconfig[server_name].setup({
                capabilities = capabilities,
            })
        end,

        -- ["lua_ls"] = function()
        --     local lspconfig = require('lspconfig')
        --     local capabilities = require('cmp_nvim_lsp').default_capabilities()
        --     lspconfig.lua_ls.setup({
        --         capabilities = capabilities,
        --         settings = {
        --             Lua = {
        --                 diagnostics = {
        --                     globals = { "vim" }
        --                 }
        --             }
        --         }
        --     })
        -- end,
    }
})