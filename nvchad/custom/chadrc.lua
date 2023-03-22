local M = {}

M.ui = {
	theme_toggle = { "ayu-dark", "one_light" },
	theme = "oceanic-next",
	hl_override = require("custom.highlights"),
}
M.plugins = require("custom.plugins")
M.mappings = require("custom.mappings")

return M
