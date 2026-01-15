-- Basic
require('core.configs')
require('core.plugins')
require('core.mappings')
require('core.colors')

-- Plugins
require('plugins.nvim-tree')

require('plugins.lsp')
require('plugins.cmp')
require('plugins.mason')
require('plugins.mason-lspconfig')
require('plugins.telescope')
require('plugins.dashboard')
require('plugins.colorizer')
require('plugins.lualine')
require('plugins.cellular')
require('plugins.comment')
require('plugins.bufferline')
require('plugins.todo')
require('plugins.trouble')
require('plugins.toggleterm')
require('plugins.whichkey')
require('plugins.mini')

-- Diagnostic command for LSP
function _G.LspDebugInfo()
  print("Current filetype: " .. vim.bo.filetype)
  local clients = vim.lsp.get_clients()
  if #clients == 0 then
    print("No active LSP clients.")
  else
    print("Active LSP clients:")
    for _, client in ipairs(clients) do
      print("- " .. client.name .. " (id: " .. client.id .. ")")
    end
  end
end

vim.api.nvim_create_user_command('LspDebugInfo', _G.LspDebugInfo, {
  desc = 'Display LSP Debug Information (filetype and active clients)',
})