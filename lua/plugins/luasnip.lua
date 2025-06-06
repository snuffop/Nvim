-- This allows me to create my custom snippets All you need to do, if using the lazyvim.org distro, is to enable the coding.luasnip LazyExtra and then add this file
-- If you're a dotfiles scavenger, definitely watch this video (you're welcome)
-- https://youtu.be/FmHhonPjvvA?si=8NrcRWu4GGdmTzee

return {
    "L3MON4D3/LuaSnip",
    enabled = true,
    opts = function(_, opts)
        local ls = require("luasnip")

        -- Add prefix ";" to each one of my snippets using the extend_decorator
        -- I use this in combination with blink.cmp. This way I don't have to use
        -- the transform_items function in blink.cmp that removes the ";" at the
        -- beginning of each snippet. I added this because snippets that start with
        -- a symbol like ```bash aren't having their ";" removed
        -- https://github.com/L3MON4D3/LuaSnip/discussions/895
        -- NOTE: THis extend_decorator works great, but I also tried to add the ";"
        -- prefix to all of the snippets loaded from friendly-snippets, but I was
        -- unable to do so, so I still have to use the transform_items in blink.cmp
        local extend_decorator = require("luasnip.util.extend_decorator")
        -- Create trigger transformation function
        local function auto_semicolon(context)
            if type(context) == "string" then
                return { trig = ";" .. context }
            end
            return vim.tbl_extend("keep", { trig = ";" .. context.trig }, context)
        end
        -- Register and apply decorator properly
        extend_decorator.register(ls.s, {
            arg_indx = 1,
            extend = function(original)
                return auto_semicolon(original)
            end,
        })
        local s = extend_decorator.apply(ls.s, {})

        -- local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node
        local f = ls.function_node

        local function clipboard()
            return vim.fn.getreg("+")
        end

        -- #####################################################################
        --                            Markdown
        -- #####################################################################

        -- Helper function to create code block snippets
        local function create_code_block_snippet(lang)
            return s({
                trig = lang,
                name = "Codeblock",
                desc = lang .. " codeblock",
            }, {
                    t({ "```" .. lang, "" }),
                    i(1),
                    t({ "", "```" }),
                })
        end

        -- Define languages for code blocks
        local languages = {
            "txt",
            "lua",
            "sql",
            "go",
            "regex",
            "bash",
            "markdown",
            "markdown_inline",
            "yaml",
            "json",
            "jsonc",
            "cpp",
            "csv",
            "java",
            "javascript",
            "python",
            "dockerfile",
            "html",
            "css",
            "templ",
            "php",
        }

        -- Generate snippets for all languages
        local snippets = {}

        for _, lang in ipairs(languages) do
            table.insert(snippets, create_code_block_snippet(lang))
        end


        table.insert(
            snippets,
            s({
                trig = "linkt",
                name = 'Add this -> [](){:target="_blank"}',
                desc = 'Add this -> [](){:target="_blank"}',
            }, {
                    t("["),
                    i(1),
                    t("]("),
                    i(2),
                    t('){:target="_blank"}'),
                })
        )


        -- Paste clipboard contents in link section, move cursor to ()
        table.insert(
            snippets,
            s({
                trig = "linkc",
                name = "Paste clipboard as .md link",
                desc = "Paste clipboard as .md link",
            }, {
                    t("["),
                    i(1),
                    t("]("),
                    f(clipboard, {}),
                    t(")"),
                })
        )

        -- Paste clipboard contents in link section, move cursor to ()
        table.insert(
            snippets,
            s({
                trig = "linkex",
                name = "Paste clipboard as EXT .md link",
                desc = "Paste clipboard as EXT .md link",
            }, {
                    t("["),
                    i(1),
                    t("]("),
                    f(clipboard, {}),
                    t('){:target="_blank"}'),
                })
        )

        table.insert(
            snippets,
            s({
                trig = "todo",
                name = "Add TODO: item",
                desc = "Add TODO: item",
            }, {
                    t("<!-- TODO: "),
                    i(1),
                    t(" -->"),
                })
        )

        table.insert(
            snippets,
            s({
                trig = "je",
                name = "Journal Entriy + HH:MM ",
                desc = "Add a Journal entry with a + and hour and min",
            }, {
                    t("+ "),
                    t(vim.fn.strftime("%H:%M")),
                    t(" "),
                })
        )
        
        -- table.insert(
        --     snippets,
        --         s({
        --         trig = "SYSOPS",
        --         name = "SYSOPS Jira link",
        --         desc = "Create a Joyent Jira sysops link",
        --     }, 
        --             fmta("[SYSOPS-{}](https://jira-joyent.atlassian.net/browse/SYSOPS={})"), {
        --                 i(1),rep(1),
        --             }
        --         )
        -- )
        -- Inserting "my dotfiles" link
        table.insert(
            snippets,
            s({
                trig = "dotfileslatest",
                name = "Adds -> [my dotfiles](https://github.com/linkarzu/dotfiles-latest)",
                desc = "Add link to https://github.com/linkarzu/dotfiles-latest",
            }, {
                    t("[my dotfiles](https://github.com/linkarzu/dotfiles-latest)"),
                })
        )

        table.insert(
            snippets,
            s({
                trig = "supportme",
                name = "Inserts links (Ko-fi, Twitter, TikTok)",
                desc = "Inserts links (Ko-fi, Twitter, TikTok)",
            }, {
                    t({
                        "Join discord for free -> https://discord.gg/NgqMgwwtMH",
                        "If you want to support me by becoming a YouTube member",
                        "https://www.youtube.com/channel/UCrSIvbFncPSlK6AdwE2QboA/join",
                        "☕ Support me -> https://ko-fi.com/linkarzu",
                        "☑ My Twitter -> https://x.com/link_arzu",
                        "❤‍🔥 My tiktok -> https://www.tiktok.com/@linkarzu",
                        "My dotfiles (remember to star them) -> https://github.com/linkarzu/dotfiles-latest",
                        "A link to my resume -> https://resume.linkarzu.com/",
                    }),
                })
        )

        table.insert(
            snippets,
            s({
                trig = "discord",
                name = "discord support",
                desc = "discord support",
            }, {
                    t({
                        "```txt",
                        "I have a members only discord, it's goal is to troubleshoot stuff related to my videos, and try to help users out",
                        "If you want to join, the link can be found below",
                        "https://www.youtube.com/channel/UCrSIvbFncPSlK6AdwE2QboA/join",
                        "```",
                    }),
                })
        )

        -- Add a snippet for inserting a blogpost article template
        table.insert(
            snippets,
            s({
                trig = "blogposttemplate",
                name = "Insert blog post template",
                desc = "Insert blog post template with frontmatter and sections",
            }, {
                    t({ "---", "title: " }),
                    i(1, ""),
                    t({ "", "description: " }),
                    i(2, ""),
                    t({
                        "",
                        "image:",
                        "  path: ./../../assets/img/imgs/250117-thux-simple-bar-sketchybar.avif",
                        "date: '2025-01-16 06:10:00 +0000'",
                        "categories:",
                        "  - macos",
                        "tags:",
                        "  - macos",
                        "  - tutorial",
                        "  - youtube",
                        "  - video",
                        "---",
                        "## Contents",
                        "",
                        "### Table of contents",
                        "",
                        "<!-- toc -->",
                        "",
                        "<!-- tocstop -->",
                        "",
                        "## YouTube video",
                        "",
                        "{% include embed/youtube.html id='' %}",
                        "",
                        "## Pre-requisites",
                        "",
                        "- List any here",
                        "",
                        "## If you like my content, and want to support me",
                        "",
                        '- If you want to share a tip, you can [donate here](https://ko-fi.com/linkarzu/goal?g=6){:target="_blank"}',
                        "- I recently was laid off, so if you know about any SRE related roles, please let me know",
                        "",
                        "## Discord server",
                        "",
                        "- My discord server is now open to the public, feel free to join and hang out with others",
                        '- join the [discord server in this link](https://discord.gg/NgqMgwwtMH){:target="_blank"}',
                        "",
                        '[![Image](./../../assets/img/imgs/250210-discord-free.avif){: width="300" }](https://discord.gg/NgqMgwwtMH){:target="_blank"}',
                        "",
                        "## Follow me on social media",
                        "",
                        '- [Twitter (or "X")](https://x.com/link_arzu){:target="_blank"}',
                        '- [LinkedIn](https://www.linkedin.com/in/christianarzu){:target="_blank"}',
                        '- [TikTok](https://www.tiktok.com/@linkarzu){:target="_blank"}',
                        '- [Instagram](https://www.instagram.com/link_arzu){:target="_blank"}',
                        '- [GitHub](https://github.com/linkarzu){:target="_blank"}',
                        '- [Threads](https://www.threads.net/@link_arzu){:target="_blank"}',
                        '- [OnlyFans 🍆](https://linkarzu.com/assets/img/imgs/250126-whyugae.avif){:target="_blank"}',
                        '- [YouTube (subscribe MF, subscribe)](https://www.youtube.com/@linkarzu){:target="_blank"}',
                        '- [Ko-Fi](https://ko-fi.com/linkarzu/goal?g=6){:target="_blank"}',
                        "",
                        "## All links in the video description",
                        "",
                        "- The following links will be in the YouTube video description:",
                        "  - Each one of the videos shown",
                        "  - A link to this blogpost",
                        "",
                        "## How do you manage your passwords?",
                        "",
                        "- I've tried many different password managers in the past, I've switched from `LastPass` to `Dashlane` and finally ended up in `1password`",
                        "- You want to find out why? More info in my article:",
                        '  - [How I use 1password to keep all my accounts safe](https://linkarzu.com/posts/1password/1password/){:target="_blank"}',
                        "- **If you want to support me in keeping this blogpost ad free, start your 1password 14 day free trial by clicking the image below**",
                        "",
                        '[![Image](../../assets/img/imgs/250124-1password-banner.avif){: width="300" }](https://www.dpbolvw.net/click-101327218-15917064){:target="_blank"}',
                        "",
                        "",
                    }),
                })
        )

        -- Add a snippet for inserting a video markdown template
        table.insert(
            snippets,
            s({
                trig = "videotemplate",
                name = "Insert video markdown template",
                desc = "Insert video markdown template",
            }, {
                    t("## "),
                    i(1, "cursor"),
                    t(" video"),
                    t({ "", "", "All of the details and the demo are covered in the video:", "" }),
                    t({ "", "If you don't like watching videos, the keymaps are in " }),
                    t("[my dotfiles](https://github.com/linkarzu/dotfiles-latest)"),
                    t({
                        "",
                        "",
                        "```txt",
                        "Members only discord",
                        "https://www.youtube.com/channel/UCrSIvbFncPSlK6AdwE2QboA/join",
                        "",
                        "If you find this video helpful and want to support me",
                        "https://ko-fi.com/linkarzu",
                        "",
                        "Follow me on twitter",
                        "https://x.com/link_arzu",
                        "",
                        "My dotfiles (remember to star them)",
                        "https://github.com/linkarzu/dotfiles-latest",
                        "",
                        "Videos mentioned in this video:",
                        "",
                        "#linkarzu",
                        "",
                        "1:00 - VIDEO video 1",
                        "2:00 - VIDEO video 2",
                        "```",
                        "",
                        "Video timeline:",
                        "",
                        "```txt",
                        "0:00 -",
                        "```",
                        "",
                        "```txt",
                        "Join discord for free -> https://discord.gg/NgqMgwwtMH",
                        "If you want to support me by becoming a YouTube member",
                        "https://www.youtube.com/channel/UCrSIvbFncPSlK6AdwE2QboA/join",
                        "☕ Support me -> https://ko-fi.com/linkarzu",
                        "☑ My Twitter -> https://x.com/link_arzu",
                        "❤‍🔥 My tiktok -> https://www.tiktok.com/@linkarzu",
                        "Start your setap free trial (my affiliate link)",
                        "setapp.sjv.io/QjKK1a",
                        "Start your 1password trial  (my affiliate link)",
                        "https://www.dpbolvw.net/click-101327218-15917064",
                        "My dotfiles (remember to star them) -> https://github.com/linkarzu/dotfiles-latest",
                        "A link to my resume -> https://resume.linkarzu.com/",
                        "```",
                        "",
                    }),
                })
        )

        table.insert(
            snippets,
            s({
                trig = "video-skitty",
                name = "New video in skitty-notes",
                desc = "New video in skitty-notes",
            }, {
                    t("## "),
                    i(1, "video name"),
                    t({
                        "",
                        "",
                        "- [ ] ",
                    }),
                    i(2, ""), -- This is now the second jump point
                    t({
                        "",
                        "- [ ] **Thank supporters**",
                        "- [ ] Push GitHub changes",
                        "- [ ] Share discord server",
                        "",
                    }),
                })
        )

        -- Basic bash script template
        table.insert(
            snippets,
            s({
                trig = "bashex",
                name = "Basic bash script example",
                desc = "Simple bash script template",
            }, {
                    t({
                        "```bash",
                        "#!/bin/bash",
                        "",
                        "echo 'helix'",
                        "echo 'deeznuts'",
                        "```",
                        "",
                    }),
                })
        )

        -- Basic Python script template
        table.insert(
            snippets,
            s({
                trig = "pythonex",
                name = "Basic Python script example",
                desc = "Simple Python script template",
            }, {
                    t({
                        "```python",
                        "#!/usr/bin/env python3",
                        "",
                        "def main():",
                        "    print('helix dizpython')",
                        "",
                        "if __name__ == '__main__':",
                        "    main()",
                        "```",
                        "",
                    }),
                })
        )

        ls.add_snippets("markdown", snippets)

        -- #####################################################################
        --                         all the filetypes
        -- #####################################################################
        ls.add_snippets("all", {
            s({
                trig = "workflow",
                name = "Add this -> lamw26wmal",
                desc = "Add this -> lamw26wmal",
            }, {
                    t("lamw26wmal"),
                }),

            s({
                trig = "lam",
                name = "Add this -> lamw26wmal",
                desc = "Add this -> lamw26wmal",
            }, {
                    t("lamw26wmal"),
                }),

            s({
                trig = "mw25",
                name = "Add this -> lamw26wmal",
                desc = "Add this -> lamw26wmal",
            }, {
                    t("lamw26wmal"),
                }),
        })

        return opts
    end,
}
