local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{ "nvim-treesitter/nvim-treesitter", opts = overrides.treesitter },
	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	{ "tommcdo/vim-exchange", lazy = false },
	{ "williamboman/mason.nvim", opts = overrides.mason },
	{ "nvim-lua/lsp-status.nvim" },
	{ "tpope/vim-surround", lazy = false },
	{
		"karb94/neoscroll.nvim",
		lazy = false,
		config = function()
			require("neoscroll").setup()
			local t = {}
			t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "100" } }
			t["<PageUp>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "100" } }
			t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "100" } }
			t["<PageDown>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "100" } }
			require("neoscroll.config").set_mappings(t)
		end,
	},
	{ "f-person/git-blame.nvim" },
	{ "liuchengxu/vista.vim", lazy = false },
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
}
return plugins
