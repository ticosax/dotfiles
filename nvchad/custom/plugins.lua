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
	{
		"simrat39/rust-tools.nvim",
		config = function()
			local rt = require("rust-tools")
			rt.setup({
				server = {
					on_attach = function(_, bufnr)
						-- Hover actions
						-- vim.keymap.set("n", "<Leader>,", rt.hover_actions.hover_actions, { buffer = bufnr })
						-- Code action groups
						vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
					end,
				},
			})
		end,
		dependencies = { "mfussenegger/nvim-dap" },
	},
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			dap.adapters.lldb = {
				type = "executable",
				command = "/usr/bin/lldb-vscode",
				name = "lldb",
			}

			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = "/usr/bin/codelldb",
					args = { "--port", "${port}" },
				},
			}
			dap.configurations.rust = {
				{
					name = "Rust debug",
					type = "codelldb",
					request = "launch",
					program = function()
						vim.fn.jobstart("cargo build")
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},
					showDisassembly = "never",
					-- runInTerminal = true,
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
				},
			}
		end,
	},
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
	{ "tpope/vim-repeat" },
	{
		"nvim-telescope/telescope-symbols.nvim",
		-- config = function()
		-- 	require("telescope.builtin").symbols({ sources = { "emoji" } })
		-- end,
	},
}
return plugins
