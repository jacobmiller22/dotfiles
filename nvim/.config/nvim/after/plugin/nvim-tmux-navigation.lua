local navigator = require("nvim-tmux-navigation")

navigator.setup({})

vim.keymap.set({ "n", "v" }, "<C-h>", navigator.NvimTmuxNavigateLeft)
vim.keymap.set({ "n", "v" }, "<C-j>", navigator.NvimTmuxNavigateDown)
vim.keymap.set({ "n", "v" }, "<C-k>", navigator.NvimTmuxNavigateUp)
vim.keymap.set({ "n", "v" }, "<C-l>", navigator.NvimTmuxNavigateRight)
vim.keymap.set({ "n", "v" }, "<C-/>", navigator.NvimTmuxNavigateLastActive)
