if vim.loader then
	vim.loader.enable()
end

_G.dd = function(...)
	require("util.debug").dump(...)
end
vim.print = _G.dd

-- Initialize LazyVim plugin manager
require("config.lazy")
