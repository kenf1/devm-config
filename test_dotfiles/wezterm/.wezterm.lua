local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- Set font and size
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 19

-- Disable the tab bar
config.enable_tab_bar = false

-- Window decorations style
config.window_decorations = "RESIZE"

-- Window background opacity and blur (darwin only)
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

-- Set color scheme
config.color_scheme = "Batman"

return config
