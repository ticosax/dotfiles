local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
	{ "friendly-snippets", enabled = false },
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
		dependencies = { "jose-elias-alvarez/null-ls.nvim" },
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("custom.configs.null-ls")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-refactor",
			"nvim-treesitter/nvim-treesitter-context",
			"HiPhish/rainbow-delimiters.nvim",
			"theHamsta/nvim-treesitter-pairs",
			"folke/twilight.nvim",
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-- { "tommcdo/vim-exchange", lazy = false },
	{ "williamboman/mason.nvim", opts = overrides.mason },
	{ "nvim-lua/lsp-status.nvim" },
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
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dap.adapters.cppdbg = {
				id = "cppdbg",
				type = "executable",
			}
			-- dap.adapters.lldb = {
			-- 	type = "executable",
			-- 	command = "/usr/bin/lldb-vscode",
			-- 	name = "lldb",
			-- }
			dap.configurations.rust = {
				name = "Rust debug",
				type = "lldb",
				request = "launch",
				program = function()
					vim.fn.jobstart("cargo build")
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
				showDisassembly = "never",
				initCommands = function()
					-- Find out where to look for the pretty printer Python module
					local rustc_sysroot = vim.fn.trim(vim.fn.system("rustc --print sysroot"))

					local script_import = 'command script import "'
						.. rustc_sysroot
						.. '/lib/rustlib/etc/lldb_lookup.py"'
					local commands_file = rustc_sysroot .. "/lib/rustlib/etc/lldb_commands"

					local commands = {}
					local file = io.open(commands_file, "r")
					if file then
						for line in file:lines() do
							table.insert(commands, line)
						end
						file:close()
					end
					table.insert(commands, 1, script_import)

					return commands
				end,
			}
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
		dependencies = { "nvim-telescope/telescope-dap.nvim", "mfussenegger/nvim-dap-python" },
	},
	{
		"rcarriga/nvim-dap-ui",
		ft = { "rust", "python", "go" },
		config = function()
			require("dapui").setup()
		end,
		dependencies = { "mfussenegger/nvim-dap" },
	},
	{ "jonboh/nvim-dap-rr" },
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
	{ "tpope/vim-repeat" },
	{ "nvim-telescope/telescope-symbols.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		opts = {
			defaults = {
				layout_strategy = "vertical",
				layout_config = {
					height = 0.95,
					prompt_position = "top",
					vertical = {
						mirror = true,
						preview_cutoff = 0,
					},
				},
			},
		},
	},
	{
		"barrett-ruth/live-server.nvim",
		build = "yarn global add live-server",
		config = function()
			require("live-server").setup()
		end,
		ft = { "typescript", "ts", "tsx" },
	},
	{
		"dmmulroy/tsc.nvim",
		config = function()
			require("tsc").setup()
		end,
		ft = { "typescript", "ts", "tsx" },
	},
	-- {
	-- 	"pmizio/typescript-tools.nvim",
	-- 	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	-- 	opts = {},
	-- 	config = function()
	-- 		require("typescript-tools").setup({})
	-- 	end,
	-- 	ft = { "typescript", "ts", "tsx" },
	-- },
	{
		"wfxr/minimap.vim",
		build = "cargo install --locked code-minimap",
		-- cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
		config = function()
			vim.cmd("let g:minimap_width = 10")
			vim.cmd("let g:minimap_auto_start = 1")
			vim.cmd("let g:minimap_auto_start_win_enter = 1")
			vim.cmd("let g:minimap_git_colors = 1")
		end,
		ft = { "python", "rust", "go", "kotlin", "typescript", "lua" },
	},
}
return plugins
