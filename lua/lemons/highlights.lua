local M = {}

---@param c lemons.Colors
local function get_highlights(c)
    local cfg = vim.g.lemons_config or {}
    local bg = cfg.transparent and "NONE" or c.black
    return {
        Normal = { fg = c.white, bg = bg },
        NormalFloat = { link = "Normal" },
        FloatBorder = { bg = bg, fg = c.navy },
        ColorColumn = { bg = c.dark_gray },
        Conceal = { fg = c.darker_white },
        CurSearch = { bg = c.yellow, fg = c.black },
        Cursor = { bg = c.white, fg = c.black },
        CursorColumn = { bg = c.dark_gray },
        CursorLine = { bg = c.dark_gray },
        Directory = { fg = c.orange },
        DiffAdd = { bg = c.dark_green, fg = c.green },
        DiffChange = { bg = c.gray },
        DiffDelete = { bg = c.gray, fg = c.red },
        DiffText = { bg = c.dark_cyan, fg = c.cyan },
        NonText = { fg = c.light_gray },
        TermCursor = { fg = c.black, bg = c.yellow },
        ErrorMsg = { link = "DiagnosticError" },
        WarningMsg = { link = "DiagnosticWarn" },
        WinSeparator = { fg = c.gray },
        Folded = { bg = c.dark_cyan, fg = c.cyan },
        SignColumn = { fg = c.light_gray },
        LineNr = { fg = c.light_gray },
        CursorLineNr = { fg = c.yellow, bold = true },
        MatchParen = { bg = c.gray, bold = true },
        Search = { bg = c.dark_yellow, fg = c.yellow },
        ModeMsg = { fg = c.blue },
        MoreMsg = { fg = c.yellow },
        Title = { fg = c.yellow, bold = true },
        Pmenu = { bg = c.dark_gray, fg = c.white },
        PmenuSel = { fg = c.black, bg = c.br_yellow },
        PmenuExtra = { fg = c.darker_white },
        PmenuSbar = { bg = c.gray },
        PmenuThumb = { bg = c.dark_white },
        PmenuMatch = { fg = c.purered, bold = true },
        PmenuMatchSel = { bold = true, sp = c.black },
        Question = { fg = c.yellow },
        QuickFixLine = { bold = true, fg = c.yellow },
        qfFileName = { fg = c.white },
        qfLineNr = { fg = c.darker_white },
        SpecialKey = { bg = c.dark_cyan, fg = c.cyan },
        SpellBad = { undercurl = true, sp = c.red },
        SpellCap = { undercurl = true, sp = c.yellow },
        SpellLocal = { undercurl = true, sp = c.green },
        SpellRare = { undercurl = true, sp = c.cyan },
        StatusLine = { bg = c.gray, fg = c.white },
        StatusLineNC = { bg = c.dark_gray, fg = c.darker_white },
        Tabline = { bg = c.gray, fg = c.darker_white },
        TablineFill = { bg = c.gray },
        TablineSel = { bg = c.black, fg = c.white, bold = true },
        Visual = { bg = c.gray },
        WinBar = { link = "StatusLine" },
        WinBarNC = { link = "StatusLineNC" },

        Comment = { fg = c.darker_white, italic = true },
        Function = { fg = c.yellow },
        String = { fg = c.green },
        Identifier = { fg = c.white },
        -- StorageClass = { fg = c.white, bold = true },
        Type = { fg = c.lime, bold = true },
        Constant = { fg = c.pink },
        Boolean = { link = "Number" },
        Character = { link = "Constant" },
        Number = { link = "Constant" },
        -- Exception = { fg = c.red },
        Label = { fg = c.dark_white },
        Operator = { fg = c.red },
        Special = { fg = c.light_cyan },
        Delimiter = { fg = c.light_white },
        Statement = { link = "Keyword" },
        Keyword = { fg = c.orange },
        Structure = { fg = c.white },
        Todo = { fg = c.cyan },
        PreProc = { fg = c.dark_white },

        Error = { fg = c.black, bg = c.red },
        Added = { fg = c.green },
        Removed = { fg = c.red },
        Changed = { fg = c.blue },

        -- Diagnostics
        DiagnosticError = { fg = c.red, bold = true },
        DiagnosticWarn = { fg = c.yellow, bold = true },
        DiagnosticInfo = { fg = c.blue, bold = true },
        DiagnosticHint = { fg = c.cyan, bold = true },
        DiagnosticOk = { fg = c.green, bold = true },
        DiagnosticVirtualTextError = { fg = c.red, bold = true },
        DiagnosticVirtualTextWarn = { fg = c.yellow, bold = true },
        DiagnosticVirtualTextInfo = { fg = c.blue, bold = true },
        DiagnosticVirtualTextHint = { fg = c.cyan, bold = true },
        DiagnosticVirtualTextOk = { fg = c.green, bold = true },
        DiagnosticUnderlineError = opts.undercurl and { undercurl = true, sp = c.red }
            or { underline = true, sp = c.red },
        DiagnosticUnderlineWarn = opts.undercurl and { undercurl = true, sp = c.yellow }
            or { underline = true, sp = c.yellow },
        DiagnosticUnderlineInfo = opts.undercurl and { undercurl = true, sp = c.blue }
            or { underline = true, sp = c.blue },
        DiagnosticUnderlineHint = opts.undercurl and { undercurl = true, sp = c.cyan }
            or { underline = true, sp = c.cyan },
        DiagnosticUnderlineOk = opts.undercurl and { undercurl = true, sp = c.green }
            or { underline = true, sp = c.green },
        DiagnosticDeprecated = { strikethrough = true, fg = c.darker_white },
        DiagnosticUnused = { link = "Comment", undercurl = true },
        DiagnosticSignError = { fg = c.red, bold = true },
        DiagnosticSignWarn = { fg = c.yellow, bold = true },
        DiagnosticSignInfo = { fg = c.blue, bold = true },
        DiagnosticSignHint = { fg = c.cyan, bold = true },
        DiagnosticSignOk = { fg = c.green, bold = true },

        -- LSP
        LspCodeLens = { fg = c.light_gray },
        LspCodeLensSeparator = { fg = c.light_gray },
        LspInlayHint = { fg = c.light_gray },
        LspReferenceText = { bg = c.gray },
        LspReferenceRead = { link = "LspReferenceText" },
        LspReferenceWrite = { link = "LspReferenceText" },
        LspSignatureActiveParameter = { bg = c.gray, bold = true },

        -- Man
        manReference = { fg = c.blue },

        -- Treesitter
        ["@attribute"] = { fg = c.purple },
        ["@variable"] = { fg = c.white },
        ["@variable.parameter"] = { fg = c.light_pink },
        ["@keyword.directive"] = { link = "PreProc" },
        ["@keyword.modifier"] = { fg = c.light_blue, italic = true, bold = true },
        ["@keyword.import"] = { fg = c.light_cyan, bold = true },
        ["@keyword.export"] = { fg = c.light_cyan, bold = true },
        ["@keyword.return"] = { fg = c.light_yellow, bold = true, italic = true },
        ["@type.builtin"] = { fg = c.cyan, bold = true },
        ["@attribute.builtin"] = { fg = c.cyan },
        ["@function.builtin"] = { fg = c.cyan },
        ["@variable.builtin"] = { fg = c.cranberry },
        ["@variable.parameter.builtin"] = { fg = c.cyan },
        ["@constant.builtin"] = { fg = c.cyan },
        ["@module.builtin"] = { fg = c.dark_pink, italic = true },
        ["@module"] = { fg = c.dark_pink, italic = true },
        ["@tag.builtin"] = { fg = c.cyan },
        ["@tag.attribute"] = { fg = c.light_cyan, italic = true },
        ["@tag.tsx"] = { fg = c.cyan, bold = true },
        ["@tag.jsx"] = { fg = c.cyan, bold = true },
        ["@constructor"] = { fg = c.lime },
        ["@markup.heading.1"] = { fg = c.yellow, bold = true },
        ["@markup.heading.2"] = { fg = c.orange, bold = true },
        ["@markup.heading.3"] = { fg = c.red, bold = true },
        ["@markup.heading.4"] = { fg = c.pink },
        ["@markup.heading.5"] = { fg = c.blue },
        ["@markup.heading.6"] = { fg = c.green },
        ["@markup.link"] = { underline = false },
        ["@markup.link.vimdoc"] = { underline = true },
        ["@markup.link.label"] = { underline = true },
        ["@markup.link.url"] = { fg = c.blue },
        ["@markup.strikethrough"] = { strikethrough = true, fg = c.dark_white },
        ["@markup.quote"] = { fg = c.dark_white },
        ["@comment.error"] = { fg = c.red },
        ["@comment.warning"] = { fg = c.yellow },
        ["@comment.todo"] = { link = "Todo" },
        ["@comment.note"] = { fg = c.blue },

        -- LSP semantic tokens
        ["@lsp.type.formatSpecifier"] = { link = "Special" },
        ["@lsp.type.escapeSequence"] = { link = "@string.escape" },
        ["@lsp.mod.callable"] = { link = "Function" },
        ["@lsp.type.interface"] = { fg = c.brown, bold = true, italic = true },
        ["@lsp.type.namespace"] = { link = "@module" },
        ["@lsp.type.enum"] = { fg = c.aqua, bold = true },
        ["@lsp.type.enumMember"] = { fg = c.br_green, bold = true },
        ["@lsp.type.modifier"] = { link = "@keyword.modifier" },
        ["@lsp.typemod.class.defaultLibrary"] = { fg = c.tomato },
        ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
        ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
        --- PLUGINS ---
        -- blink.cmp
        BlinkCmpMenu = { link = "NormalFloat" },
        BlinkCmpMenuBorder = { link = "FloatBorder" },
        BlinkCmpDocBorder = { link = "FloatBorder" },
        BlinkCmpSignatureHelpBorder = { link = "FloatBorder" },
        BlinkCmpLabelMatch = { link = "PmenuMatch" },
        BlinkCmpMenuSelection = { link = "PmenuSel" },
        BlinkCmpScrollBarThumb = { link = "PmenuThumb" },
        BlinkCmpScrollBarGutter = { link = "PmenuSbar" },
        BlinkCmpKind = { link = "NormalFloat" },
        BlinkCmpKindFolder = { fg = c.orange },
        BlinkCmpKindFile = { fg = c.light_blue },
        BlinkCmpKindText = { fg = c.darker_white },
        BlinkCmpKindMethod = { fg = c.yellow },
        BlinkCmpKindFunction = { fg = c.yellow },
        BlinkCmpKindField = { fg = c.blue },
        BlinkCmpKindVariable = { fg = c.red },
        BlinkCmpKindProperty = { fg = c.light_cyan },
        BlinkCmpKindClass = { fg = c.lime },
        BlinkCmpKindStruct = { fg = c.lime },
        BlinkCmpKindEnum = { fg = c.aqua },
        BlinkCmpKindInterface = { fg = c.brown },
        BlinkCmpKindModule = { fg = c.light_purple },
        BlinkCmpKindPackage = { fg = c.orange },
        BlinkCmpKindNameSpace = { fg = c.light_purple },
        BlinkCmpKindObject = { fg = c.blue },
        BlinkCmpKindValue = { fg = c.pink },
        BlinkCmpKindNumber = { fg = c.orange },
        BlinkCmpKindConstant = { fg = c.pink },
        BlinkCmpKindEnumMember = { fg = c.pink },
        BlinkCmpKindNull = { fg = c.white },
        BlinkCmpKindSnippet = { fg = c.pink },
        BlinkCmpKindColor = { fg = c.red },
        BlinkCmpKindKeyword = { fg = c.orange },
        BlinkCmpKindString = { fg = c.green },
        BlinkCmpKindTypeParameter = { fg = c.lime },
        BlinkCmpKindEvent = { fg = c.yellow },
        BlinkCmpKindOperator = { fg = c.red },
        BlinkCmpKindReference = { fg = c.light_cyan },

        -- lazy.nvim
        LazyButtonActive = { bg = c.gray, bold = true },
        LazyReasonEvent = { fg = c.yellow },
        LazyReasonFt = { fg = c.cyan },
        LazyReasonImport = { fg = c.green },

        -- leap.nvim
        LeapBackdrop = { fg = c.darker_white },

        -- mini.icons
        MiniIconsAzure = { fg = c.light_cyan },
        MiniIconsBlue = { fg = c.blue },
        MiniIconsCyan = { fg = c.cyan },
        MiniIconsGreen = { fg = c.green },
        MiniIconsgray = { fg = c.dark_white },
        MiniIconsOrange = { fg = c.orange },
        MiniIconsPurple = { fg = c.pink },
        MiniIconsRed = { fg = c.red },
        MiniIconsYellow = { fg = c.yellow },

        -- treesitter-context
        TreesitterContextBottom = { underline = true, sp = c.light_gray },
        TreesitterContextLineNumber = { fg = c.darker_white },

        -- vim-illuminate
        IlluminatedWordText = { link = "LspReferenceText" },
        IlluminatedWordRead = { link = "LspReferenceRead" },
        IlluminatedWordWrite = { link = "LspReferenceWrite" },

        -- oil.nvim
        OilHidden = { fg = c.darker_white },
        OilLink = { fg = c.cyan },
        OilCreate = { fg = c.green },
        OilMove = { fg = c.blue },
        OilCopy = { fg = c.cyan },
        OilChange = { fg = c.yellow },
        OilRestore = { fg = c.green },
        OilPurge = { link = "Error" },

        -- lualine.nvim
        LuaLineDiffAdd = { link = "Added" },
        LuaLineDiffDelete = { link = "Removed" },
        LuaLineDiffChange = { link = "Changed" },

        -- snacks.nvim
        SnacksPickerMatch = { fg = c.purered, bold = true },

        SnacksIndentChunkRed = { link = "RainbowDelimiterRed" },
        SnacksIndentChunkOrange = { link = "RainbowDelimiterOrange" },
        SnacksIndentChunkYellow = { link = "RainbowDelimiterYellow" },
        SnacksIndentChunkGreen = { link = "RainbowDelimiterGreen" },
        SnacksIndentChunkCyan = { link = "RainbowDelimiterCyan" },
        SnacksIndentChunkBlue = { link = "RainbowDelimiterBlue" },
        SnacksIndentChunkViolet = { link = "RainbowDelimiterViolet" },
        SnacksIndentRed = { link = "RainbowDelimiterRed" },
        SnacksIndentOrange = { link = "RainbowDelimiterOrange" },
        SnacksIndentYellow = { link = "RainbowDelimiterYellow" },
        SnacksIndentGreen = { link = "RainbowDelimiterGreen" },
        SnacksIndentCyan = { link = "RainbowDelimiterCyan" },
        SnacksIndentBlue = { link = "RainbowDelimiterBlue" },
        SnacksIndentViolet = { link = "RainbowDelimiterViolet" },
        SnacksIndentScopeRed = { link = "RainbowDelimiterRed" },
        SnacksIndentScopeOrange = { link = "RainbowDelimiterOrange" },
        SnacksIndentScopeYellow = { link = "RainbowDelimiterYellow" },
        SnacksIndentScopeGreen = { link = "RainbowDelimiterGreen" },
        SnacksIndentScopeCyan = { link = "RainbowDelimiterCyan" },
        SnacksIndentScopeBlue = { link = "RainbowDelimiterBlue" },
        SnacksIndentScopeViolet = { link = "RainbowDelimiterViolet" },
    }
end

---@param c lemons.Colors
function M.set_terminal_colors(c)
    vim.g.terminal_color_0 = c.black
    vim.g.terminal_color_1 = c.red
    vim.g.terminal_color_2 = c.green
    vim.g.terminal_color_3 = c.yellow
    vim.g.terminal_color_4 = c.blue
    vim.g.terminal_color_5 = c.pink
    vim.g.terminal_color_6 = c.cyan
    vim.g.terminal_color_7 = c.dark_white
    vim.g.terminal_color_8 = c.light_gray
    vim.g.terminal_color_9 = c.red
    vim.g.terminal_color_10 = c.lime
    vim.g.terminal_color_11 = c.orange
    vim.g.terminal_color_12 = c.blue
    vim.g.terminal_color_13 = c.pink
    vim.g.terminal_color_14 = c.light_cyan
    vim.g.terminal_color_15 = c.white
end

local M = {}
---@param colors lemons.Colors
function M.set(colors)
    local cfg = vim.g.lemons_config or {}

    local custom_colors = colors
    if cfg and cfg.override_colors then
        custom_colors = vim.tbl_extend("force", colors, cfg.override_colors(colors) or {})
    end

    local highlights = get_highlights(custom_colors)
    if cfg and cfg.overrides then
        highlights = vim.tbl_extend("force", highlights, cfg.overrides(custom_colors) or {})
    end
    for name, val in pairs(highlights) do
        vim.api.nvim_set_hl(0, name, val)
    end

    set_terminal_colors(custom_colors)
end

return M
