---@class lemons.Colors
---@field black string
---@field dark_gray string
---@field gray string
---@field light_gray string
---@field darker_white string
---@field dark_white string
---@field white string
---@field red string
---@field dark_green string
---@field lime string
---@field green string
---@field dark_yellow string
---@field orange string
---@field yellow string
---@field blue string
---@field pink string
---@field dark_cyan string
---@field cyan string
---@field light_cyan string
---@field brown string
---@field navy string
---@field aqua string
---@field light_blue string
---@field dark_blue string
---@field purple string
---@field light_purple string
---@field light_yellow string
---@field dark_pink string
---@field br_yellow string
---@field purered string
---@field light_pink string
---@field tomato string
---@field cranberry string
---@field br_green string
-- stylua: ignore
---@type lemons.Colors
M.defaults = {
    black        = "#040404",
    dark_gray    = "#161616",
    gray         = "#212121",
    light_gray   = "#565656",
    darker_white = "#808080",
    dark_white   = "#cacaca",
    white        = "#dacfe4",
    tomato       = "#FF6347",
    red          = "#ed505e",
    cranberry    = "#CD5C5C",
    dark_green   = "#0b1b10",
    br_green     = "#9EC410",
    aqua         = "#0fb9e0",
    lime         = "#2ed592",
    green        = "#2ed563",
    orange       = "#fa8a49",
    dark_yellow  = "#1d190d",
    light_yellow = "#ffbe00",
    yellow       = "#f0be42",
    dark_blue    = "#2782d4",
    blue         = "#5088ed",
    light_blue   = "#7BA1D0",
    dark_pink    = "#B376B3",
    pink         = "#f45ab4",
    light_pink   = "#f19bb6",
    dark_cyan    = "#0c1918",
    cyan         = "#37c3b5",
    light_cyan   = "#6ad8ed",
    brown        = "#99582a",
    navy         = "#3B38A0",
    purple       = "#be9af7",
    light_purple = "#8372Ba",
    br_yellow    = "#E7C547",
    purered      = "#ff0000",
}

M.colors = M.defaults

---@param overrides lemons.ColorsOverride
---@return lemons.Colors
function M.override(overrides)
    M.colors = vim.tbl_extend("force", M.defaults, overrides)
    return M.colors
end

return M
