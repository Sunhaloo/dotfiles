-- install and start lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
-- add the variable `lazypath` to our `rtp` ==> runtime path
vim.opt.rtp:prepend(lazypath)

-- set our global and local leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- setup lazy.nvim
require("lazy").setup({
    spec = {
        -- point to the 'plugins' folder ( ~/.config/nvim/lua/plugins/ )
        { import = "plugins" },
    },
    -- automatically check for updates
    checker = {
        enabled = true,
        frequency = 172800
    },
    -- check for changes but don't bother any notifications
    change_detection = {
        enabled = true,
        notify = false
    },
    -- remove unnecessary packages
    performance = {
        -- at run time path
        rtp = {
            -- disable the following plugins
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            }
        }
    },
    -- ui related settings
    ui = {
        border = "rounded"
    }
})

