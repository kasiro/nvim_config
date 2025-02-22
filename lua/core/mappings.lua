vim.g.mapleader = " "

-- Quit
vim.keymap.set('n', '<C-q>', '<cmd>:q<CR>')

-- Copy all text
vim.keymap.set('n', '<C-a>', '<cmd>%y+<CR>')

-- Saving a file via Ctrl+S
vim.keymap.set('i', '<C-s>', '<cmd>:w<CR>')
vim.keymap.set('n', '<C-s>', '<cmd>:w<CR>')

-- NvimTree
vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>tf', ':NvimTreeFocus<CR>')

-- My command: Tyig
-- Назначаем хоткей для выполнения команды ':Tyig'
vim.keymap.set('n', '<leader>h',':Tyig<CR>')

-- BufferLine
vim.keymap.set('n','<Tab>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n','<leader><Tab>', ':BufferLineCyclePrev<CR>')
-- vim.keymap.set('n', '<C-H>', ':BufferLineCloseOthers<CR>')
-- Закрытие текущего буфер
vim.keymap.set('n', '<leader><Esc>', ':bd<CR>')
-- подвинуть в право влево вкладку
-- vim.keymap.set('n', '<C-.>', ':BufferLineMoveNext<CR>')
-- vim.keymap.set('n', '<C-,>', ':BufferLineMovePrev<CR>')

-- TodoList
vim.keymap.set('n', '<leader>nl', ':TodoTelescope<CR>')

-- ToggleTerm
vim.keymap.set('n', '<leader>s', ':ToggleTerm direction=float<CR>')
