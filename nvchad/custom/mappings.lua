local M = {}

M.general = {
	n = {
		["<leader>br"] = { "Obreakpoint()<esc>", "Insert python breakpoint" },
		["<leader>tv"] = { ":Vista!! <CR>", "Toggle Vista, symbols, tags manager" },
		["<leader>db"] = { ":lua require('dap').toggle_breakpoint()<CR>" },
		["<leader>dc"] = { ":lua require('dap').continue()<CR>" },
		["<leader>dn"] = { ":lua require('dap').step_over()<CR>" },
		["<leader>ds"] = { ":lua require('dap').step_into()<CR>" },
		["<leader>du"] = { ":lua require('dap').step_out()<CR>" },
	},
}

return M
