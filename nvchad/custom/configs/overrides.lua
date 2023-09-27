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
	indent = {
		enable = true,
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
