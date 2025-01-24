local mapKey = require("utils/keyMapper").mapKey

-- file save
mapKey("<leader>w", ":w<CR>")
mapKey("<leader>q", ":q!<CR>")

-- Neotree toggle
mapKey("<leader>e", ":Neotree toggle<CR>")

-- pane navigation
mapKey("<C-h>", "<C-w>h")
mapKey("<C-j>", "<C-w>j")
mapKey("<C-k>", "<C-w>k")
mapKey("<C-l>", "<C-w>l")

-- clear search hl
mapKey("<leader>h", ":nohlsearch<CR>")

-- indent
mapKey("<", "<gv", "v")
mapKey(">", ">gv", "v")

-- copy
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		if vim.v.event.operator == "y" then
			local start_line = vim.fn.line("'<")
			local end_line = vim.fn.line("'>")
			local start_col = vim.fn.col("'<")
			local end_col = vim.fn.col("'>")

			local lines = vim.fn.getline(start_line, end_line)

			if #lines > 0 then
				-- Handle first line
				if start_col > 1 then
					lines[1] = lines[1]:sub(start_col)
				end

				-- Handle last line
				if end_col < #lines[#lines] then
					lines[#lines] = lines[#lines]:sub(1, end_col)
				end

				local yank_text = table.concat(lines, "\n")
				vim.fn.setreg("+", yank_text)
			end
		end
	end,
})
