vim.opt.clipboard = "unnamedplus"

vim.keymap.set({"n", "v"}, "<C-v>", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set("i", "<C-v>", "<C-r>+", { desc = "Paste from clipboard" })
vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copy to clipboard" })
