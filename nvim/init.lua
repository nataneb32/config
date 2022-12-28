require 'plugins'


vim.g.mapleader = " "

local wk = require("which-key")

wk.register({
	e = { "<cmd>Neotree<cr>", "Open FileTree" },
	l = {
		name = "LSP",
		f = { "<cmd>LspZeroFormat<cr>", "Format buffer" },
	}
}, { prefix = "<leader>" })

wk.setup({})


vim.cmd "set clipboard+=unnamedplus"
vim.cmd "set number"
vim.cmd "set rnu"

local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")

if not configs.foo_lsp then
	configs.jakt = {
		default_config = {
			cmd = {"node", "$HOME/jakt/editors/vscode/out/server/src/server.js", "--stdio"},
			filetypes = { 'jakt' },
			root_dir = function(fname)
				return lspconfig.util.find_git_ancestor(fname)
			end,
			settings = {},
		},
	}
end

lspconfig.jakt.setup({})
lspconfig.dartls.setup({})


vim.cmd [[
noremap n j
noremap e k
noremap i l
noremap j n
noremap k e
noremap l i
noremap N J
noremap J N
]]

vim.api.nvim_set_keymap('', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>", {})
vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>", {})


vim.cmd [[
autocmd BufRead,BufEnter *.astro set filetype=astro
]]


vim.cmd [[
colorscheme material
set clipboard+=unnamedplus
]]

vim.api.nvim_set_keymap(
  "n",
  "<space>fr",
  ":Telescope file_browser<CR>",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<space>fe",
  ":Telescope file_browser path=%:p:h<CR>",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<space>gc",
  ":Neogit commit<CR>",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<space>gs",
  ":Telescope git_status<CR>",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<space>gs",
  ":Telescope git_status<CR>",
  { noremap = true }
)
