-- Completion
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-emoji",
    "jordelver/cmp-jira",
    {
      "garymjr/nvim-snippets",
      opts = {
        friendly_snippets = true,
        global_snippets = { "all", "global" },
      },
      dependencies = { "rafamadriz/friendly-snippets" },
    },
  },

  ---@param opts cmp.ConfigSchema

  opts = function(_, opts)
    -- opts.snippet = {
    --   expand = function(item)
    --     return LazyVim.cmp.expand(item.body)
    --   end,
    -- }
    opts.snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    }
    table.insert(opts.sources, { name = "nvim_lsp" })
    table.insert(opts.sources, { name = "neorg" })
    table.insert(opts.sources, { name = "luasnip" })
    table.insert(opts.sources, { name = "snippets" })
    table.insert(opts.sources, { name = "path" })
    table.insert(opts.sources, { name = "buffer" })
    table.insert(opts.sources, { name = "jira" })
  end,
  keys = {
    {
      "<Tab>",
      function()
        return vim.snippet.active({ direction = 1 }) and "<cmd>lua vim.snippet.jump(1)<cr>" or "<Tab>"
      end,
      expr = true,
      silent = true,
      mode = { "i", "s" },
    },
    {
      "<S-Tab>",
      function()
        return vim.snippet.active({ direction = -1 }) and "<cmd>lua vim.snippet.jump(-1)<cr>" or "<Tab>"
      end,
      expr = true,
      silent = true,
      mode = { "i", "s" },
    },
  },
}
