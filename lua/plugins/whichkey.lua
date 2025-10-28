
local wk = require("which-key")

wk.add({
  { "<leader>C", group = "LSP" },
  { "<leader>CD", desc = "Declaration" },
  { "<leader>Cf", desc = "Definition" },
  { "<leader>Ck", desc = "Hover" },
  { "<leader>Esc", desc = "CloseTab" },
  { "<leader>Tab", desc = "PrevTab" },
  { "<leader>c", group = "Color Schemes" },
  { "<leader>cs", desc = "Open" },
  { "<leader>e", desc = "Open Diagnostic Window" },
  { "<leader>f", group = "Find" },
  { "<leader>fb", desc = "Find Buffer" },
  { "<leader>ff", desc = "Find File" },
  { "<leader>fh", desc = "Find Help" },
  { "<leader>ft", desc = "Find Text" },
  { "<leader>n", group = "TodoList" },
  { "<leader>nl", desc = "Open List" },
  { "<leader>r", desc = "Ruff" },
  { "<leader>s", desc = "Open Terminal" },
  { "<leader>t", group = "NvimTree" },
  { "<leader>tf", desc = "Tree Focus" },
  { "<leader>tt", desc = "Tree Toggle" },
})

-- wk.register({
-- 	f = {
-- 		name = "Find",
-- 		f = {"Find File"},
-- 		t = {"Find Text"},
-- 		b = {"Find Buffer"},
-- 		h = {"Find Help"},
-- 	},
--
-- 	g = {
-- 		name = "Git",
-- 		b = "Open Branches",
-- 		c = "Open Commits",
-- 		s = "Open Status",
-- 	},
--
--     e = {"Open Diagnostic Window"},
--
--     C = {
--         name = "LSP",
--         D = "Declaration",
--         f = "Definition",
--         k = "Hover",
--     },
--     
--     Tab = {"PrevTab"},
--     Esc = {"CloseTab"},
--
--     t = {
--         name = "NvimTree",
--         t = "Tree Toggle",
--         f = "Tree Focus",
--     },
--
--     n = {
--         name = "TodoList",
--         l = "Open List"
--     },
--
--     s = {"Open Terminal"},
--
--     r = {"Ruff"},
--
--     c = {
--         name = "Color Schemes",
--         s = "Open"
--     }
--
-- }, {prefix = "<leader>"})
