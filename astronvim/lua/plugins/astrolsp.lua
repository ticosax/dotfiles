-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = function(plugin, opts)
    table.insert(opts, {
      features = {
        codelens = true, -- enable/disable codelens refresh on start
        inlay_hints = false, -- enable/disable inlay hints on start
        semantic_tokens = true, -- enable/disable semantic token highlighting
      },
      formatting = {
        -- control auto formatting on save
        format_on_save = {
          enabled = true, -- enable or disable format on save globally
          allow_filetypes = { -- enable format on save for specified filetypes only
            -- "go",
          },
          ignore_filetypes = { -- disable format on save for specified filetypes
            -- "python",
          },
        },
        disabled = { -- disable formatting capabilities for the listed language servers
          -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
          -- "lua_ls",
        },
        timeout_ms = 1000, -- default format timeout
        -- filter = function(client) -- fully override the default formatting function
        --   return true
        -- end
      },
      config = {
        ty = {
          settings = {
            ty = {
              completions = { autoImport = true },
              experimental = { autoImport = true, rename = true },
            },
          },
        },
        typos_lsp = {
          capabilities = {
            positionEncodings = "UTF-8",
          },
        },
      },
    })
  end,
}
