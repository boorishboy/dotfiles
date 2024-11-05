local wezterm = require("wezterm")
local config = {}

-- Color scheme
config.color_scheme = "Tokyo Night"

-- Font Config
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 18.0

-- Window opacity and background blur (macOS specific)
-- config.window_background_opacity = 0.75
-- config.macos_window_background_blur = 20
--
-- Disable title bar
config.window_decorations = "RESIZE"

-- Move tabs to bottom
config.tab_bar_at_bottom = true

-- Key modifications
config.keys = {
	-- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
	{
		key = "LeftArrow",
		mods = "OPT",
		action = wezterm.action({ SendString = "\x1bb" }),
	},
	-- Make Option-Right equivalent to Alt-f; forward-word
	{
		key = "RightArrow",
		mods = "OPT",
		action = wezterm.action({ SendString = "\x1bf" }),
	},
	{
		key = "d",
		mods = "CMD",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "d",
		mods = "CMD|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
}

return config
