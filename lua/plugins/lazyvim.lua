--  ╭────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration │
--  ╰────────────────────────────────────╯

return {

    {
        "folke/tokyonight.nvim",
        enable = true,
        opts = { 
            style = "night",
        },
    },

    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "tokyonight",
        },
    },

    {
        'snacks.nvim',
        opts = {
            bigfile = { enabled = true },
            quickfile = { enabled = true },
        },
    },

    {
        "akinsho/bufferline.nvim",
        enabled = false,
    }
}


