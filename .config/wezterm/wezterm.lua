-- Pull in the wezterm API
local wezterm = require("wezterm")

-- Create a configuration table
local config = wezterm.config_builder()

-- Apply configuration choices

-- Set the color scheme
config.color_scheme = "Catppuccin Macchiato"

-- Set the font and font size
config.font = wezterm.font("MesloLGS NF")
config.font_size = 12

-- Disable the tab bar
config.enable_tab_bar = false

-- Set window decorations to allow resizing
config.window_decorations = "RESIZE"

-- Set window background opacity
config.window_background_opacity = 0.95

-- Enable background blur for macOS
config.macos_window_background_blur = 20

-- Ensure color scheme does not change when switching displays
wezterm.on("window-config-reloaded", function(window, pane)
  window:set_config_overrides({
    color_scheme = "Catppuccin Macchiato"
  })
end)

-- Return the configuration to WezTerm
return config
