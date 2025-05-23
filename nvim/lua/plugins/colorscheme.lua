return {
    {
        -- my beloved onedark theme
        "navarasu/onedark.nvim",
        -- plugin IS loaded in immediately during startup
        lazy = false,
        -- make sure that other UI elements start with the theme
        priority = 1000,
        -- configuration for the beloved onedark theme
        config = function()
            require("onedark").setup({
                -- select from 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
                style = "darker",
                -- enable transparency
                transparent = true,
                -- allow the theme to have cohesion with terminal theme
                term_colors = true,
                -- allow user to use keymapping to change between variants of the theme
                toggle_style_key = "<leader>oth",
                -- you can add more to the array if you want more variants
                toggle_style_list = { "darker", "light" },
                -- lualine theme configuration
                lualine = { transparent = true },

                -- change the grey colour
                -- NOTE: this is done so that we can see comments better with transparency on!
                colors = {
                    grey = "#7a818e"
                }
            })
            -- apply the theme
            -- require("onedark").load()
        end
    },
    {
        -- in my opinion; the most polished theme
        "folke/tokyonight.nvim",
        -- plugin IS loaded in immediately during startup
        lazy = false,
        -- make sure that other UI elements start with the theme
        priority = 1000,
        -- configuration for 'tokyonight'
        config = function()
            require("tokyonight").setup({
                -- select from 'moon', 'storm', 'night' and 'day'
                style = "night",
                -- disable transparency
                transparent = false,
                -- allow the theme to have cohesion with terminal theme
                terminal_colors = true,
            })
        end,
    },
    {
        -- the most colourless colourful grey theme
        "shaunsingh/nord.nvim",
        config = function()
            -- toggle transparency
            vim.g.nord_disable_background = false
            -- load theme
            -- require("nord").set()
        end
    },
    {
        -- cozy ( I hate this fucking word ) theme
        "ellisonleao/gruvbox.nvim",
        -- plugin IS loaded in immediately during startup
        lazy = false,
        -- make sure that other UI elements start with the theme
        priority = 1000,
        -- configuration for 'gruvbox'
        config = function()
            require("gruvbox").setup({
                -- use terminal colours
                terminal_colors = true,
                -- toggle transparency
                transparent_mode = false,
                -- dim the inactive ( buffer I think )
                dim_inactive = false
            })
        end
    },
    {
        -- a black theme with better colours for highlighting than base16_black_gorgoroth
        "vague2k/vague.nvim",
        -- plugin IS loaded in immediately during startup
        lazy = false,
        -- make sure that other UI elements start with the theme
        priority = 1000,
        -- configuration for 'vague'
        config = function()
            require("vague").setup({
                -- toggle transparency
                transparent = true
            })
        end,
    },
    {
        -- a black theme with blue-ish syntax highlighting
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        -- plugin IS loaded in immediately during startup
        lazy = false,
        -- make sure that other UI elements start with the theme
        priority = 1000,
    },
    {
        -- lovely / better solarize theme by the crafter devaslife
        "craftzdog/solarized-osaka.nvim",
        -- plugin IS loaded in immediately during startup
        lazy = false,
        -- make sure that other UI elements start with the theme
        priority = 1000,
        -- configuration for 'solarized-osaka'
        config = function()
            require("solarized-osaka").setup({
                -- toggle transparency
                transparent = true,
                -- use colours from terminal
                terminal_colors = true,
            })
        end,
    },
    {
        -- cyberdream theme for some cybery-mood
        "scottmckendry/cyberdream.nvim",
        -- plugin IS loaded in immediately during startup
        lazy = false,
        -- make sure that other UI elements start with the theme
        priority = 1000,
        -- configuration for 'cyberdream'
        config = function()
            require("cyberdream").setup({
                -- toggle transparency
                transparent = true,
                italics_comments = true,
                borderless_pickers = false
            })
        end,
    },
    {
        -- eldritch theme for some different cybery-mood
        "eldritch-theme/eldritch.nvim",
        -- plugin IS loaded in immediately during startup
        lazy = false,
        -- make sure that other UI elements start with the theme
        priority = 1000,
        -- configuration for 'cyberdream'
        config = function()
            require("eldritch").setup({
                -- toggle transparency
                transparent = true,
                -- use colours from terminal
                terminal_colors = true,
            })
        end,
    },
}
