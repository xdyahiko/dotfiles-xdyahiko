return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false, -- Load at startup
		priority = 1000, -- Load before other plugins
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- or "latte", "frappe", "macchiato"
				transparent_background = true,
				integrations = {
					treesitter = true,
					telescope = true,
					-- add other integrations as needed
				},
			})
			vim.opt.termguicolors = true
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{ "craftzdog/solarized-osaka.nvim", enabled = true }, -- DISABLE solarized-osaka
}
