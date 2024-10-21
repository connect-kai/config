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
	{ import = "astrocommunity.pack.tailwindcss" },
	{ import = "astrocommunity.pack.typescript" },
	{ import = "astrocommunity.pack.yaml" },
	{ import = "astrocommunity.pack.markdown" },
	{ import = "astrocommunity.pack.json" },
	{ import = "astrocommunity.pack.dart" },
}
