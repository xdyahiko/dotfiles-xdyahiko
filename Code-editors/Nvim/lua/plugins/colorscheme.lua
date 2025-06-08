return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false, -- Load at startup
		priority = 1000, -- Load before other plugins
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = true,
				integrations = {
					treesitter = true,
					telescope = true,
					-- Add other integrations as needed
				},
			})
			vim.opt.termguicolors = true
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	-- { "craftzdog/solarized-osaka.nvim", enabled = false }, -- Changed to FALSE to disable
}
