return {
    {
        "shellRaining/hlchunk.nvim",
        event = { "UIEnter" },
        init = function()
            require('hlchunk').setup({
                chunk = {
                    enable = true,
                    use_treesitter = true,
                },
                indent = {
                    chars = { "│", "¦", "┆", "┊", },
                    use_treesitter = false,
                },
                blank = {
                    enable = false,
                },
                line_num = {
                    use_treesitter = true,
                },
            })
        end
    },
}
