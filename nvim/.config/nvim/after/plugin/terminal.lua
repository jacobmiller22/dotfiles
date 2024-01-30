require("nvterm").setup()

local terminal = require("nvterm.terminal")

vim.keymap.set("n", "<leader>t", function()
	terminal.toggle("float")
end)
