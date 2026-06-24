local wezterm = require 'wezterm'
local act = wezterm.action

local config = wezterm.config_builder()

config.font_size = 12
config.font = wezterm.font 'Sudo Var'


return config
