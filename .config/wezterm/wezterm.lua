-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.
-- config.color_scheme_dirs = { '$XDG_CONFIG_HOME/wezterm/colours' }
config.color_scheme_dirs = { '/home/amy/.config/wezterm/colours' }
config.color_scheme = 'amy'

-- Finally, return the configuration to wezterm:
return config
