-- /home/nicolas/.config/lvim/config.lua
-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
vim.opt.mouse = ""

lvim.builtin.which_key.mappings["br"] = { "Obreakpoint()<esc>", "Insert python breakpoint" }
lvim.builtin.treesitter.ensure_installed = {
	"vim",
	"lua",
	"python",
	"markdown",
	"rust",
	"json",
	"hcl",
	"toml",
	"kotlin",
	"go",
}
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.textobjects.select.enable = true
lvim.builtin.treesitter.textobjects.select.lookahead = true
lvim.builtin.treesitter.textobjects.keymaps = {
	["aa"] = "@parameter.outer",
	["ia"] = "@parameter.inner",
	-- You can use the capture groups defined in textobjects.scm
	["af"] = "@function.outer",
	["if"] = "@function.inner",
	["ac"] = "@class.outer",
	-- You can optionally set descriptions to the mappings (used in the desc parameter of
	-- nvim_buf_set_keymap) which plugins like which-key display
	["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
	-- You can also use captures from other query groups like `locals.scm`
	["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
}
lvim.builtin.treesitter.textobjects.swap.enable = true
lvim.builtin.treesitter.textobjects.swap.swap_next = { ["<Leader>a"] = "@parameter.inner" }
lvim.builtin.treesitter.textobjects.swap.swap_previous = { ["<Leader>A"] = "@parameter.inner" }

lvim.colorscheme = "nightfly"
vim.g.nightflyCursorColor = true
vim.g.nightflyItalics = true
vim.g.nightflyNormalFloat = true
vim.g.nightflyTerminalColors = true

lvim.plugins = {
	-- colorschemes
	{ "folke/tokyonight.nvim" },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "rebelot/kanagawa.nvim" },
	{
		"maxmx03/fluoromachine.nvim",
		config = function()
			local fm = require("fluoromachine")

			fm.setup({
				glow = false,
				theme = "fluoromachine",
			})
		end,
	},
	{ "Everblush/nvim" },
	{ "mhartington/oceanic-next" },
	{ "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
	--
	{
		"wfxr/minimap.vim",
		build = "cargo install --locked code-minimap",
		-- cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
		config = function()
			vim.cmd("let g:minimap_width = 10")
			vim.cmd("let g:minimap_auto_start = 1")
			vim.cmd("let g:minimap_auto_start_win_enter = 1")
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{
		"karb94/neoscroll.nvim",
		event = "WinScrolled",
		config = function()
			require("neoscroll").setup({
				-- All these keys will be mapped to their corresponding default scrolling animation
				mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
				hide_cursor = false, -- Hide cursor while scrolling
				stop_eof = true, -- Stop at <EOF> when scrolling downwards
				use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
				respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
				cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
				easing_function = nil, -- Default easing function
				pre_hook = nil, -- Function to run before the scrolling animation starts
				post_hook = nil, -- Function to run after the scrolling animation ends
			})
			local t = {}
			t["<PageUp>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "100" } }
			t["<PageDown>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "100" } }
			require("neoscroll.config").set_mappings(t)
		end,
	},
	{
		"ellisonleao/glow.nvim",
		config = true,
		ft = { "markdown" },
	},
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
		branch = "legacy",
		version = "legacy",
	},
	{ "HiPhish/rainbow-delimiters.nvim" },
	{ "tpope/vim-surround" },
}
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	-- { name = "black", extra_args = { "--fast" } },
	{ name = "ruff" },
	{ name = "stylua" },
	{ name = "shfmt" },
	{ name = "rustfmt", extra_args = { "--edition", "2021" } },
	{ name = "stylelint" },
	{
		name = "prettier",
		---@usage arguments to pass to the formatter
		-- these cannot contain whitespace
		-- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
		---@usage only start in these filetypes, by default it will attach to all filetypes it supports
		filetypes = {
			"markdown",
			"sql",
			"lua",
			"typescript",
			"javascript",
			"javascriptreact",
			"typescriptreact",
		},
	},
	{
		name = "terraform_fmt",
		filetypes = {
			"hcl",
		},
	},
	{ name = "taplo" },
	{ name = "goimports_reviser" },
	{ name = "golines" },
	{ name = "ktlint" },
})

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{
		name = "shellcheck",
		args = { "--severity", "warning" },
	},
	{ name = "ruff" },
	{ name = "terraform_validate", filetypes = { "hcl" } },
	{ name = "ktlint" },
	{ name = "eslint", filetypes = { "typescript", "typescriptreact" } },
})

local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
	{
		name = "ltrs",
	},
})
lvim.builtin.which_key.mappings["l"]["f"] = {
	function()
		require("lvim.lsp.utils").format({ timeout_ms = 10000 })
	end,
	"Format",
}
reload("user.rust_ide")
reload("user.python_ide")
