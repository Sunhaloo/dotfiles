-- our auto-command file

-- << Comments >>
-- auto-command that will be activated on 'INSERT' mode
vim.api.nvim_create_autocmd("InsertEnter", {
    -- auto-command group that will not be duplicated ( etc... )
    group = vim.api.nvim_create_augroup("Stop Comments", { clear = true }),
    -- see `h formatoptions` ==> disable comments on new line / caret return
    command = [[set formatoptions-=cro]]
})

-- << Spell Checking >>
-- auto-command that will be activated on "starting" Neovim
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    -- auto-command group that will not be duplicated ( etc... )
    group = vim.api.nvim_create_augroup("File Based Spell Checking", { clear = true }),
    -- set the "filetype" of to enable spell checking
    pattern = { "*.txt" , "*.md" },
    -- create a callback function
    callback = function()
        -- set the "vim" options for spell checking
        vim.opt_local.spell = true
        vim.opt_local.spelllang = "en_gb"
    end,
})

-- << Coloured Yanking >>
-- auto-command that will be activated after "yanking" character / text or text-object
vim.api.nvim_create_autocmd("TextYankPost", {
    -- auto-command group that will not be duplicated ( etc... )
    group = vim.api.nvim_create_augroup("Coloured Yank Highlight", { clear = true }),
    -- create a callback function
    callback = function()
        -- set a custom colour for the highlight
        vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#e55561" , fg = "#55E5D9" })
        -- set the actual highlight colours on "yanking"
        vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 100 })
    end,
})

-- << Plugins >>

-- screenkey
-- auto-command that will be activated upon these events ( see code )
vim.api.nvim_create_autocmd(
    {
        -- Buffer-related events
        "BufReadPre",  -- Before buffer is read
        "BufRead",     -- When buffer is read
        "BufEnter",    -- When entering a buffer

        -- Window-related events
        "WinNew",      -- When a new window is created
        "WinEnter",    -- When entering a window

        -- Tab-related events
        "TabNew",      -- When a new tab is created
        "TabEnter",    -- When entering a tab

        -- Terminal-related events
        "TermOpen",    -- When a terminal is opened
        "TermEnter",   -- When entering a terminal
        "TermClose",   -- When a terminal is closed

        -- Command-line events (for Telescope prompts)
        "CmdlineEnter",    -- When entering a command line mode (e.g., when using Telescope)
        "CmdlineLeave",    -- When leaving a command line mode
    },
    -- {
    --     -- our events
    --     "BufReadPre",
    --     "BufRead",
    --     "BufEnter",
    --     "WinNew",
    --     "WinEnter",
    --     "TabNew",
    --     "TabEnter",
    --     "TermOpen",
    --     "TermEnter",
    --     "TermClose",
    -- },
    {
        -- auto-command group that will not be duplicated ( etc... )
        group = vim.api.nvim_create_augroup("Start ScreenKey", { clear = true }),
        -- create a callback function
        callback = function()
            -- run the command
            vim.cmd("Screenkey")
        end
    }
)