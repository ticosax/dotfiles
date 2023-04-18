local wezterm = require("wezterm")
local act = wezterm.action

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
	font = wezterm.font("Victor Mono Nerd Font", { weight = "Medium" }),
	warn_about_missing_glyphs = false,
	exit_behavior = "Close",
	color_scheme = "Oceanic-Next",
	keys = mykeys,
	window_decorations = "RESIZE",
	scrollback_lines = 30000,
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
		-- OSDOPM-001
		{
			regex = [[\bOSDOPM-(\d+)\b]],
			format = "https://infarm.atlassian.net/browse/$0",
		},
		-- infarm JIRA board
		-- SWPD-001
		{
			regex = [[\SWPD-(\d+)\b]],
			format = "https://infarm.atlassian.net/browse/$0",
		},
	},
	hide_mouse_cursor_when_typing = false,
	mouse_bindings = {
		-- Change the default click behavior so that it only selects
		-- text and doesn't open hyperlinks
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "NONE",
			action = act.CompleteSelection("ClipboardAndPrimarySelection"),
		},

		-- and make CTRL-Click open hyperlinks
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = act.OpenLinkAtMouseCursor,
		},
	},
}
