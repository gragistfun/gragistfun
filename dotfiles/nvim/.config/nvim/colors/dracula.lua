-- Dracula Colorscheme 
-- Documentation: draculatheme.com
-- Adopted from github.com/Mofiqul/dracula.nvim

local colors = {
  bg = "#282A36",
  fg = "#F8F8F2",
  selection = "#44475A",
  comment = "#6272A4",
  red = "#FF5555",
  orange = "#FFB86C",
  yellow = "#F1FA8C",
  green = "#50fa7b",
  purple = "#BD93F9",
  cyan = "#8BE9FD",
  pink = "#FF79C6",
  bright_red = "#FF6E6E",
  bright_green = "#69FF94",
  bright_yellow = "#FFFFA5",
  bright_blue = "#D6ACFF",
  bright_magenta = "#FF92DF",
  bright_cyan = "#A4FFFF",
  bright_white = "#FFFFFF",
  menu = "#21222C",
  visual = "#3E4452",
  gutter_fg = "#4B5263",
  nontext = "#3B4048",
  white = "#ABB2BF",
  black = "#191A21",
}

local groups = {
  Normal = { fg = colors.fg, bg = colors.bg, },
  NormalFloat = { fg = colors.fg, bg = colors.bg, },
  Comment = { fg = colors.comment, italic = true, },
  Constant = { fg = colors.yellow, },
  String = { fg = colors.yellow, },
  Character = { fg = colors.green, },
  Number = { fg = colors.orange, },
  Boolean = { fg = colors.cyan, },
  Float = { fg = colors.orange, },
  FloatBorder = { fg = colors.white, },
  Operator = { fg = colors.purple, },
  Keyword = { fg = colors.cyan, },
  Keywords = { fg = colors.cyan, },
  Identifier = { fg = colors.cyan, },
  Function = { fg = colors.yellow, },
  Statement = { fg = colors.purple, },
  Conditional = { fg = colors.pink, },
  Repeat = { fg = colors.pink, },
  Label = { fg = colors.cyan, },
  Exception = { fg = colors.purple, },
  PreProc = { fg = colors.yellow, },
  Include = { fg = colors.purple, },
  Define = { fg = colors.purple, },
  Title = { fg = colors.cyan, },
  Macro = { fg = colors.purple, },
  PreCondit = { fg = colors.cyan, },
  Type = { fg = colors.cyan, },
  StorageClass = { fg = colors.pink, },
  Structure = { fg = colors.yellow, },
  TypeDef = { fg = colors.yellow, },
  Special = { fg = colors.green, italic = true },
  SpecialComment = { fg = colors.comment, italic = true, },
  Error = { fg = colors.bright_red, },
  Todo = { fg = colors.purple, bold = true, italic = true, },
  Underlined = { fg = colors.cyan, underline = true, },

  Cursor = { reverse = true, },
  CursorLineNr = { fg = colors.fg, bold = true, },

  SignColumn = { bg = colors.bg, },

  Conceal = { fg = colors.comment, },
  CursorColumn = { bg = colors.black, },
  CursorLine = { bg = colors.selection, },
  ColorColumn = { bg = colors.selection, },

  StatusLine = { fg = colors.white, bg = colors.black, },
  StatusLineNC = { fg = colors.comment, },
  StatusLineTerm = { fg = colors.white, bg = colors.black, },
  StatusLineTermNC = { fg = colors.comment, },

  Directory = { fg = colors.cyan, },
  DiffAdd = { fg = colors.bg, bg = colors.green, },
  DiffChange = { fg = colors.orange, },
  DiffDelete = { fg = colors.red, },
  DiffText = { fg = colors.comment, },

  ErrorMsg = { fg = colors.bright_red, },
  VertSplit = { fg = colors.black, },
  Folded = { fg = colors.comment, },
  FoldColumn = {},
  Search = { fg = colors.black, bg = colors.orange, },
  IncSearch = { fg = colors.orange, bg = colors.comment, },
  LineNr = { fg = colors.comment, },
  MatchParen = { fg = colors.fg, underline = true, },
  NonText = { fg = colors.nontext, },
  Pmenu = { fg = colors.white, bg = colors.menu, },
  PmenuSel = { fg = colors.white, bg = colors.selection, },
  PmenuSbar = { bg = colors.bg, },
  PmenuThumb = { bg = colors.selection, },

  Question = { fg = colors.purple, },
  QuickFixLine = { fg = colors.black, bg = colors.yellow, },
  SpecialKey = { fg = colors.nontext, },

  SpellBad = { underline = true, },
  -- SpellCap = { fg = colors.yellow, },
  -- SpellLocal = { fg = colors.yellow, },
  -- SpellRare = { fg = colors.yellow, },

  TabLine = { fg = colors.comment, },
  TabLineSel = { fg = colors.white, },
  TabLineFill = { bg = colors.bg, },
  Terminal = { fg = colors.white, bg = colors.black, },
  Visual = { bg = colors.visual, },
  VisualNOS = { fg = colors.visual, },
  WarningMsg = { fg = colors.yellow, },
  WildMenu = { fg = colors.black, bg = colors.white, },

  -- TreeSitter
  ['@error'] = { fg = colors.bright_red, },
  ['@punctuation.delimiter'] = { fg = colors.fg, },
  ['@punctuation.bracket'] = { fg = colors.fg, },
  ['@punctuation.special'] = { fg = colors.cyan, },

  ['@constant'] = { fg = colors.purple, },
  ['@constant.builtin'] = { fg = colors.purple, },
  ['@symbol'] = { fg = colors.purple, },

  ['@constant.macro'] = { fg = colors.cyan, },
  ['@string.regex'] = { fg = colors.red, },
  ['@string'] = { fg = colors.yellow, },
  ['@string.escape'] = { fg = colors.cyan, },
  ['@character'] = { fg = colors.green, },
  ['@number'] = { fg = colors.purple, },
  ['@boolean'] = { fg = colors.purple, },
  ['@float'] = { fg = colors.green, },
  ['@annotation'] = { fg = colors.yellow, },
  ['@attribute'] = { fg = colors.cyan, },
  ['@namespace'] = { fg = colors.orange, },

  ['@function.builtin'] = { fg = colors.cyan, },
  ['@function'] = { fg = colors.green, },
  ['@function.macro'] = { fg = colors.green, },
  ['@parameter'] = { fg = colors.orange, },
  ['@parameter.reference'] = { fg = colors.orange, },
  ['@method'] = { fg = colors.green, },
  ['@field'] = { fg = colors.orange, },
  ['@property'] = { fg = colors.purple, },
  ['@constructor'] = { fg = colors.cyan, },

  ['@conditional'] = { fg = colors.pink, },
  ['@repeat'] = { fg = colors.pink, },
  ['@label'] = { fg = colors.cyan, },

  ['@keyword'] = { fg = colors.pink, },
  ['@keyword.function'] = { fg = colors.cyan, },
  ['@keyword.operator'] = { fg = colors.pink, },
  ['@operator'] = { fg = colors.pink, },
  ['@exception'] = { fg = colors.purple, },
  ['@type'] = { fg = colors.bright_cyan, },
  ['@type.builtin'] = { fg = colors.cyan, italic = true, },
  ['@type.qualifier'] = { fg = colors.pink, },
  ['@structure'] = { fg = colors.purple, },
  ['@include'] = { fg = colors.pink, },

  ['@variable'] = { fg = colors.fg, },
  ['@variable.builtin'] = { fg = colors.purple, },

  ['@text'] = { fg = colors.orange, },
  ['@text.strong'] = { fg = colors.orange, bold = true, }, -- bold
  ['@text.emphasis'] = { fg = colors.yellow, italic = true, }, -- italic
  ['@text.underline'] = { fg = colors.orange, },
  ['@text.title'] = { fg = colors.pink, bold = true, }, -- title
  ['@text.literal'] = { fg = colors.yellow, }, -- inline code
  ['@text.uri'] = { fg = colors.yellow, italic = true, }, -- urls
  ['@text.reference'] = { fg = colors.orange, bold = true, },

  ['@tag'] = { fg = colors.cyan, },
  ['@tag.attribute'] = { fg = colors.green, },
  ['@tag.delimiter'] = { fg = colors.cyan, },

  -- Semantic 
  ['@class'] = { fg = colors.cyan },
  ['@struct'] = { fg = colors.cyan },
  ['@enum'] = { fg = colors.cyan },
  ['@enumMember'] = { fg = colors.purple },
  ['@event'] = { fg = colors.cyan },
  ['@interface'] = { fg = colors.cyan },
  ['@modifier'] = { fg = colors.cyan },
  ['@regexp'] = { fg = colors.yellow },
  ['@typeParameter'] = { fg = colors.cyan },
  ['@decorator'] = { fg = colors.cyan },

  -- HTML
  htmlArg = { fg = colors.green, },
  htmlBold = { fg = colors.yellow, bold = true, },
  htmlEndTag = { fg = colors.cyan, },
  htmlH1 = { fg = colors.pink, },
  htmlH2 = { fg = colors.pink, },
  htmlH3 = { fg = colors.pink, },
  htmlH4 = { fg = colors.pink, },
  htmlH5 = { fg = colors.pink, },
  htmlH6 = { fg = colors.pink, },
  htmlItalic = { fg = colors.purple, italic = true, },
  htmlLink = { fg = colors.purple, underline = true, },
  htmlSpecialChar = { fg = colors.yellow, },
  htmlSpecialTagName = { fg = colors.cyan, },
  htmlTag = { fg = colors.cyan, },
  htmlTagN = { fg = colors.cyan, },
  htmlTagName = { fg = colors.cyan, },
  htmlTitle = { fg = colors.white, },

  -- Markdown
  markdownBlockquote = { fg = colors.yellow, italic = true, },
  markdownBold = { fg = colors.orange, bold = true, },
  markdownCode = { fg = colors.green, },
  markdownCodeBlock = { fg = colors.orange, },
  markdownCodeDelimiter = { fg = colors.red, },
  markdownH1 = { fg = colors.pink, bold = true, },
  markdownH2 = { fg = colors.pink, bold = true, },
  markdownH3 = { fg = colors.pink, bold = true, },
  markdownH4 = { fg = colors.pink, bold = true, },
  markdownH5 = { fg = colors.pink, bold = true, },
  markdownH6 = { fg = colors.pink, bold = true, },
  markdownHeadingDelimiter = { fg = colors.red, },
  markdownHeadingRule = { fg = colors.comment, },
  markdownId = { fg = colors.purple, },
  markdownIdDeclaration = { fg = colors.cyan, },
  markdownIdDelimiter = { fg = colors.purple, },
  markdownItalic = { fg = colors.yellow, italic = true, },
  markdownLinkDelimiter = { fg = colors.purple, },
  markdownLinkText = { fg = colors.pink, },
  markdownListMarker = { fg = colors.cyan, },
  markdownOrderedListMarker = { fg = colors.red, },
  markdownRule = { fg = colors.comment, },

  --  Diff
  diffAdded = { fg = colors.green, },
  diffRemoved = { fg = colors.red, },
  diffFileId = { fg = colors.yellow, bold = true, reverse = true, },
  diffFile = { fg = colors.nontext, },
  diffNewFile = { fg = colors.green, },
  diffOldFile = { fg = colors.red, },

  debugPc = { bg = colors.cyan, },
  debugBreakpoint = { fg = colors.red, reverse = true, },

  -- Git Signs
  GitSignsAdd = { fg = colors.bright_green, },
  GitSignsChange = { fg = colors.cyan, },
  GitSignsDelete = { fg = colors.bright_red, },
  GitSignsAddLn = { fg = colors.black, bg = colors.bright_green, },
  GitSignsChangeLn = { fg = colors.black, bg = colors.cyan, },
  GitSignsDeleteLn = { fg = colors.black, bg = colors.bright_red, },
  GitSignsCurrentLineBlame = { fg = colors.white, },

  -- Telescope
  TelescopePromptBorder = { fg = colors.comment, },
  TelescopeResultsBorder = { fg = colors.comment, },
  TelescopePreviewBorder = { fg = colors.comment, },
  TelescopeSelection = { fg = colors.white, bg = colors.selection, },
  TelescopeMultiSelection = { fg = colors.purple, bg = colors.selection, },
  TelescopeNormal = { fg = colors.fg, bg = colors.bg, },
  TelescopeMatching = { fg = colors.green, },
  TelescopePromptPrefix = { fg = colors.purple, },

  -- NvimTree
  NvimTreeNormal = { fg = colors.fg, bg = colors.menu, },
  NvimTreeVertSplit = { fg = colors.bg, bg = colors.bg, },
  NvimTreeRootFolder = { fg = colors.fg, bold = true, },
  NvimTreeGitDirty = { fg = colors.yellow, },
  NvimTreeGitNew = { fg = colors.bright_green, },
  NvimTreeImageFile = { fg = colors.pink, },
  NvimTreeFolderIcon = { fg = colors.purple, },
  NvimTreeIndentMarker = { fg = colors.nontext, },
  NvimTreeEmptyFolderName = { fg = colors.comment, },
  NvimTreeFolderName = { fg = colors.fg, },
  NvimTreeSpecialFile = { fg = colors.pink, underline = true, },
  NvimTreeOpenedFolderName = { fg = colors.fg, },
  NvimTreeCursorLine = { bg = colors.selection, },
  NvimTreeIn = { bg = colors.selection, },

  -- LSP
  DiagnosticError = { fg = colors.red, },
  DiagnosticWarn = { fg = colors.yellow, },
  DiagnosticInfo = { fg = colors.cyan, },
  DiagnosticHint = { fg = colors.cyan, },
  DiagnosticUnderlineError = { undercurl = true, sp = colors.red, },
  DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow, },
  DiagnosticUnderlineInfo = { undercurl = true, sp = colors.cyan, },
  DiagnosticUnderlineHint = { undercurl = true, sp = colors.cyan, },
  DiagnosticSignError = { fg = colors.red, },
  DiagnosticSignWarn = { fg = colors.yellow, },
  DiagnosticSignInfo = { fg = colors.cyan, },
  DiagnosticSignHint = { fg = colors.cyan, },
  DiagnosticFloatingError = { fg = colors.red, },
  DiagnosticFloatingWarn = { fg = colors.yellow, },
  DiagnosticFloatingInfo = { fg = colors.cyan, },
  DiagnosticFloatingHint = { fg = colors.cyan, },
  DiagnosticVirtualTextError = { fg = colors.red, },
  DiagnosticVirtualTextWarn = { fg = colors.yellow, },
  DiagnosticVirtualTextInfo = { fg = colors.cyan, },
  DiagnosticVirtualTextHint = { fg = colors.cyan, },

  LspDiagnosticsDefaultError = { fg = colors.red, },
  LspDiagnosticsDefaultWarning = { fg = colors.yellow, },
  LspDiagnosticsDefaultInformation = { fg = colors.cyan, },
  LspDiagnosticsDefaultHint = { fg = colors.cyan, },
  LspDiagnosticsUnderlineError = { fg = colors.red, undercurl = true, },
  LspDiagnosticsUnderlineWarning = { fg = colors.yellow, undercurl = true, },
  LspDiagnosticsUnderlineInformation = { fg = colors.cyan, undercurl = true, },
  LspDiagnosticsUnderlineHint = { fg = colors.cyan, undercurl = true, },
  LspReferenceText = { fg = colors.orange, },
  LspReferenceRead = { fg = colors.orange, },
  LspReferenceWrite = { fg = colors.orange, },
  LspCodeLens = { fg = colors.cyan, },

  --LSP Saga
  LspFloatWinNormal = { fg = colors.fg, },
  LspFloatWinBorder = { fg = colors.comment, },
  LspSagaHoverBorder = { fg = colors.comment, },
  LspSagaSignatureHelpBorder = { fg = colors.comment, },
  LspSagaCodeActionBorder = { fg = colors.comment, },
  LspSagaDefPreviewBorder = { fg = colors.comment, },
  LspLinesDiagBorder = { fg = colors.comment, },
  LspSagaRenameBorder = { fg = colors.comment, },
  LspSagaBorderTitle = { fg = colors.menu, },
  LSPSagaDiagnosticTruncateLine = { fg = colors.comment, },
  LspSagaDiagnosticBorder = { fg = colors.comment, },
  LspSagaShTruncateLine = { fg = colors.comment, },
  LspSagaDocTruncateLine = { fg = colors.comment, },
  LspSagaLspFinderBorder = { fg = colors.comment, },

  -- IndentBlankLine
  IndentBlanklineContextChar = { fg = colors.bright_red, nocombine = true, },

  -- Cmp
  CmpItemKind = { link = "Pmenu" },
  CmpItemAbbr = { link = "Pmenu" },
  CmpItemKindMethod = { link = "@method" },
  CmpItemKindText = { link = "@text" },
  CmpItemKindFunction = { link = "@function" },
  CmpItemKindConstructor = { link = "@type" },
  CmpItemKindVariable = { link = "@variable" },
  CmpItemKindClass = { link = "@type" },
  CmpItemKindInterface = { link = "@type" },
  CmpItemKindModule = { link = "@namespace" },
  CmpItemKindProperty = { link = "@property" },
  CmpItemKindOperator = { link = "@operator" },
  CmpItemKindReference = { link = "@parameter.reference" },
  CmpItemKindUnit = { link = "@field" },
  CmpItemKindValue = { link = "@field" },
  CmpItemKindField = { link = "@field" },
  CmpItemKindEnum = { link = "@field" },
  CmpItemKindKeyword = { link = "@keyword" },
  CmpItemKindSnippet = { link = "@text" },
  CmpItemKindColor = { link = "DevIconCss" },
  CmpItemKindFile = { link = "TSURI" },
  CmpItemKindFolder = { link = "TSURI" },
  CmpItemKindEvent = { link = "@constant" },
  CmpItemKindEnumMember = { link = "@field" },
  CmpItemKindConstant = { link = "@constant" },
  CmpItemKindStruct = { link = "@structure" },
  CmpItemKindTypeParameter = { link = "@parameter" },
}

local function highlight(def)
  for name, v in pairs(def) do
    vim.api.nvim_set_hl(0, name, v)
  end
end

local function main()
  vim.cmd.highlight('clear')
  vim.cmd.syntax('reset')
  vim.g.colors_name = 'dracula'

  highlight(groups)
end

main()

