---@module "lemons"
local M = {}

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

    local colors = vim.tbl_extend("force", require("lemons.colors"), M.options.override_colors or {})

    require("lemons.highlights").set(colors, M.options)
end

---@class ThemeOptions
---@field transparent boolean?
---@field overrides fun(colors: lemons.Colors):table<string, any>?
---@field override_colors lemons.Colors?
---@param opts ThemeOptions?
function M.setup(opts)
    M.options = vim.tbl_deep_extend("force", M.defaults or {}, opts)
end

M.colorscheme = M.load

return M
