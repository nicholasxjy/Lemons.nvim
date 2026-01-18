---@class lemons.Colors
---@field black string              |"#000000"
---@field dark_gray string          |"#161616"
---@field gray string               |"#212121"
---@field light_gray string         |"#565656"
---@field darker_white string       |"#808080"
---@field dark_white string         |"#cacaca"
---@field white string              |"#f0f0f0"
---@field red string                |"#ed505e"
---@field dark_green string         |"#0b1b10"
---@field lime string               |"#2ed592"
---@field green string              |"#2ed563"
---@field dark_yellow string        |"#1d190d"
---@field orange string             |"#fa8a49"
---@field yellow string             |"#f0be42"
---@field blue string               |"#5088ed"
---@field pink string               |"#f45ab4"
---@field dark_cyan string          |"#0c1918"
---@field cyan string               |"#37c3b5"
---@field light_cyan string         |"#6ad8ed"
---@field lavender string           |"#9c5feb"
---@field ts_operator string        |"#4d4a1b"
---@field ts_delimiter string       |"#807c37"
---@field ts_comment string         |"#4d5566"
---@field syn_keyword string        |"#736fdf"
---@field syn_import string         |"#60b5ff"
---@field syn_interface string      |"#b37800"
---@field syn_property string       |"#bcbdf5"
---@field syn_parameter string      |"#fd8a6b"
---@field syn_builtin string        |"#ff8080"
---@field syn_modifier string       |"#6aece1"
---@field syn_enum string           |"#33cccc"
---@field syn_enum_member string    |"#94e97c"
---@field blink_source string       |"#4d4d66"
---@field match_cur string          |"#4fa035"
---@field match_bg string           |"#5a3824"

local M = {}

-- stylua: ignore
---@type lemons.Colors
M.defaults = {
  black           = "#000000",
  dark_gray       = "#161616",
  gray            = "#212121",
  light_gray      = "#565656",
  darker_white    = "#808080",
  dark_white      = "#cacaca",
  white           = "#f0f0f0",
  red             = "#ed505e",
  dark_green      = "#0b1b10",
  lime            = "#2ed592",
  green           = "#2ed563",
  dark_yellow     = "#1d190d",
  orange          = "#fa8a49",
  yellow          = "#f0be42",
  blue            = "#5088ed",
  pink            = "#f45ab4",
  dark_cyan       = "#0c1918",
  cyan            = "#37c3b5",
  light_cyan      = "#6ad8ed",

  lavender        = "#9C5FEB",

  ts_operator     = "#4D4A1B",
  ts_delimiter    = "#807C37",
  ts_comment      = "#4D5566",

  syn_keyword     = "#736FDF",
  syn_import      = "#60B5FF",
  syn_interface   = "#B37800",
  syn_property    = "#BCBDF5",
  syn_parameter   = "#FD8A6B",
  syn_builtin     = "#FF8080",
  syn_modifier    = "#6AECE1",

  syn_enum        = "#33CCCC",
  syn_enum_member = "#94E97C",

  blink_source    = "#4D4D66",

  match_cur       = "#4FA035",
  match_bg        = "#5A3824"
}

M.colors = M.defaults

---@param overrides lemons.ColorsOverride
---@return lemons.Colors
function M.override(overrides)
  M.colors = vim.tbl_extend("force", M.defaults, overrides)
  return M.colors
end

return M
