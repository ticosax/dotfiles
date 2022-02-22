local wezterm = require 'wezterm';
return {
	-- font = wezterm.font("Fira Code", {font_size=11, weight="ExtraLight"}),
	-- font = wezterm.font("Cascadia Code PL"),
	font = wezterm.font("Source Code Pro", {weight="Light"}),
	exit_behavior = "Close",

	-- color_scheme = "AtelierSulphurpool",
	color_scheme = "Belafonte Night",
	-- color_scheme = "Aurora",
	font_size = 11,
	keys = {
		{key="V", mods="CTRL", action=wezterm.action{PasteFrom="Clipboard"}},
	},
	colors = { compose_cursor = "orange" },
	scrollback_lines = 7000,
	enable_scroll_bar = true,
}
