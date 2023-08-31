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
	},
	indent = {
		enable = true,
	},
}

M.mason = {
	ensure_installed = {
		-- pyhton
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
    "rome",

    -- Go
    "golangci-lint",
    "golangci-lint-langserver",
    "goimports-reviser",
    "golines",

		"yamlfmt",
		"prettier",
		"sql-formatter",
		"tflint",
		"yaml-language-server",
		"dockerfile-language-server",
		"terraform-ls",
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
