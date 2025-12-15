-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- Lua
        "lua-language-server",
        "stylua",

        -- JavaScript/TypeScript
        -- "typescript-language-server", -- Disabled: using vtsls instead (better performance, works for React/Next/Vue)
        "prettier",
        "js-debug-adapter",

        -- Go
        "gopls",
        "gofumpt",
        "goimports",
        "golangci-lint",
        "delve",

        -- General debuggers
        "debugpy",

        -- Additional tools
        "tree-sitter-cli",

        -- JSON
        "json-lsp",
      },
    },
  },
}
