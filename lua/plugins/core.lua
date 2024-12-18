--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯

return {

    {
        "akinsho/bufferline.nvim",
        enabled = false,
    },

    {
        "folke/tokyonight.nvim",
        enable = false,
        opts = { 
            style = "night",
        },
    },

    {
      "catppuccin/nvim",
        name = "catppuccin",
        opts = {
            transparent_backgroud = true,
            flavour = "mocha",
            integration = {
                copilot = true,
                blink = true,
            }
        }
    },

    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin",
            news = {
                neovim = true,
            }
        }
    },

    {
        'snacks.nvim',
        opts = {
            bigfile = { enabled = true },
            quickfile = { enabled = true },
        },
    },

    {
        "echasnovski/mini.files",
        opts = {
            windows = {
                width_preview = 90 
            },
            options = {
                use_as_default_explorer = true
            }
        }
    }
}


