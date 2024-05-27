-- Pull in the wezterm API
local wezterm = require("wezterm")

-- Create a configuration object
local config = wezterm.config_builder()

-- Apply custom color scheme
-- Get the built-in color scheme "Catppuccin Mocha"
local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
-- Modify the color scheme
custom.background = "#000000" -- Set the background color to black
custom.tab_bar.background = "#040404" -- Set the tab bar background color to very dark gray
custom.tab_bar.inactive_tab.bg_color = "#0f0f0f" -- Set the inactive tab background color to dark gray
custom.tab_bar.new_tab.bg_color = "#080808" -- Set the new tab background color to dark gray

-- Define the custom color scheme
config.color_schemes = {
	["OLEDppuccin"] = custom, -- Name the custom scheme "OLEDppuccin"
}

-- Apply the custom color scheme
config.color_scheme = "OLEDppuccin"

-- Set the font to "MesloLGS Nerd Font Mono"
config.font = wezterm.font("MesloLGS Nerd Font Mono")
-- Set the font size to 12
config.font_size = 12

-- Disable the tab bar
config.enable_tab_bar = false

-- Enable window resizing
config.window_decorations = "RESIZE"

-- Return the configuration to wezterm
return config
