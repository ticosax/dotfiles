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
		"pylsp",
		"pyright",
		"black",
		"ruff-lsp",
    "python-lsp-server",
		"pylyzer",

		-- rust
		"rust-analyzer",

		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"typescript-language-server",
    "graphql-language-service-cli",

		"yamlfmt",
		"prettier",
		"sql-formatter",
		"tflint",
		"yamlls",
		"dockerls",
		"terraformls",
		"vimls",
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

return M
