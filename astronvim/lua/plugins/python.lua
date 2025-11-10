return {
  { import = "astrocommunity.pack.python-ruff" },
  -- {
  --   "stevearc/conform.nvim",
  --   optional = false,
  -- },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = false,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "ty" })
      -- opts.ensure_installed = vim.tbl_filter(function(v) return v ~= "basedpyright" end, opts.ensure_installed)
      opts.ensure_installed = vim.tbl_filter(
        function(v) return not vim.tbl_contains({ "basedpyright" }, v) end,
        opts.ensure_installed
      )
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "ty" })
      opts.ensure_installed = vim.tbl_filter(
        function(v) return not vim.tbl_contains({ "basedpyright" }, v) end,
        opts.ensure_installed
      )
    end,
  },
}
