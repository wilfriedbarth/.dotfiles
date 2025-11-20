local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- font setup
config.font_size = 18.0
config.font = wezterm.font("FiraCode Nerd Font")
config.font_rules = {
  {
    intensity = "Bold",
    italic = true,
    font = wezterm.font({ family = "Menlo", weight = "Bold", style = "Italic" }),
  },
  {
    intensity = "Normal",
    font = wezterm.font({ family = "Menlo", style = "Italic" }),
  },
}

-- tokyo night
config.colors = {
  foreground = "#c0caf5",
  background = "#24283b",
  cursor_bg = "#c0caf5",
  cursor_fg = "#24283b",
  ansi = {
    '#1d202f',
    "#f7768e",
    "#9ece6a",
    "#e0af68",
    "#7aa2f7",
    "#bb9af7",
    "#7dcfff",
    "#a9b1d6"
  },
  brights = {
    '#414868',
    "#f7768e",
    "#9ece6a",
    "#e0af68",
    "#7aa2f7",
    "#bb9af7",
    "#7dcfff",
    "#c0caf5"
  },
  indexed = {
    [16] = "#ff9e64",
    [17] = "#db4b4b"
  },
  tab_bar = {
    background = "#1f2335",
    active_tab = {
      bg_color = "#24283b",
      fg_color = "#c0caf5",
      intensity = "Bold"
    },
    inactive_tab = {
      bg_color = "#1f2335",
      fg_color = "#565f89",
    },
    new_tab = {
      bg_color = "#1f2335",
      fg_color = "#c0caf5"
    },
    new_tab_hover = {
      bg_color = "#24283b",
      fg_color = "#7aa2f7"
    }
  }
}

-- tab bar
config.use_fancy_tab_bar = true

-- window & scrolling
config.scrollback_lines = 10000
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10
}
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

-- shell
config.default_prog = {"/opt/homebrew/bin/fish", "--login"}

return config
