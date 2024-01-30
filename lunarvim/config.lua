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

-- Do not prompt to choose where to open. Always open rightmost.
lvim.builtin.nvimtree.setup.actions.open_file.window_picker.enable = false

lvim.colorscheme = "nightfly"
vim.g.nightflyCursorColor = true
vim.g.nightflyItalics = true
vim.g.nightflyNormalFloat = true
vim.g.nightflyTerminalColors = true

local map = vim.keymap.set

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
	},
	{ "HiPhish/rainbow-delimiters.nvim" },
	{ "tpope/vim-surround" },
	{
		"scalameta/nvim-metals",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"mfussenegger/nvim-dap",
				config = function(self, opts)
					-- Debug settings if you're using nvim-dap
					local dap = require("dap")

					dap.configurations.scala = {
						{
							type = "scala",
							request = "launch",
							name = "RunOrTest",
							metals = {
								runType = "runOrTestFile",
								--args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
							},
						},
						{
							type = "scala",
							request = "launch",
							name = "Test Target",
							metals = {
								runType = "testTarget",
							},
						},
					}
				end,
			},
		},
		ft = { "scala", "sbt", "java" },
		opts = function()
			local metals_config = require("metals").bare_config()

			-- Example of settings
			metals_config.settings = {
				showImplicitArguments = true,
				excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
			}

			-- *READ THIS*
			-- I *highly* recommend setting statusBarProvider to true, however if you do,
			-- you *have* to have a setting to display this in your statusline or else
			-- you'll not see any messages from metals. There is more info in the help
			-- docs about this
			-- metals_config.init_options.statusBarProvider = "on"

			-- Example if you are using cmp how to make sure the correct capabilities for snippets are set
			metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

			metals_config.on_attach = function(client, bufnr)
				require("metals").setup_dap()

				-- LSP mappings
				map("n", "gD", vim.lsp.buf.definition)
				map("n", "K", vim.lsp.buf.hover)
				map("n", "gi", vim.lsp.buf.implementation)
				map("n", "gr", vim.lsp.buf.references)
				map("n", "gds", vim.lsp.buf.document_symbol)
				map("n", "gws", vim.lsp.buf.workspace_symbol)
				map("n", "<leader>cl", vim.lsp.codelens.run)
				map("n", "<leader>sh", vim.lsp.buf.signature_help)
				map("n", "<leader>rn", vim.lsp.buf.rename)
				map("n", "<leader>f", vim.lsp.buf.format)
				map("n", "<leader>ca", vim.lsp.buf.code_action)

				map("n", "<leader>ws", function()
					require("metals").hover_worksheet()
				end)

				-- all workspace diagnostics
				map("n", "<leader>aa", vim.diagnostic.setqflist)

				-- all workspace errors
				map("n", "<leader>ae", function()
					vim.diagnostic.setqflist({ severity = "E" })
				end)

				-- all workspace warnings
				map("n", "<leader>aw", function()
					vim.diagnostic.setqflist({ severity = "W" })
				end)

				-- buffer diagnostics only
				map("n", "<leader>d", vim.diagnostic.setloclist)

				map("n", "[c", function()
					vim.diagnostic.goto_prev({ wrap = false })
				end)

				map("n", "]c", function()
					vim.diagnostic.goto_next({ wrap = false })
				end)

				-- Example mappings for usage with nvim-dap. If you don't use that, you can
				-- skip these
				map("n", "<leader>dc", function()
					require("dap").continue()
				end)

				map("n", "<leader>dr", function()
					require("dap").repl.toggle()
				end)

				map("n", "<leader>dK", function()
					require("dap.ui.widgets").hover()
				end)

				map("n", "<leader>dt", function()
					require("dap").toggle_breakpoint()
				end)

				map("n", "<leader>dso", function()
					require("dap").step_over()
				end)

				map("n", "<leader>dsi", function()
					require("dap").step_into()
				end)

				map("n", "<leader>dl", function()
					require("dap").run_last()
				end)
			end

			return metals_config
		end,
		config = function(self, metals_config)
			local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
			vim.api.nvim_create_autocmd("FileType", {
				pattern = self.ft,
				callback = function()
					require("metals").initialize_or_attach(metals_config)
				end,
				group = nvim_metals_group,
			})
		end,
	},
}

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	-- { name = "black", extra_args = { "--fast" } },
	-- { name = "ruff" },
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
	{ name = "scalafmt" },
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
