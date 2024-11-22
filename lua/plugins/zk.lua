--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

-- ZK config
return {
    "zk-org/zk-nvim",
    lazy = false,
    config = function()
        require("zk").setup({
            picker = "telescope",
            lsp = {
                cmd = {"zk", "lsp"},
                name = "zk",
            },
            auto_attach = {
                enable = true,
                filetypes = { "markdown" },
            },
        })
    end
}


-- :'<,'>ZkNewFromTitleSelection [{options}]
-- :'<,'>ZkNewFromContentSelection [{options}]
-- :'<,'>ZkInsertLinkAtSelection [{options}]
-- :'<,'>ZkMatch [{options}]
