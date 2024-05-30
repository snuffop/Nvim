-- snippets

local ls = require("luasnip")
local snip = ls.snippet
local text = ls.text_node
local ins = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

vim.keymap.set({ "i", "s" }, "<A-j>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<A-h>", function()
  if ls.expand_or_jumpable(-1) then
    ls.expand_or_jump(-1)
  end
end, { silent = true })

ls.add_snippets("lua", {
  snip("hello", {
    text('print("Hello '),
    ins(1),
    text(' world")'),
  }),
})

ls.add_snippets("markdown", {
  snip(
    "sysops",
    fmt(
      [[
      [SYSOPS-{}](https://jira-joyent.atlassian.net/browse/SYSOPS-{})
    ]],
      {
        ins(1),
        rep(1),
      }
    )
  ),
})

ls.add_snippets("markdown", {
  snip(
    "devops",
    fmt(
      [[
      [DEVOPS-{}](https://jira-joyent.atlassian.net/browse/DEVOPS-{})
    ]],
      {
        ins(1),
        rep(1),
      }
    )
  ),
})

ls.add_snippets("markdown", {
  snip(
    "jira",
    fmt(
      [[
      [{}](https://jira-joyent.atlassian.net/browse/{})
    ]],
      {
        ins(1),
        rep(1),
      }
    )
  ),
})

-- NEORG
ls.add_snippets("norg", {
  snip(
    "jira",
    fmt(
      [[
      {{https://jira-joyent.atlassian.net/browse/{}}}[{}]
    ]],
      {
        ins(1),
        rep(1),
      }
    )
  ),
})

ls.add_snippets("norg", {
  snip(
    "sysops",
    fmt(
      [[
      {{https://jira-joyent.atlassian.net/browse/SYSOPS-{}}}[SYSOPS-{}]
    ]],
      {
        ins(1),
        rep(1),
      }
    )
  ),
})

ls.add_snippets("norg", {
  snip(
    "devops",
    fmt(
      [[
      {{https://jira-joyent.atlassian.net/browse/DEVOPS-{}}}[DEVOPS-{}]
    ]],
      {
        ins(1),
        rep(1),
      }
    )
  ),
})
