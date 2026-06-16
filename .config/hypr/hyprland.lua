require("land.start")
require("land.keys")
require("land.animations")
require("land.gestures")

-- fallback
hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = 1,
})
hl.monitor({
  output = "eDP-1",
  mode = "preferred",
  position = "0x0",
  scale = 1,
})
require("land.monitors")

hl.config({
  input = {
    touchpad = {
      natural_scroll = false,
    },
    kb_layout = "us",
    kb_variant = "",
    kb_model = "",
    kb_options = "",
    kb_rules = "",
    follow_mouse = 1,
    sensitivity = 0,
  },
  general = {
    gaps_in = 2,
    gaps_out = 8,
    border_size = 2,
    col = {
      active_border = { colors = { "rgba(98c379ee)", "rgba(56b6c2ee)" }, angle = 30 },
      inactive_border = "rgba(282c34ee)",
    },
    layout = "dwindle",
  },
  group = {
    groupbar = {
      font_size = 11,
      text_color = "rgba(abb2bfee)",
      col = {
        active = "rgba(98c379ee)",
        inactive = "rgba(282c34ee)",
      },
    },
    col = {
      border_active = { colors = { "rgba(c678ddee)", "rgba(98c379ee)" }, angle = 30 },
      border_inactive = "rgba(282c34ee)",
    },
  },
  decoration = {
    blur = {
      enabled = false,
    },
    rounding = 1,
  },
  misc = {
    disable_hyprland_logo = true,
  },
  debug = {
    disable_logs = false,
  },
  dwindle = {
    preserve_split = true,
    force_split = 2, -- always split to the right (new = right or bottom)
  },
})

-- https://flameshot.org/docs/guide/wayland-help/#multi-display-issue
hl.window_rule({
  name             = "flameshot-multi-display-fix",
  match            = { class = "flameshot" },
  animation        = "fade",
  rounding         = 0,
  border_size      = 0,
  float            = true,
  fullscreen_state = "0 0",
  pin              = true,
  --monitor          = "dp-1",
  move             = "0 0",
  size             = { "(monitor_w * 2)", "(monitor_h)" },
})
