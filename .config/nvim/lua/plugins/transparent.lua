return {
    "xiyaowong/transparent.nvim",
    config = function()
        require("transparent").setup({ -- Optional, you don't have to run setup.
            groups = {                 -- table: default groups
                'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
                'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
                'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
                'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
                'EndOfBuffer',
            },
            extra_groups = {
                "NeoTreeCursorLine",
                "NeoTreeDimText",
                "NeoTreeDirectoryIcon",
                "NeoTreeDirectoryName",
                "NeoTreeDotfile",
                "NeoTreeFileIcon",
                "NeoTreeFileName",
                "NeoTreeFileNameOpene",
                "NeoTreeFilterTerm",
                "NeoTreeFloatBorder",
                "NeoTreeFloatTitle",
                "NeoTreeTitleBar",
                "NeoTreeGitAdded",
                "NeoTreeGitConflict",
                "NeoTreeGitDeleted",
                "NeoTreeGitIgnored",
                "NeoTreeGitModified",
                "NeoTreeGitUnstaged",
                "NeoTreeGitUntracke",
                "NeoTreeGitStaged",
                "NeoTreeHiddenByName",
                "NeoTreeIndentMarker",
                "NeoTreeExpander",
                "NeoTreeNormal",
                "NeoTreeNormalNC",
                "NeoTreeSignColumn",
                "NeoTreeStatusLine",
                "NeoTreeStatusLineNC",
                "NeoTreeVertSplit",
                "NeoTreeWinSeparator",
                "NeoTreeEndOfBuffer",
                "NeoTreeRootName",
                "NeoTreeSymbolicLinkTarget",
                "NeoTreeTitleBar",
                "NeoTreeWindowsHidden",
                "FloatBorder",
                "TelescopeNormal",
                "TelescopeBorder",
                "TelescopePromptBorder",
                "SagaBorder",
                "SagaNormal",
                "winblend",
                "pumblend",
                "blend",
                "MasonNormal"

            },                   -- table: additional groups that should be cleared
            exclude_groups = {}, -- table: groups you don't want to clear
        })
        require('transparent').clear_prefix('BufferLine')
        -- require('transparent').clear_prefix('NeoTree')
    end
}
