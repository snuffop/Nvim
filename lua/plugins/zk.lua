--  ╭──────────────────────────────────────────────────────────╮
--  │ Marty Buchaus Neovim Configuration                       │
--  ╰──────────────────────────────────────────────────────────╯

-- ZK config

return {
    "zk-org/zk-nvim",
    lazy = false,
    config = function()
        require("zk").setup({
            picker = "snacks_picker",
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
