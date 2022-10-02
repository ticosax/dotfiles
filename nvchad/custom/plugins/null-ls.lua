local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  b.formatting.prettier.with { filetypes = { "python", "markdown", "sql", "lua" } },

  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  b.formatting.rustfmt,

  b.formatting.black,
  b.diagnostics.flake8,
  b.formatting.isort.with {extra_args = {"--profile black"}},
}

null_ls.setup {
  debug = true,
  sources = sources,
}
