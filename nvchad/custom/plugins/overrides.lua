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
		-- pyhton
		"pylsp",
		"pyright",
		"black",
		"ruff-lsp",
		"pylyzer",

		-- rust
		"rust_analyzer",

		-- lua stuff
		"lua-language-server",
		"stylua",
		"sumneko_lua",

		-- web dev stuff
		"typescript-language-server",
		"graphql",

		"yamfmt",
		"prettier",
		"sql-formatter",
		"tflint",
		"yamlls",
		"dockerls",
		"terraformls",
		"vimls",
	},
}
return M
