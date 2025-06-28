local wezterm = require("wezterm")

return {
  font = wezterm.font("JetBrainsMono Nerd Font"),
  font_size = 13.0,
  color_scheme = "Nord",
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = true,
  window_background_opacity = 0.95,
  scrollback_lines = 10000,
  adjust_window_size_when_changing_font_size = false,
  send_composed_key_when_left_alt_is_pressed = true,
  send_composed_key_when_right_alt_is_pressed = true,
  keys = {
    -- Tmux-liknande splits
    {key="d", mods="CMD", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    {key="D", mods="CMD|SHIFT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    {key="w", mods="CMD", action = wezterm.action.CloseCurrentPane { confirm = true },},
  },
  colors = {
    foreground = "#D8DEE9",
    background = "#2E3440",
    cursor_bg = "#D8DEE9",
    cursor_fg = "#2E3440",
    cursor_border = "#D8DEE9",
    selection_fg = "#2E3440",
    selection_bg = "#D8DEE9",
    ansi = {
      "#3B4252", "#BF616A", "#A3BE8C", "#EBCB8B",
      "#81A1C1", "#B48EAD", "#88C0D0", "#E5E9F0",
    },
    brights = {
      "#4C566A", "#BF616A", "#A3BE8C", "#EBCB8B",
      "#81A1C1", "#B48EAD", "#8FBCBB", "#ECEFF4",
    },
  },
}
