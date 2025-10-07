-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.tailwindcss" },

  { import = "astrocommunity.completion.nvim-cmp" },
  { import = "astrocommunity.editing-support.conform-nvim" },

  { import = "astrocommunity.lsp.ts-error-translator-nvim" },
  -- { import = "astrocommunity.recipes.auto-session-restore" }, -- Disabled to show dashboard
  -- { import = "astrocommunity.colorscheme.catppuccin" },
}
