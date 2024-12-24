-- -- Pull in the wezterm API
-- local wezterm = require("wezterm")
--
-- -- This will hold the configuration.
-- local config = wezterm.config_builder()
--
-- -- This is where you actually apply your config choices
--
-- -- -- For example, changing the color scheme:
-- -- config.color_scheme = 'AdventureTime'
-- config.default_prog = { "powershell.exe" }
--
-- config.window_background_opacity = 0
-- config.win32_system_backdrop = "Acrylic"
-- -- config.macos_window_background_blur = 20
--
-- config.default_cursor_style = "BlinkingBlock"
-- config.font = wezterm.font("CaskaydiaCove Nerd Font")
--
-- -- and finally, return the configuration to wezterm
-- return config

local wezterm = require("wezterm")
local act = wezterm.action

require("full_screen_on_start_up")

local config = {
	audible_bell = "Disabled",

	color_scheme = "AdventureTime",
	inactive_pane_hsb = {
		hue = 1.0,
		saturation = 1.0,
		brightness = 1.0,
	},
	font_size = 12,
	font = wezterm.font("CaskaydiaCove Nerd Font"),

	launch_menu = {},

	leader = { key = " ", mods = "CTRL" },
	disable_default_key_bindings = true,
	keys = require("keymaps"),

	set_environment_variables = {},
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
}

require("load_launch_menu")(config)
require("navigator")(config)

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	require("load_windows_config")(config)
end

return config
