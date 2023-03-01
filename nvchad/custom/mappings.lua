local M = {}

M.general = {
	n = {
		["<leader>br"] = { "Obreakpoint()<esc>", "Insert python breakpoint" },
		["<leader>tv"] = { ":Vista!! <CR>", "Toggle Vista, symbols, tags manager" },
	},
}

return M
