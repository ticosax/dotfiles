local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins

local sources = {

	b.formatting.prettier.with({
		filetypes = {
			"markdown",
			"sql",
			"lua",
			"typescript",
			"javascript",
			"javascriptreact",
			"typescriptreact",
			-- "terraform",
			-- "hcl",
			"rust",
		},
	}),

	-- Lua
	b.formatting.stylua,

	-- Shell
	b.formatting.shfmt,
	b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),

	-- rust
	b.formatting.rustfmt.with({ extra_args = {"--edition", "2021"} }),
	b.code_actions.ltrs,

	-- pyton
	b.formatting.black.with({ extra_args = { "--fast" } }),
	b.diagnostics.ruff,
	b.formatting.ruff,

	-- terraform
	-- b.formatting.terrafmt,
	b.formatting.terraform_fmt.with({
		filetypes = { "hcl" },
	}),
	b.diagnostics.terraform_validate.with({
		filetypes = { "hcl" },
	}),

	-- toml
	b.formatting.taplo,

  -- Go
  b.formatting.goimports_reviser,
  b.formatting.golines,
}

null_ls.setup({
	debug = true,
	sources = sources,
})
