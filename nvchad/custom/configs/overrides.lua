local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"python",
		"markdown",
		"rust",
		"json",
		"hcl",
		"toml",
		"kotlin",
	},
	highlight = { enable = true },
	indent = { enable = true },
	pairs = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
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
			},
			-- include_surrounding_whitespace = true,
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>sa"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>sA"] = "@parameter.inner",
			},
		},
		lsp_interop = {
			enable = true,
			border = "none",
			floating_preview_opts = {},
			peek_definition_code = {
				["<leader>df"] = "@function.outer",
				["<leader>dF"] = "@class.outer",
			},
		},
		refactor = {
			highlight_definitions = {
				enable = true,
				-- Set to false if you have an `updatetime` of ~100.
				clear_on_cursor_move = true,
			},
			highlight_current_scope = { enable = true },
		},
	},
}

M.mason = {
	ensure_installed = {
		-- python
		"pyright",
		"black",
		"ruff-lsp",
		"python-lsp-server",
		"pylyzer",

		-- rust
		"rust-analyzer",
		"codelldb",
		"cpptools",

		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"typescript-language-server",
		"graphql-language-service-cli",
		"biome",
		"prettier",

		-- Go
		"golangci-lint",
		"golangci-lint-langserver",
		"goimports-reviser",
		"golines",

		-- kotlin
		"kotlin-language-server",
		"gradle-language-server",

		-- yaml
		"yamlfmt",
		"yaml-language-server",

		-- terraform
		"tflint",
		"terraform-ls",

		--kotlin
		"ktlint",

		-- Others
		"sql-formatter",
		"dockerfile-language-server",
		"vim-language-server",
	},
}

M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

M.telescope = {
	extensions_list = { "themes", "terms", "dap" },
}
return M
