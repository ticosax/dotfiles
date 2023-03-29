local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

local servers = {
	"pylsp",
	"rust_analyzer",
	"tsserver",
	"pyright",
	"graphql",
	"tflint",
	"yamlls",
	"dockerls",
	"terraformls",
	"vimls",
	"lua_ls",
	"taplo",
	"sqlls",
	"ruff-lsp",
}
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
-- lspconfig['terraformls'].setup{on_attach = on_attach, filetypes = { "terraform", "hcl", "tf"} }
-- lspconfig['sqlls'].setup{cmd = {"sql-language-server", "up", "--method", "stdio"}}
-- lspconfig['jsonls'].setup{on_attach = on_attach, cmd = {"vscode-json-languageserver", "--stdio"}}
