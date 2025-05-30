return {
	{
		"catppuccin/nvim",
		lazy = true,
		priority = 1000,
		name = "catppuccin",
		opts = {
			transparent_background = true,
			flavour = "mocha", -- or "latte", "frappe", "macchiato"
		},
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin",
		},
	},
}
