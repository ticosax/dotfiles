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

	{ "tommcdo/vim-exchange" },
	{ "williamboman/mason.nvim", opts = overrides.mason },
	{ "nvim-lua/lsp-status.nvim" },
	{ "tpope/vim-surround" },
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
	},
	{ "rmehri01/onenord.nvim" },
	{ "f-person/git-blame.nvim" },
	{ "liuchengxu/vista.vim" },
}
return plugins
