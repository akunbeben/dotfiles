local wezterm = require("wezterm")
local config = wezterm.config_builder()

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		os.execute("bash -c 'echo mocha > ~/.config/nvim/theme-flavour'")
		return "Catppuccin Mocha"
	else
		os.execute("bash -c 'echo latte > ~/.config/nvim/theme-flavour'")
		return "Catppuccin Latte"
	end
end

config.automatically_reload_config = true

config.default_cwd = "/home/ben/Projects"

config.font = wezterm.font("JetBrains Mono", { weight = "DemiBold" })
config.font_size = 10
config.front_end = "OpenGL"
config.line_height = 1.5

config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
config.window_background_opacity = 0.95

config.enable_tab_bar = false
config.window_decorations = "NONE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 14,
	bottom = 0,
}

return config
