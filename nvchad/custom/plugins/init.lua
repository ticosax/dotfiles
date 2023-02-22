local overrides = require("custom.plugins.overrides")

return {
	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.plugins.lspconfig")
		end,
	},
	["nvim-treesitter/nvim-treesitter"] = {
		override_options = overrides.treesitter,
	},

	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.null-ls")
		end,
	},

	["tommcdo/vim-exchange"] = {},

	["williamboman/mason.nvim"] = {
		override_options = overrides.mason.ensure_installed,
	},
	["nvim-lua/lsp-status.nvim"] = {},
	["tpope/vim-surround"] = {},
	["psliwka/vim-smoothie"] = {},
	["rmehri01/onenord.nvim"] = {},
	["f-person/git-blame.nvim"] = {},
	["sindrets/diffview.nvim"] = { requires = "nvim-lua/plenary.nvim" },
	["TimUntersberger/neogit"] = {
		requires = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
		run = function()
			local neogit = require("neogit")
			neogit.setup({
				integrations = {
					diffview = true,
				},
			})
		end,
	},
}
