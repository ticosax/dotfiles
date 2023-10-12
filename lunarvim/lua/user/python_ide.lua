-- install plugins
vim.list_extend(lvim.plugins, {
	"AckslD/swenv.nvim",
	"stevearc/dressing.nvim",
	"mfussenegger/nvim-dap-python",
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
		},
	},
	"nvim-neotest/neotest-python",
})

-- setup debug adapter
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
pcall(function()
	require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

-- setup testing
require("neotest").setup({
	adapters = {
		require("neotest-python")({
			-- Extra arguments for nvim-dap configuration
			-- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
			dap = {
				justMyCode = false,
				console = "integratedTerminal",
			},
			args = { "--log-level", "DEBUG", "--quiet" },
			runner = "pytest",
		}),
	},
})

lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('neotest').run.run()<cr>", "Test Method" }
lvim.builtin.which_key.mappings["dM"] =
	{ "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Test Method DAP" }
lvim.builtin.which_key.mappings["df"] = {
	"<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>",
	"Test Class",
}
lvim.builtin.which_key.mappings["dF"] = {
	"<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>",
	"Test Class DAP",
}
lvim.builtin.which_key.mappings["dS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" }

-- binding for switching
lvim.builtin.which_key.mappings["W"] = {
	name = "Python",
	c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
}
