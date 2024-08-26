local wezterm = require("wezterm")
local config = {}

-- Color scheme
config.color_scheme = "Catppuccin Mocha"

-- Window opacity and background blur (macOS specific)
config.window_background_opacity = 0.75
config.macos_window_background_blur = 20

-- Disable title bar
config.window_decorations = "RESIZE"

-- Move tabs to bottom
config.tab_bar_at_bottom = true

return config
