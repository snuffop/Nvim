return {
    {
        'vimwiki/vimwiki',
        lazy = false,
        init = function()
            vim.g.vimwiki_list = {
                {
                    path = '~/Nextcloud/Vimwiki',
                    syntax = 'markdown',
                    ext = '.md',
                    ignoreFolders = { 'node_modules', '.git' },

                }
            }
            vim.g.vimwiki_markdown_link_ext = 1
        end,
    },
    {
        'michal-h21/vim-zettel',
        lazy = false,
        init = function()
        end,
    },
    {
        'tools-life/taskwiki',
        lazy = false,
        init = function()
            vim.g.taskwiki_markup_syntax = 'markdown'
        end,
    }
}
