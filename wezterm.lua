local wezterm = require("wezterm")
local mykeys = {}
for i = 1, 8 do
	-- CTRL+ALT + number to move to that position
	table.insert(mykeys, {
		key = tostring(i),
		mods = "CTRL|ALT",
		action = wezterm.action.MoveTab(i - 1),
	})
end
table.insert(mykeys, { key = "V", mods = "CTRL|SHIFT", action = wezterm.action({ PasteFrom = "Clipboard" }) })
return {
	-- font = wezterm.font("Fira Code", {font_size=11, weight="ExtraLight"}),
	font = wezterm.font("DejaVuSansMono Nerd Font", { weight = "Regular" }),
	warn_about_missing_glyphs = false,
	-- font = wezterm.font("NotoSansMono Font" , { weight = "Light" }),
	exit_behavior = "Close",

	-- color_scheme = "AtelierSulphurpool",
	-- color_scheme = "Belafonte Night",
	-- color_scheme = "Aurora",
	color_scheme = "Whimsy",
	-- color_scheme = "Spacedust",
	font_size = 11,
	keys = mykeys,
	-- colors = { compose_cursor = "orange" },
	scrollback_lines = 14000,
	enable_scroll_bar = true,
	hyperlink_rules = {
		-- Linkify things that look like URLs with numeric addresses as hosts.
		-- E.g. http://127.0.0.1:8000 for a local development server,
		-- or http://192.168.1.1 for the web interface of many routers.
		{
			regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
			format = "$0",
		},
		-- infarm JIRA board
		{
			regex = [[\bOSDOPM-(\d+)\b]],
			format = "https://infarm.atlassian.net/browse/$0",
		},
		-- infarm JIRA board
		{
			regex = [[\SWPD-(\d+)\b]],
			format = "https://infarm.atlassian.net/browse/$0",
		},
	},
}
