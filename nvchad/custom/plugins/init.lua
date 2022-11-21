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
	["sindrets/diffview.nvim"] = { requires = "nvim-lua/plenary.nvim" },
	["TimUntersberger/neogit"] = {
		requires = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
		config = function()
			local neogit = require("neogit")
			neogit.setup({
				integrations = {
					diffview = true,
				},
			})
		end,
	},
	["blueyed/vim-diminactive"] = {},

	["ellisonleao/glow.nvim"] = {},
	["gbrlsnchs/telescope-lsp-handlers.nvim"] = {
		requires = { "nvim-telescope/telescope.nvim" },
		-- config = function()
		-- 	local telescope = require("telescope")
		-- 	telescope.load_extension("lsp_handlers")
		-- end,
	},
	["nvim-treesitter/nvim-treesitter-textobjects"] = {},
	-- ["glacambre/firenvim"] = {
	-- 	config = function()
	-- 		vim.fn["firenvim#install"](0)
	-- 		vim.fn["https://www.linkedin.com/"] = { takeover = "never" }
	-- 	end,
	-- },
	["tpope/vim-fugitive"] = {},
	["rbong/vim-flog"] = {
		requires = { "tpope/vim-fugitive" },
	},
	-- ["startup-nvim/startup.nvim"] = {
	-- 	requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	-- 	config = function()
	-- 		require("startup").setup({ theme = "dashboard" })
	-- 	end,
	-- },

	-- Themes
	-- ["rmehri01/onenord.nvim"] = {},
	-- ["ray-x/aurora"] = {},
	-- ["bluz71/vim-moonfly-colors"] = {},
	-- ["bluz71/vim-nightfly-guicolors"] = {},
	-- ["christianchiarulli/nvcode-color-schemes.vim"] = {},
	-- ["marko-cerovac/material.nvim"] = {
	-- 	config = function()
	-- 		require("material").setup()
	-- 	end,
	-- },
	-- ["Everblush/everblush.nvim"] = {
	-- 	as = "everblush",
	-- 	config = function()
	-- 		local everblush = require("everblush")
	-- 		everblush.setup()
	-- 	end,
	-- },
}
