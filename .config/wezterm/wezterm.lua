local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font = wezterm.font('Moralerspace Krypton NF')
config.font_size = 9
config.color_scheme = 'OneDark (base16)'
config.default_cursor_style = 'SteadyBar'
config.hide_tab_bar_if_only_one_tab = true
config.initial_rows = 45
config.initial_cols = 180
config.window_padding = {
  left   = '1cell',
  right  = '1cell',
  top    = '0.5cell',
  bottom = '0cell',
}

config.window_close_confirmation = 'NeverPrompt'
config.mouse_bindings = {
  -- Jump to clicked URL only when Ctrl is pressed
  -- by https://github.com/wez/wezterm/issues/119#issuecomment-1206593847
  {
    event = { Up = {streak = 1, button = 'Left'} },
    mods = 'NONE',
    action = wezterm.action.CompleteSelection('PrimarySelection'),
  },
  {
    event = { Up = {streak = 1, button = 'Left'} },
    mods = 'CTRL',
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
  {
    event = { Down = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = wezterm.action.Nop,
  },
}

return config

