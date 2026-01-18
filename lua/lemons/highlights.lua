local M = {}

---@param c lemons.Colors
---@param opts lemons.Config
function M.get_highlights(c, opts)
  ---@type table<string, vim.api.keyset.highlight>
  return {
    Normal = { fg = c.white, bg = c.black },
    NormalFloat = { bg = opts.lighter_float and c.dark_gray or c.black, fg = c.white },
    FloatBorder = { bg = opts.lighter_float and c.dark_gray or c.black, fg = c.dark_yellow },
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
    MatchParenCur = { fg = c.match_cur, bg = c.match_bg, bold = true },
    MatchParen = { bg = c.match_bg, bold = true },
    Search = { bg = c.dark_yellow, fg = c.yellow },
    ModeMsg = { fg = c.blue },
    MoreMsg = { fg = c.yellow },
    Title = { fg = c.yellow, bold = true },
    Pmenu = { bg = c.dark_gray, fg = c.white },
    PmenuSel = { fg = c.black, bg = c.yellow },
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
    Visual = { bg = c.gray, bold = true },
    WinBar = { link = "StatusLine" },
    WinBarNC = { link = "StatusLineNC" },

    Function = { fg = c.yellow },
    String = { fg = c.green },
    Identifier = { fg = c.white },
    -- StorageClass = { fg = c.white, bold = true },
    Constant = { fg = c.pink },
    Boolean = { link = "Number" },
    Character = { link = "Constant" },
    Number = { link = "Constant" },
    -- Exception = { fg = c.red },
    Label = { fg = c.dark_white },
    Operator = { fg = c.red },
    Special = { fg = c.light_cyan },
    Delimiter = { fg = c.dark_white },
    Statement = { link = "Keyword" },
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
    DiagnosticUnused = { link = "Comment" },
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
    ["@variable"] = { fg = c.white },
    ["@keyword.directive"] = { link = "PreProc" },
    ["@type.builtin"] = { fg = c.cyan },
    ["@attribute.builtin"] = { fg = c.cyan },
    ["@function.builtin"] = { fg = c.cyan },
    ["@variable.parameter.builtin"] = { fg = c.cyan },
    ["@constant.builtin"] = { fg = c.cyan },
    ["@module.builtin"] = { fg = c.cyan },
    ["@tag.builtin"] = { fg = c.cyan },
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
    BlinkCmpKindFile = { fg = c.white },
    BlinkCmpKindText = { fg = c.dark_white },
    BlinkCmpKindField = { fg = c.blue },
    BlinkCmpKindStruct = { fg = c.lime },
    BlinkCmpKindModule = { fg = c.cyan },
    BlinkCmpKindPackage = { fg = c.orange },
    BlinkCmpKindNameSpace = { fg = c.cyan },
    BlinkCmpKindObject = { fg = c.blue },
    BlinkCmpKindValue = { fg = c.pink },
    BlinkCmpKindNumber = { fg = c.orange },
    BlinkCmpKindNull = { fg = c.white },
    BlinkCmpKindColor = { fg = c.red },
    BlinkCmpKindEvent = { fg = c.yellow },
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
    TreesitterContextBottom = { underline = not opts.lighter_float, sp = c.light_gray },
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


    PmenuExtra = {},
    PmenuSbar = {},
    PmenuThumb = {},
    PmenuMatch = { fg = c.lime, bold = true },
    Type = { fg = c.lime, bold = true },
    Keyword = { fg = c.syn_keyword },
    Comment = { fg = c.ts_comment, italic = true },
    lessClass = { fg = c.light_cyan, bold = false },
    lessProperty = { fg = c.light_cyan, bold = false },

    ["@operator"] = { fg = c.ts_operator, bold = true },
    ["@punctuation.delimiter"] = { fg = c.ts_delimiter },
    ["@variable.parameter"] = { fg = c.syn_parameter },
    ["@variable.builtin"] = { fg = c.syn_builtin },
    ["@property"] = { fg = c.syn_property },

    ["@keyword.import"] = { fg = c.syn_import, bold = true, italic = true },
    ["@keyword.export"] = { link = "@keyword.import" },
    ["@keyword.modifier"] = { fg = c.syn_modifier },

    ["@lsp.type.interface"] = { fg = c.syn_interface, bold = true },
    -- LSP semantic tokens
    ["@lsp.type.builtin"] = { fg = c.cyan },
    ["@lsp.mod.callable"] = { link = "Function" },
    -- lua
    ["@lsp.typemod.function.defaultLibrary.lua"] = { link = "@function.builtin" },
    ["@lsp.type.boolean"] = { link = "@boolean" },
    ["@lsp.type.builtinType"] = { link = "@type.builtin" },
    ["@lsp.type.class"] = { fg = c.lime, bold = true },
    ["@lsp.type.comment"] = { link = "@comment" },
    ["@lsp.type.decorator"] = { link = "@attribute" },
    ["@lsp.type.deriveHelper"] = { link = "@attribute" },
    ["@lsp.type.enum"] = { fg = c.syn_enum, bold = true, italic = false },
    ["@lsp.type.enumMember"] = { fg = c.syn_enum_member, bold = true, italic = false },
    ["@lsp.type.escapeSequence"] = { link = "@string.escape" },
    ["@lsp.type.formatSpecifier"] = { link = "@markup.list" },
    ["@lsp.type.generic"] = { link = "@variable" },
    ["@lsp.type.keyword"] = { link = "@keyword" },
    ["@lsp.type.lifetime"] = { link = "@keyword.storage" },
    ["@lsp.type.namespace"] = { link = "@module" },
    ["@lsp.type.namespace.python"] = { link = "@variable" },
    ["@lsp.type.number"] = { link = "@number" },
    ["@lsp.type.operator"] = { link = "@operator" },
    ["@lsp.type.parameter"] = { link = "@variable.parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
    ["@lsp.type.selfTypeKeyword"] = { link = "@variable.builtin" },
    ["@lsp.type.string"] = { link = "@string" },
    ["@lsp.type.typeAlias"] = { link = "@type.definition" },
    ["@lsp.type.unresolvedReference"] = { undercurl = true, sp = c.red },
    ["@lsp.type.variable"] = {},
    ["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
    ["@lsp.typemod.keyword.injected"] = { link = "@keyword" },
    ["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.operator.injected"] = { link = "@operator" },
    ["@lsp.typemod.string.injected"] = { link = "@string" },
    ["@lsp.typemod.struct.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.type.defaultLibrary"] = { fg = c.lavender },
    ["@lsp.typemod.variable.callable"] = { link = "@function" },
    ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
    ["@lsp.typemod.variable.injected"] = { link = "@variable" },
    ["@lsp.typemod.variable.static"] = { link = "@constant" },

    BlinkPairsMatchParen = { link = "MatchParen" },

    SnacksPickerPrompt = { fg = c.light_cyan, bold = true },
    SnacksPickerMatch = { fg = c.light_cyan, bold = true, reverse = true },
    FzfLuaBorder = { link = "FloatBorder" },
    FzfLuaPreviewNormal = { bg = c.dark_gray },
    FzfLuaPreviewBorder = { bg = c.dark_gray },

    WhichKeyGroup = { fg = c.cyan, bold = true },
    MiniTablineFill = { bg = c.black },
    MiniTablineCurrent = { fg = c.lime, bg = c.black, bold = true },
    MiniTablineVisible = { fg = c.gray, bg = c.black, bold = false },
    MiniTablineHidden = { fg = c.light_gray, bg = c.black },
    MiniTablineModifiedCurrent = { fg = c.yellow, bold = true },
    MiniTablineModifiedVisibale = { fg = c.red, bold = true },
    MiniTablineModifiedHidden = { fg = c.red, bold = true },

    BlinkCmpSource = { fg = c.blink_source, bold = true },
    BlinkCmpKindMethod = { link = "Function" },
    BlinkCmpKindFunction = { link = "Function" },
    BlinkCmpKindVariable = { fg = c.light_cyan },
    BlinkCmpKindProperty = { link = "@property" },
    BlinkCmpKindClass = { link = "@lsp.type.class" },
    BlinkCmpKindEnum = { link = "@lsp.type.enum" },
    BlinkCmpKindInterface = { link = "@lsp.type.interface" },
    BlinkCmpKindConstant = { link = "Constant" },
    BlinkCmpKindEnumMember = { link = "@lsp.type.enumMember" },
    BlinkCmpKindSnippet = { fg = c.lavender },
    BlinkCmpKindKeyword = { link = "Keyword" },
    BlinkCmpKindString = { link = "String" },
    BlinkCmpKindTypeParameter = { link = "@variable.parameter" },
    BlinkCmpKindOperator = { link = "@operator" },

    BlinkPairsRed = { link = "RainbowDelimiterRed" },
    BlinkPairsOrange = { link = "RainbowDelimiterOrange" },
    BlinkPairsYellow = { link = "RainbowDelimiterYellow" },
    BlinkPairsGreen = { link = "RainbowDelimiterGreen" },
    BlinkPairsCyan = { link = "RainbowDelimiterCyan" },
    BlinkPairsBlue = { link = "RainbowDelimiterBlue" },
    BlinkPairsViolet = { link = "RainbowDelimiterViolet" },

    BlinkIndentRed = { link = "RainbowDelimiterRed" },
    BlinkIndentOrange = { link = "RainbowDelimiterOrange" },
    BlinkIndentYellow = { link = "RainbowDelimiterYellow" },
    BlinkIndentGreen = { link = "RainbowDelimiterGreen" },
    BlinkIndentCyan = { link = "RainbowDelimiterCyan" },
    BlinkIndentBlue = { link = "RainbowDelimiterBlue" },
    BlinkIndentViolet = { link = "RainbowDelimiterViolet" },

    BlinkIndentRedUnderline = { link = "RainbowDelimiterRed" },
    BlinkIndentOrangeUnderline = { link = "RainbowDelimiterOrange" },
    BlinkIndentYellowUnderline = { link = "RainbowDelimiterYellow" },
    BlinkIndentGreenUnderline = { link = "RainbowDelimiterGreen" },
    BlinkIndentCyanUnderline = { link = "RainbowDelimiterCyan" },
    BlinkIndentBlueUnderline = { link = "RainbowDelimiterBlue" },
    BlinkIndentVioletUnderline = { link = "RainbowDelimiterViolet" },

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

    SnacksIndentChunkRed = { link = "RainbowDelimiterRed" },
    SnacksIndentChunkOrange = { link = "RainbowDelimiterOrange" },
    SnacksIndentChunkYellow = { link = "RainbowDelimiterYellow" },
    SnacksIndentChunkGreen = { link = "RainbowDelimiterGreen" },
    SnacksIndentChunkCyan = { link = "RainbowDelimiterCyan" },
    SnacksIndentChunkBlue = { link = "RainbowDelimiterBlue" },
    SnacksIndentChunkViolet = { link = "RainbowDelimiterViolet" },
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

return M
