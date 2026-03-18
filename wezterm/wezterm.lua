local wezterm = require("wezterm")

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

local light_scheme = "Catppuccin Latte"
local dark_scheme = "Catppuccin Mocha"

wezterm.on("toggle-color-scheme", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if overrides.color_scheme == light_scheme then
		overrides.color_scheme = dark_scheme
	else
		overrides.color_scheme = light_scheme
	end
	window:set_config_overrides(overrides)
end)

return {
	color_scheme = "Catppuccin Mocha",
	enable_tab_bar = false,
	font_size = 11.0,
	font = wezterm.font("JetBrains Mono"),
	audible_bell = "Disabled",

	window_background_opacity = 0.98,
	-- window_background_opacity = 1.0,
	window_decorations = "RESIZE",
	-- keys = {
	-- 	{
	-- 		key = 'f',
	-- 		mods = 'CTRL',
	-- 		action = wezterm.action.ToggleFullScreen,
	-- 	},
	-- },
	mouse_bindings = {
		-- Ctrl-click will open the link under the mouse cursor
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	},
	keys = {
		{
			key = "m",
			mods = "SHIFT|CTRL",
			action = wezterm.action({ EmitEvent = "toggle-color-scheme" }),
		},
		-- other settings...
	},
}
