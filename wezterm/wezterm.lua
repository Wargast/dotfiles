local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function(window)
	local tab, pane, window = mux.spawn_window(cmd or {})
	local gui_window = window:gui_window()
	gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)
end)
return {
	color_scheme = "Catppuccin Mocha",
	enable_tab_bar = false,
	font_size = 11.0,
	font = wezterm.font("JetBrains Mono"),
	macos_window_background_blur = 30,
	native_macos_fullscreen_mode = true,
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
}
