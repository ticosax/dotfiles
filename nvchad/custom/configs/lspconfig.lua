local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

local servers = {
	"python-lsp-server",
	"rust-analyzer",
	"tsserver",
	"pyright",
	"graphql-language-service-cli",
	"tflint",
	"yamlls",
	"dockerls",
	"vimls",
	"lua_ls",
	"taplo",
	"sqlls",
	"ruff_lsp",
	-- "pylyzer",
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
