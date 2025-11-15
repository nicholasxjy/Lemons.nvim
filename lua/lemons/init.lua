---@module "lemons"
local M = {}
local hi = require("lemons.highlights")

M.defaults = {
    transparent = false,
}

function M.load()
    vim.cmd.highlight("clear")
    if vim.fn.exists("syntax_on") then
        vim.cmd.syntax("reset")
    end

    vim.o.termguicolors = true
    vim.o.background = "dark"
    vim.g.colors_name = "lemons"

    local colors = require("lemons.colors").colors
    if M.options and M.options.override_colors ~= nil then
        colors = vim.tbl_extend("force", colors, M.options.override_colors or {})
    end

    local highlights = hi.get_highlights(colors, M.options)
    if M.options and M.options.overrides ~= nil then
        highlights = vim.tbl_extend("force", highlights, M.options.overrides(colors) or {})
    end

    for name, val in pairs(highlights) do
        vim.api.nvim_set_hl(0, name, val)
    end

    hi.set_terminal_colors(colors)
end

---@class ThemeOptions
---@field transparent boolean?
---@field overrides fun(colors: lemons.Colors):table<string, any>?
---@field override_colors lemons.Colors?
---@param opts ThemeOptions?
function M.setup(opts)
    M.options = vim.tbl_deep_extend("force", M.defaults or {}, opts or {})
end

M.colorscheme = M.load

return M
