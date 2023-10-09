local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- ANSIBLE
    {
        "pearofducks/ansible-vim",
        -- "mfussenegger/nvim-ansible",
    },

    -- Better Escapej
    {
        "max397574/better-escape.nvim",
    },

    -- Buffer Line
    {
        "akinsho/bufferline.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
    },

    -- Cursor Line
    {
        "yamatsum/nvim-cursorline",
    },

    -- Calendar
    {
        "mattn/calendar-vim",
    },

    -- Chronos
    { "adrianvalenz/chronos.nvim" },

    -- Comment Box
    {
        "LudoPinelli/comment-box.nvim",
    },

    -- Colorscheme
    {
        "mofiqul/dracula.nvim",
    },

    -- Catppuccin
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },

    -- Chezmoi
    {
        "alker0/chezmoi.vim"
    },


    -- Colorizer.lua
    {
        "norcalli/nvim-colorizer.lua",
    },

    -- Distant
    {
        'chipsenkbeil/distant.nvim',
        branch = 'v0.3',
        config = function()
            require('distant'):setup()
        end
    },

    -- Dash Board
    {
        "goolord/alpha-nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
    },

    -- Emmet
    {
        "mattn/emmet-vim",
    },

    -- Formatting,
    {
        "jose-elias-alvarez/null-ls.nvim",
    },

    -- Harpoon
    {
        "theprimeagen/harpoon",
    },

    -- HOP
    {
        'smoka7/hop.nvim',
        version = "*",
        opts = {},
    },

    -- GitSign Plugins
    {
        "lewis6991/gitsigns.nvim",
    },

    -- Git-Worktree
    {
        "ThePrimeagen/git-worktree.nvim",
    },

    -- Indent Line
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },

    -- Hard Time
    {
        "m4xshen/hardtime.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim"
        },
    },

    -- Neorg 
    {
        "nvim-neorg/neorg",
        build = ":Neorg wync-parsers",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-neorg/neorg-telescope",
            "max397574/neorg-contexts",
            "max397574/neorg-kanban",
        },
    },

    -- Noice
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    },

    -- Rainbows CSV
    {
        "mechatroner/rainbow_csv",
    },

    -- nvim-ts-autotag
    {
        "windwp/nvim-ts-autotag",
    },

    -- Nvim treesitter rainbow brackets
    {
        "hiphish/rainbow-delimiters.nvim",
    },

    -- NeoGit
    {
        "NeogitOrg/neogit",
        cmd = "Neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
            "ibhagwan/fzf-lua",
        },
    },

    -- vim-mergetool
    {
        'samoshkin/vim-mergetool',
    },

    -- NeoVIMTree
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        cmd = {
            "NvimTreeOpen",
            "NvimTreeToggle",
            "NvimTreeFocus",
            "NvimTreeFileFile",
            "NvimTreeCollapse",
        },
    },

    -- Leap AVY
    -- {
    --     "ggandor/leap.nvim",
    -- },

    -- Org mode
    {
        "nvim-orgmode/orgmode",
        ft = "org",
    },

    -- OIL
    {
        "stevearc/oil.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

    -- Taskwiki
    {
        "tools-life/taskwiki",
        init = function()
            vim.g.taskwiki_markup_syntax = "markdown"
        end,
    },

    -- Telescope
    { "nvim-telescope/telescope.nvim",
        -- tag = "0.1.1",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "LinArcX/telescope-env.nvim",
            "ghassan0/telescope-glyph.nvim",
            "keyvchan/telescope-find-pickers.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-telescope/telescope-media-files.nvim",
            "benfowler/telescope-luasnip.nvim",
            "jvgrootveld/telescope-zoxide",
            "tsakirist/telescope-lazy.nvim",
            "nvim-telescope/telescope-project.nvim",
            "elpiloto/telescope-vimwiki.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },
    },

    -- Terminal
    {
        "akinsho/toggleterm.nvim",
    },

    -- Tmux Navigation
    {
        "christoomey/vim-tmux-navigator",
    },

    -- Transparency
    {
        "xiyaowong/transparent.nvim",
    },

    -- treesj
    {
        "Wansmer/treesj",
        cmd = { 
            "TSJToggle",
            "TSJSplit",
            "TSJJoin"
        },
        opts = {
            use_default_keymaps = false
        },
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "bufWinEnter",
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
    },

    -- Treesitter Text objects
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = {
            "nvim-treesitter/nvim-treesitter"
        },
    },


    -- Lua Line
    {
        "nvim-lualine/lualine.nvim",
    },

    -- WhichKey
    {
        "folke/which-key.nvim",
    },

    -- Auto Completion
    {
        "hrsh7th/nvim-cmp",
    },   -- cmp Completion plugin
    {
        "hrsh7th/cmp-buffer",
    }, -- buffer completion
    {
        "hrsh7th/cmp-path",
    },   -- path completion
    {
        "neovim/nvim-lspconfig",
    },
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "hrsh7th/cmp-cmdline",
    }, -- command line Completion

    {
        "saadparwaiz1/cmp_luasnip",
    },

    -- Snipit Engine
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
        version = "2.*",
        dependencies = {
            "rafamadriz/friendly-snippets",
            "molleweide/LuaSnip-snippets.nvim",
            "gisphm/vim-gitignore",
            "numToStr/Comment.nvim",
        },
    },

    -- Lsp Saga
    {
        "glepnir/lspsaga.nvim",
    },

    -- lspkind for icons with snipits
    {
        "onsails/lspkind.nvim",
    },

    -- Managing Mason
    {
        "williamboman/mason.nvim",
    },
    {
        "williamboman/mason-lspconfig.nvim",
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    {
        "jay-babu/mason-null-ls.nvim",
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = { "mfussenegger/nvim-dap" },
    },

    -- Mini 
    {
        'echasnovski/mini.nvim',
        version = '*',
    },

    { 'echasnovski/mini.surround',
        version = '*',
    },

    { 'echasnovski/mini.comment',
        version = '*',
    },

    {
        'echasnovski/mini.pairs',
        version = '*',
    },
    -- END MINI

    -- Neovim Tagbar
    {
        "preservim/tagbar",
    },

    -- Project
    {
        "ahmedkhalf/project.nvim",
    },

    -- Staruptime
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        init = function() 
            vim.g.startuptime_tries = 10 
        end,
    },

    -- SUDA
    {
        "lambdalisue/suda.vim",
        cmd = {
            "SudaRead",
            "SudaWrite",
        },
    },

    -- Trouble
    {
        "folke/trouble.nvim",
    },

    -- VIM bbye
    {
        "moll/vim-bbye",
    },

    -- vimwiki
    {
        "vimwiki/vimwiki",
        init = function()
            vim.g.vimwiki_list = {
                {
                    path = "~/Nextcloud/Vimwiki",
                    syntax = "markdown",
                    ext = ".md",
                    ignoreFolders = { "node_modules", ".git" },
                },
            }
            vim.g.vimwiki_markdown_link_ext = 1 end,
    },

    {
        "michal-h21/vimwiki-sync",
        init = function() 
            vim.g.vimwiki_sync_branch = "main" 
            vim.g.vimwiki_sync_commit_message = "Auto commit + push. %c"
        end,
    },

    -- Wakatime
    {
        "wakatime/vim-wakatime",
        lazy = false,
    },

    -- Workspace
    {
        "sanathks/workspace.nvim",
        dependencies = {"nvim-telescope/telescope.nvim"},
        config = function()
            require("workspace").setup({
                workspaces = {
                    { name = "Joyent",  path = "~/Source/Joyent/",  keymap = { "<leader>pj" } },
                    { name = "Source", path = "~/Source/", keymap = { "<leader>pS" } },
                },
            })
        end,
    }

    -- ==============================================================
} -- end of plugin line

local opts = {
    checker = {
        enabled = true,
    },
}

require("lazy").setup(plugins, opts)
