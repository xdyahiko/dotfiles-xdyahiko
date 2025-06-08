local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Diagnostics
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<leader>r", function()
	require("craftzdog.hsl").replaceHexWithHSL()
end)

keymap.set("n", "<leader>i", function()
	require("craftzdog.lsp").toggleInlayHints()
end)

vim.api.nvim_create_user_command("ToggleAutoformat", function()
	require("craftzdog.lsp").toggleAutoformat()
end, {})

-- For Cpp , C, Python compiling

vim.keymap.set("n", "<a-q>", function()
	local filetype = vim.bo.filetype
	local filedir = vim.fn.expand("%:p:h")
	local filename = vim.fn.expand("%:t")
	local basename = vim.fn.expand("%:t:r")
	local height = math.floor(vim.o.lines / 4)

	if filetype == "c" then
		vim.cmd(
			"split | resize "
				.. height
				.. ' | terminal bash -c "cd '
				.. vim.fn.shellescape(filedir)
				.. " && gcc "
				.. vim.fn.shellescape(filename)
				.. " -o "
				.. vim.fn.shellescape(basename)
				.. " && ./"
				.. vim.fn.shellescape(basename)
				.. '"'
		)
	elseif filetype == "cpp" then
		vim.cmd(
			"split | resize "
				.. height
				.. ' | terminal bash -c "cd '
				.. vim.fn.shellescape(filedir)
				.. " && g++ "
				.. vim.fn.shellescape(filename)
				.. " -o "
				.. vim.fn.shellescape(basename)
				.. " && ./"
				.. vim.fn.shellescape(basename)
				.. '"'
		)
	elseif filetype == "python" then
		vim.cmd(
			"split | resize "
				.. height
				.. ' | terminal bash -c "cd '
				.. vim.fn.shellescape(filedir)
				.. " && python3 "
				.. vim.fn.shellescape(filename)
				.. '"'
		)
	elseif filetype == "java" then
		vim.cmd(
			"split | resize "
				.. height
				.. ' | terminal bash -c "cd '
				.. vim.fn.shellescape(filedir)
				.. " && javac "
				.. vim.fn.shellescape(filename)
				.. " && java "
				.. vim.fn.shellescape(basename)
				.. '"'
		)
	else
		print("not a c, c++, python, or java file!")
	end
end, { noremap = true, silent = true })
