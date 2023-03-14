local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins

local sources = {

	b.formatting.prettier.with({
		filetypes = {
			"python",
			"markdown",
			"sql",
			"lua",
			"typescript",
			"javascript",
			"javascriptreact",
			"typescriptreact",
		},
	}),

	-- Lua
	b.formatting.stylua,

	-- Shell
	b.formatting.shfmt,
	b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),

	-- rust
	b.formatting.rustfmt,

	-- pyton
	b.formatting.black.with({ extra_args = { "--fast" } }),
	b.diagnostics.ruff,
	b.formatting.ruff,

	-- terraform
	b.formatting.terrafmt,
	b.formatting.terraform_fmt,
}

null_ls.setup({
	debug = true,
	sources = sources,
})
