---@type ChadrcConfig
local M = {}

local highlights = require("custom.highlights")
M.ui = {
	theme_toggle = { "oceanic-next", "one_light" },
	theme = "oceanic-next",
	hl_override = highlights.hl_override,
}
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

return M
