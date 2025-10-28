-- Настраиваем комбинации под разные функции
local builtin = require('telescope.builtin')

require("telescope").setup({
  defaults = {
    -- Игнорировать файлы и папки при поиске файлов (find_files)
    file_ignore_patterns = {
      "node_modules/.*",
      "%.git/.*",
      "%.cache/.*",
      "venv/.*",
      "__pycache__/.*",
      "%.log$",
      "%.so$",
      ".*%.tmp$",
      "package%-lock%.json",
      "yarn%-lock%.yaml",
    },
  },
  pickers = {
    -- Поиск по содержимому (live_grep)
    live_grep = {
      additional_args = function()
        return {
          "--hidden",           -- искать в скрытых файлах (опционально)
          "--glob=!.git",       -- исключить .git
          "--glob=!node_modules",
          "--glob=!john-bleeding-jumbo",
          "--glob=!sqlmap-dev",
          "--glob=!__pycache__",
          "--glob=!*.log",
          "--glob=!*.lock",
          "--glob=!*.so",
          "--glob=!*.tmp",
          "--glob=!**/3WiFi_WiFiKey.json",
          "--glob=!**/3WiFi_WiFiKey.txt",
          "--glob=!Runiq.txt",
          -- "--glob=!**/words_alpha.txt",
          "--glob=!words_alpha.txt",
        }
      end,
    },
    -- Поиск файлов (find_files)
    find_files = {
      find_command = {
          "fd",
          "--type",
          "f",
          "--hidden",
          "--exclude",
          ".git",
          "--exclude",
          "node_modules"
      }
    },
  },
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

