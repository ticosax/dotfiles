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

local config = {
	font = wezterm.font("Victor Mono Nerd Font", { weight = "Medium" }),
	warn_about_missing_glyphs = false,
	exit_behavior = "Close",
	color_scheme = "Oceanic-Next",
	keys = mykeys,
	window_decorations = "TITLE | RESIZE",
	scrollback_lines = 30000,
	enable_scroll_bar = true,
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
return config
