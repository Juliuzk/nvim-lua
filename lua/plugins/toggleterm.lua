local ok, toggleterm = pcall(require, "toggleterm")

local active = false;

if not ok then
	vim.notify("Toggleterm: no instalado.")
	return
end

if not active then
	vim.notify("Toggleterm: desactivado.")
	return
end

toggleterm.setup({
	size = 30,
	hide_numbers = true,
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	--direction = "tab",
	close_on_exit = false,
	shell = vim.o.shell,
	float_opts = {
		border = "double",
	},
	winbar = {
		enabled = true,
		name_formatter = function(term) --  term: Terminal
			return term.name
		end,
	},
})

local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Toggle Term
map("n", "<leader>ot", ":ToggleTerm<CR>", default_opts)
map("t", "<esc><esc>", "<Cmd>:ToggleTerm<CR>", default_opts)

-- map("t", "<esc>", [[<C-\><C-n>]], default_opts)
map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], default_opts)
map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], default_opts)
map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], default_opts)
map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], default_opts)
