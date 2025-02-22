
-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.pyright.setup {
    settings = {
	    pyright = {
	      -- Using Ruff's import organizer
	      -- disableOrganizeImports = true,
	    },
	    python = {
	      analysis = {
	        -- Ignore all files for analysis to exclusively use Ruff for linting
	        -- ignore = { '*' },
	      },
		},
	},	
}

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
--
-- lspconfig.emmet_ls.setup({
--     -- on_attach = on_attach,
--     capabilities = capabilities,
--     filetypes = {
--         "css",
--         "html",
--         "javascript",
--         "scss",
--         "vue"
--     },
--     cmd = {"emmet-ls", "--stdio"},
--     init_options = {
--       html = {
--         options = {
--           -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
--           ["bem.enabled"] = true,
--         },
--       },
--     }
-- })

lspconfig.emmet_language_server.setup({
  filetypes = {
      "css",
      "html",
      "javascript",
      "javascriptreact",
      "less",
      "sass",
      "scss",
      "vue",
      "pug",
      "typescriptreact"
  },
  cmd = {"emmet-language-server", "--stdio"},
  -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
  -- **Note:** only the options listed in the table are supported.
  init_options = {
    ---@type table<string, string>
    includeLanguages = {},
    --- @type string[]
    excludeLanguages = {},
    --- @type string[]
    extensionsPath = {},
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
    preferences = {},
    --- @type boolean Defaults to `true`
    showAbbreviationSuggestions = true,
    --- @type "always" | "never" Defaults to `"always"`
    showExpandedAbbreviation = "always",
    --- @type boolean Defaults to `false`
    showSuggestionsAsSnippets = true,
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
    syntaxProfiles = {},
    --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
    variables = {},
  },
})

lspconfig.ts_ls.setup({
    filetypes = {"typescript"},
    cmd = { "typescript-language-server", "--stdio" }
})
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {
        
    },
  },
}

-- Setup Ruff Linter
-- lspconfig.ruff.setup {
--   init_options = {
--     settings = {
--       -- Any extra CLI arguments for `ruff` go here.
--       args = {
-- 		"--select=E,F,UP,N,I,ASYNC,S,PTH",
-- 		"--line-length=79",
-- 		"--respect-gitignore",  -- Исключать из сканирования файлы в .gitignore
--       	"--target-version=py311"
--       },
--     }
--   }
-- }

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<C-[>', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
vim.keymap.set('n', '<C-]>', vim.diagnostic.goto_next)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', '<C-d>', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', '<C-l>', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<C-f>', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'i', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-r>', vim.lsp.buf.signature_help, opts)
    
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    
    -- TODO: Используется повторно, необходимо вырезать в след.версии
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>r', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
