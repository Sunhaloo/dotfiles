-- variable that will truncate `vim.opt`
local set = vim.opt

-- == General Neovim Options ==

-- no need to create backup files ==> use auto-save.nvim plugin
set.backup = false
-- make a backup before over-writing a file ( this is good in case of powercuts )
set.writebackup = true -- ==> set to 'on' by default
-- use system clipboard
set.clipboard = "unnamedplus"
-- search query does not need to be case sensitive
set.ignorecase = true
-- disable 'smartcase' to find all the instance of characters in search query
set.smartcase = false
-- fuck the swap file
set.swapfile = false -- --> setting this option to 'off' ==> the 2 options below becomes automatically 'off'
-- controls a lot of things like swap file creation time, plugin-reponsiveness and more
set.updatetime = 200 -- --> default value = 4000 ms
-- controls amount of characters that is in file before creating swap file
set.updatecount = 0 -- --> default value = 200 character counts
-- time in 'ms' to wait for a mapped sequence to be executed
set.timeoutlen = 800
-- disable persisent undo ( undo stops when you close - re-open file )
-- set.undofile = false
-- enable persisent undo ( undo does not stops when you close - re-open file )
set.undofile = true

-- == Coding and Writing Options ==

-- enable line numbers
set.number = true
-- enable relative line numbers ( for easy jumping )
set.relativenumber = true
-- use spaces of a <Tab> character
set.expandtab = true
-- number of spaces for a <Tab> character when writing
set.tabstop = 4
-- number of spaces for a <Tab> character while performing editing
set.softtabstop = 4
-- number of spaces for indentation
set.shiftwidth = 4

-- == Spell Checking ==

-- NOTE: Uncomment the lines of code for "global" spell checking ==> in EVERY file ( coding files included )

-- enable spell checking
-- set.spell = true
-- language for spell checking
set.spelllang = { "en_gb" }

-- == Appearance Options ==

-- change to "rounded" setup
set.winborder = "rounded"
-- enable terminal colours
set.termguicolors = true
-- hide the command line until used ( default = 1 | hidden = 0 ) TESTING '1'
set.cmdheight = 0 -- --> setting this option to 'off' ==> option below becomes automatically 'off'
-- show the "writing" mode ( 'NORMAL', 'INSERT', etc )
set.showmode = false
-- stop highlighting search query on exit search query
set.hlsearch = false
-- completely show the concealed text
set.conceallevel = 0

-- always show tabline
set.showtabline = 2
-- don't show the ruler ( current location in file )
set.ruler = false
-- signcolumn before line number ( column )
set.signcolumn = "auto:1" -- ==> show when needed with max width of '1'
-- avoid all the |hit-enter| prompts caused by file messages ( see help for more INFO )
set.shortmess = "wfiIlnxtToOCF" -- --> default value = "ltToOCF"
-- disable help message in 'Lex'
vim.g.netrw_banner = 1

-- == Coding Appearance Options ==

-- highlight the current line ( horizontally )
set.cursorline = true
-- height for popup menus ( Completions Menus )
set.pumheight = 0 -- --> default value = 0
-- width for popup menus ( Completions Menus )
set.pumwidth = 1000 -- --> default value = 1000
-- transparency for popup menus ( Completions, Help, Command-Line Menus )
set.pumblend = 7 -- --> default value = 0

-- == Neovim Splits Options ==

-- new horizontal split will go below the current split
set.splitbelow = true
-- new vertical split will go the right of current split
set.splitright = true
-- scroll behaviour for splits ( opening / closing, resizing )
set.splitkeep = "topline" -- --> default value = "cursor"
-- to be used with the plugin 'virt-column' ==> display vertical line at column '80'
set.colorcolumn = "80"
