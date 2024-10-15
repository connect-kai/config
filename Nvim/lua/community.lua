---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- theme
  { import = "astrocommunity.colorscheme.everforest" },

  -- custom `everforest`
  {
    "everforest",
    init = function()
      vim.o.background = "light"
      vim.g.everforest_background = "hard"
    end,
  },

  -- language
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.json" },
}
