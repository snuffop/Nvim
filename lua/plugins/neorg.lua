return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  priority = 100,
  opts = {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.manoeuvre"] = {},
      ["core.export"] = {},
      ["core.export.markdown"] = {},
      ["core.keybinds"] = {
        config = {
          default_keybinds = true,
        }
      },
      ["core.integrations.telescope"] = {},

      ["core.completion"] = {
        config = {
          engine = "nvim-cmp"
        }
      },
      ["core.journal"] = {
        config = {
          workspace = 'default',
        }
      },
      ["core.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            default = "~/Nextcloud/Neorg",
            joyent = "~/Nextcloud/Neorg/Joyent"
          },
          default_workspace = "default",
        },
      },
    },
  },
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-neorg/neorg-telescope", dependencies = { "nvim-telescope/telescope.nvim" } },
    "nvim-treesitter/nvim-treesitter",
  },
}