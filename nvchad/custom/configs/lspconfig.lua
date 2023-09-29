local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

local servers = {
	-- Python
	"pylsp",
	"pyright",
	"ruff_lsp",
	-- "pylyzer",

	-- Rust
	"rust_analyzer",

	-- TS
	"tsserver",
	"biome",

	-- Neovim
	"vimls",
	"lua_ls",

	-- terraform
	"tflint",

	-- Go
	"golangci_lint_ls",

  -- Kotlin
  "kotlin_language_server",
  "gradle_ls",

	-- Other
	"graphql",
	"taplo",
	"dockerls",
	"sqlls",
	"yamlls",
}
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
lspconfig["terraformls"].setup({
	on_attach = on_attach,
	filetypes = { "terraform", "hcl", "tf" },
	capabilities = capabilities,
})
-- lspconfig['sqlls'].setup{cmd = {"sql-language-server", "up", "--method", "stdio"}}
-- lspconfig['jsonls'].setup{on_attach = on_attach, cmd = {"vscode-json-languageserver", "--stdio"}}
lspconfig["pylsp"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					enabled = false,
				},
			},
		},
	},
})
