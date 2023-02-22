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
}
M.mason = {
	ensure_installed = {
		"pylsp",
		"rust_analyzer",
		"pyright",
		"graphql",
		"tflint",
		"yamlls",
		"dockerls",
		"terraformls",
		"vimls",
		"sumneko_lua",
		"black",
		"pyproject-flake8",
		"ruff-lsp",

		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"typescript-language-server",

		"yamfmt",
		"prettier",
		"sytlua",
		"sql-formatter",
	},
}
return M
