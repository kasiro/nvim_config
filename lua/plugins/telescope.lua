
-- Настраиваем комбинации под разные функции
local builtin = require('telescope.builtin')

-- Исправление ошибки ft_to_lang в telescope.nvim
-- nvim-treesitter.parsers.ft_to_lang больше не существует в новых версиях
-- Используем встроенное API Neovim: vim.treesitter.language.get_lang()
local utils = require('telescope.previewers.utils')

local function safe_ts_highlighter(bufnr, ft)
  local lang = vim.treesitter.language.get_lang(ft)
  if not lang or lang == '' then return false end
  
  local has_ts, ts_configs = pcall(require, 'nvim-treesitter.configs')
  if not has_ts then return false end
  
  if not ts_configs.is_enabled('highlight', lang, bufnr) then return false end
  
  local config = ts_configs.get_module('highlight')
  local ok, parser = pcall(vim.treesitter.get_parser, bufnr, lang)
  if not ok then return false end
  
  vim.treesitter.highlighter.new(parser)
  
  local is_table = type(config.additional_vim_regex_highlighting) == 'table'
  if config.additional_vim_regex_highlighting
    and (not is_table or vim.tbl_contains(config.additional_vim_regex_highlighting, lang))
  then
    vim.api.nvim_buf_set_option(bufnr, 'syntax', ft)
  end
  
  return true
end

utils.ts_highlighter = safe_ts_highlighter

require('telescope').setup({
  defaults = {
    preview = {
      treesitter = true -- включаем treesitter preview
    }
  }
})

-- Работа с файлами и буфферами
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>ft', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Работа с Git
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})

-- Выбор цветовой схемы
vim.keymap.set('n', '<leader>cs', builtin.colorscheme, {})

