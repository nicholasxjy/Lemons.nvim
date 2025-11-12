---@module "lemons"
local M = {}
local config = require("lemons.config")
local hi = require("lemons.highlights")

---@param opts? lemons.Config
function M.setup(opts)
    M.options = config.setup(opts)
end

local default_opts = {
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

    M.options = M.options or config.defaults
    local colors = require("lemons.colors").override(M.options.colors_override)

    local hls = hi.get_highlights(colors, M.options)

    for key, hl in pairs(hls) do
        vim.api.nvim_set_hl(0, key, hl)
    end

    if M.options.terminal_colors then
        hi.set_terminal_colors(colors)
    end
end

---@class ThemeOptions
---@field transparent boolean?
---@field overrides fun(colors: lemons.Colors):table<string, any>?
---@field override_colors fun(colors: lemons.Colors):table<string, any>?
---@param opts ThemeOptions?
function M.setup(opts)
    vim.g.lemons_config = vim.tbl_extend("force", vim.g.lemons_config or {}, default_opts)
    vim.g.lemons_config = vim.tbl_extend("force", vim.g.lemons_config or {}, opts or {})
end

M.colorscheme = M.load

return M
