return {
	{
		"folke/snacks.nvim",
		lazy = false, -- Load at startup
		priority = 1000, -- Load early
		opts = {
			-- Enable the snacks (features) you want:
			dashboard = { enable = true }, -- New dashboard
			notify = { enable = true }, -- Notification system
			indent = { enable = true }, -- Indent guides
			bigfile = { enable = true }, -- Big file handling
			-- Add more snacks as needed, see docs for full list
		},
	},
}
