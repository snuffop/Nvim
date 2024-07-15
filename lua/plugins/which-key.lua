return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = { spelling = true },
    spec = {
      mode = { "n", "v" },
      ["g"] = { name = "+goto" },
      ["gs"] = { name = "+surround" },
      ["z"] = { name = "+fold" },
      ["]"] = { name = "+next" },
      ["["] = { name = "+prev" },
      ["<leader><tab>"] = { name = "+tabs" },
      ["<leader>b"] = { name = "+buffer" },
      ["<leader>c"] = { name = "+code" },
      ["<leader>ct"] = { name = "+Test" },
      ["<leader>f"] = { name = "+file/find" },
      ["<leader>fm"] = { name = "+Managers" },
      ["<leader>g"] = { name = "+git" },
      ["<leader>gb"] = { name = "+blame" },
      ["<leader>gh"] = { name = "+hunks" },
      ["<leader>n"] = { name = "+Neorg" },
      ["<leader>nj"] = { name = "Journal" },
      ["<leader>nm"] = { name = "Module" },
      ["<leader>no"] = { name = "+Obsidian" },
      ["<leader>nt"] = { name = "Telescope" },
      ["<leader>nw"] = { name = "Workspace" },
      ["<leader>nx"] = { name = "Tool" },
      ["<leader>o"] = { name = "+Open" },
      ["<leader>om"] = { name = "+Open My" },
      ["<leader>p"] = { name = "+Projects" },
      ["<leader>q"] = { name = "+quit/session" },
      ["<leader>s"] = { name = "+search" },
      ["<leader>t"] = { name = "+Text/Toggle" },
      ["<leader>u"] = { name = "+ui" },
      ["<leader>w"] = { name = "+windows" },
      ["<leader>x"] = { name = "+diagnostics/quickfix" },
    },
  },
}
