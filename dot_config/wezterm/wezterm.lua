-- Managed by chezmoi. Dimidium palette + D2Coding Nerd Font baseline.
local wezterm = require 'wezterm'
local config = wezterm.config_builder and wezterm.config_builder() or {}

config.color_schemes = {
  ['Dimidium'] = {
    foreground = '#BAB7B6',
    background = '#141414',
    cursor_bg = '#BAB7B6',
    cursor_fg = '#141414',
    cursor_border = '#BAB7B6',
    selection_fg = '#141414',
    selection_bg = '#8DB8E5',
    scrollbar_thumb = '#817E7E',
    split = '#817E7E',
    ansi = {
      '#000000', -- black
      '#CF494C', -- red
      '#60B442', -- green
      '#DB9C11', -- yellow
      '#0575D8', -- blue
      '#AF5ED2', -- magenta
      '#1DB6BB', -- cyan
      '#BAB7B6', -- white
    },
    brights = {
      '#817E7E', -- bright black
      '#FF643B', -- bright red
      '#37E57B', -- bright green
      '#FCCD1A', -- bright yellow
      '#688DFD', -- bright blue
      '#ED6FE9', -- bright magenta
      '#32E0FB', -- bright cyan
      '#DEE3E4', -- bright white
    },
    indexed = { [16] = '#5286DD' },
  },
}

config.color_scheme = 'Dimidium'
config.font = wezterm.font_with_fallback({
  'D2CodingLigature Nerd Font',
  'D2Coding Nerd Font',
  'D2Coding',
  'Noto Sans Mono CJK KR',
})
config.font_size = 12.0
config.line_height = 1.05

config.window_background_opacity = 1.0
config.window_padding = { left = 8, right = 8, top = 6, bottom = 6 }
config.audible_bell = 'Disabled'
config.check_for_updates = false
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.adjust_window_size_when_changing_font_size = false

config.keys = {
  { key = 'Enter', mods = 'ALT', action = wezterm.action.ToggleFullScreen },
  { key = 't', mods = 'CTRL|SHIFT', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
  { key = 'w', mods = 'CTRL|SHIFT', action = wezterm.action.CloseCurrentTab { confirm = true } },
}

return config
