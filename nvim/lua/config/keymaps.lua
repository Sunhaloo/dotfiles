-- variable that will truncate `vim.keymap`
local key = vim.keymap

-- variable that will hold options for `noremap` and `silent`
-- `noremap = true` ==> no recursion for the mapping.
-- `silent = true` ==> no need to show "keys" when pressing keys in status line
local opts = { noremap = true, silent = true }

-- leader keys ( global and local )
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NOTE: using `<Cmd>` means that you need to use `<CR>

-- == Reload and Package Management ==

-- reload the current file
key.set("n", "<leader>R", "<Cmd>source %<CR>", { desc = "Reload Neovim" })
-- open 'lazy' "start" window
key.set("n", "<leader>L", "<Cmd>Lazy<CR>", { desc = "Lazy Plugin Manager" })

-- == Quality of Life ==

-- remap <Esc> to <jk>
key.set("i", "jk", "<ESC>", opts, { desc = "Exit Insert Mode" })
-- select all within file
key.set("n", "<C-a>", "gg<S-v>G", { desc = "Select All" })
-- copy to system clipboard
key.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy TO System Clipboard" })
-- paste from system clipboard
key.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste FROM System Clipboard" })
-- search and replace one occurrence of that word
key.set("n", "<leader>sh", ":s/", { desc = "Search + Replace ( One )" })
-- search and replace all occurrences of that word
key.set("n", "<leader>sH", ":%s/", { desc = "Search + Replace ( All )" })
-- increment number
key.set("n", "+", "<C-a>", { desc = "Increment Number" })
-- decrement number
key.set("n", "-", "<C-x>", { desc = "Decrement Number" })

-- my weird fucking keymappings ( My QOL Improvement )
key.set("i", "<C-h>", "<Left>", opts)
key.set("i", "<C-l>", "<Right>", opts)
key.set("i", "<C-j>", "<Down>", opts)
key.set("i", "<C-k>", "<Up>", opts)

-- == Coding / Writing ==

-- move lines / blocks of text up / down
key.set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts, { desc = "Move Lines / Blocks of Text Up" })
key.set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts, { desc = "Move Lines / Blocks of Text Down" })
-- paste even when in visual mode
key.set("v", "p", '"_dP', opts, { desc = "Paste in Visual Mode" })
-- stay in visual ( indent ) mode when indenting lines / block of text
key.set("v", "<", "<gv", opts, { desc = "Stay in Visual Mode ( Indent In )" })
key.set("v", ">", ">gv", opts, { desc = "Stay in Visual Mode ( Indent Out )" })

-- == Tabs - Buffers - Splits ==

-- create a new tab
key.set("n", "te", "<Cmd>tabnew<CR>", { desc = "Open New Tab" })
-- switch to next tab
key.set("n", "<Tab>", "<Cmd>tabnext<CR>", { desc = "Switch to Next Tab" })
-- switch to previous tab
key.set("n", "<S-Tab>", "<Cmd>tabprev<CR>", { desc = "Switch to Previous Tab" })
-- close tab without saving
key.set("n", "<leader>Q", "<Cmd>q!<CR>", { desc = "Close Tab Without Saving" })
-- save and close tab
key.set("n", "<leader>q", "<Cmd>wq<CR>", { desc = "Save and Close Tab" })

-- split window horizontally with same buffer
key.set("n", "ss", "<Cmd>split<CR>", opts, { desc = "Create Horizontal Split ( Same Buffer )" })
-- split window vertically with same buffer
key.set("n", "sv", "<Cmd>vsplit<CR>", opts, { desc = "Create Vertical Split ( Same Buffer )" })

-- split window horizontally with new buffer
key.set("n", "<leader>ss", "<Cmd>new<CR>", opts, { desc = "Create Horizontal Split ( New Buffer )" })
-- split window vertically with new buffer
key.set("n", "<leader>sv", "<Cmd>vnew<CR>", opts, { desc = "Create Vertical Split ( Same Buffer )" })

-- == Plugins Related ==

-- snacks.nvim terminal keymappings
-- key.set("n", "<c-_>", ":lua Snacks.terminal.toggle()<CR>", opts, { desc = "Toggle Terminal [ Snacks ]" })
key.set("t", "<c-_>", "<Cmd>close<CR>", opts, { desc = "Close Window ( Terminal ) [ Snacks ]" })
-- key.set("n", "<leader>ff", ":lua Snacks.picker.files()<CR>", opts, { desc = "Close Window ( Terminal ) [ Snacks ]" })
