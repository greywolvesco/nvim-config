-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  {
    "marko-cerovac/material.nvim",
    priority = 1000,
    config = function()
      require("material").setup {
        contrast = {
          terminal = false,
          sidebars = false,
          floating_windows = false,
          cursor_line = false,
          non_current_windows = false,
          filetypes = {},
        },
        styles = {
          comments = {},
          strings = {},
          keywords = {},
          functions = {},
          variables = {},
          operators = {},
          types = {},
        },
        plugins = {
          "gitsigns",
          "nvim-cmp",
          "nvim-tree",
          "telescope",
          "which-key",
        },
        disable = {
          colored_cursor = false,
          borders = false,
          background = false,
          term_colors = false,
          eob_lines = false,
        },
        high_visibility = {
          lighter = false,
          darker = false,
        },
        lualine_style = "default",
        async_loading = true,
      }
      vim.g.material_style = "deep ocean"
    end,
  },
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      -- change colorscheme
      colorscheme = "material",
      -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
      -- highlights = {
      --   init = { -- this table overrides highlights in all themes
      --     -- Normal = { bg = "#000000" },
      --   },
      --   astrodark = { -- a table of overrides/changes when applying the astrotheme theme
      --     -- Normal = { bg = "#000000" },
      --   },
      -- },
      -- Icons can be configured throughout the interface
      icons = {
        -- configure the loading of the lsp in the status line
        LSPLoading1 = "⠋",
        LSPLoading2 = "⠙",
        LSPLoading3 = "⠹",
        LSPLoading4 = "⠸",
        LSPLoading5 = "⠼",
        LSPLoading6 = "⠴",
        LSPLoading7 = "⠦",
        LSPLoading8 = "⠧",
        LSPLoading9 = "⠇",
        LSPLoading10 = "⠏",
      },
    },
  },
}
