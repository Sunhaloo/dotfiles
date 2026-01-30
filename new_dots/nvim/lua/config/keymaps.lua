local custom_opts = { noremap = true, silent = true }

vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit Insert Mode" })
vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select All" })

vim.keymap.set("n", "sh", "<cmd>split<cr>", { desc = "Horizontal Split ( Same File )" })
vim.keymap.set("n", "sv", "<cmd>vsplit<cr>", { desc = "Vertical Split ( Same File )" })
vim.keymap.set("n", "<leader>sh", "<cmd>new<cr>", { desc = "Horizontal Split" })
vim.keymap.set("n", "<leader>sv", "<cmd>vnew<cr>", { desc = "Vertical Split" })

vim.keymap.set("n", "te", "<cmd>tabnew<cr>", { desc = "New Tab" })
vim.keymap.set("n", "<tab>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
vim.keymap.set("n", "<s-tab>", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

vim.keymap.set("n", "+", "<C-a>", { desc = "Increment Number" })
vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement Number" })

vim.keymap.set("n", "<leader>tr", ":s/", { desc = "Replace One Occurrences" })
vim.keymap.set("n", "<leader>tR", ":%s/", { desc = "Replace All Occurrences" })

vim.keymap.set("i", "<C-h>", "<Left>", custom_opts)
vim.keymap.set("i", "<C-l>", "<Right>", custom_opts)
vim.keymap.set("i", "<C-j>", "<Down>", custom_opts)
vim.keymap.set("i", "<C-k>", "<Up>", custom_opts)
