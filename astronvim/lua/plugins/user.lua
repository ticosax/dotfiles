---@type LazySpec
return {
  { "tpope/vim-surround" },
  {
    "nvim-neotest/neotest",
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      table.insert(opts.adapters, require "rustaceanvim.neotest")
      table.insert(opts.adapters, require "neotest-python")
    end,
  },
}
