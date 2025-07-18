local wezterm = require("wezterm")

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local bg = "#81A1C1"
  local fg = "#2E3440"
  if not tab.is_active then
    bg = "#3B4252"
    fg = "#D8DEE9"
  end

  local title = tab.active_pane.title
  local dir = wezterm.basename(tab.active_pane.current_working_dir)

  return {
    { Background = { Color = bg } },
    { Foreground = { Color = fg } },
    { Text = "  " .. dir .. " " },
    { Background = { Color = "#2E3440" } },
    { Foreground = { Color = bg } },
    { Text = "" },
  }
end)

return {
  font = wezterm.font("JetBrainsMono NF"),
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
