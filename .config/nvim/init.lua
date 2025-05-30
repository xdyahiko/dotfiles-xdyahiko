if vim.loader then
	vim.loader.enable()
end

_G.dd = function(...)
	require("util.debug").dump(...)
end
vim.print = _G.dd

require("config.lazy")

vim.cmd.colorscheme("catppuccin")

return {
	"zbirenbaum/copilot.lua",
	opts = {
		suggestion = { enabled = false },
		panel = { enabled = false },
	},
}
