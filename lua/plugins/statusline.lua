local colors = {
    black        = '#282828',
    white        = '#ebdbb2',
    red          = '#fb4934',
    green        = '#b8bb26',
    blue         = '#83a598',
    yellow       = '#fe8019',
    gray         = '#a89984',
    darkgray     = '#3c3836',
    lightgray    = '#504945',
    inactivegray = '#7c6f64',
    cyan         = '#008080',
    darkblue     = '#081633',
    orange       = '#FF8800',
    violet       = '#a9a1e1',
    magenta      = '#c678dd',
}

return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'gruvbox_dark',
                component_separators = '',
                section_separators = '',
                disabled_filetypes = {},
                always_divide_middle = true,
                globalstatus = true,
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'filename' },
                lualine_c = {
                    {
                        'diagnostics',
                        sources = { 'nvim_diagnostic', 'coc' },
                        symbols = { error = ' ', warn = ' ', info = ' ' },
                        diagnostics_color = {
                            error = { fg = colors.red },
                            warn = { fg = colors.orange },
                            info = { fg = colors.cyan },
                            hint = { fg = colors.green },
                        },
                    },
                },
                lualine_x = {
                    {
                        'filetype',
                        icon_only = true,
                    },
                    {
                        'encoding',
                        fmt = string.upper,
                        color = { gui = 'bold' },
                    }
                },
                lualine_y = {
                    {
                        'progress',
                        color = { gui = 'bold' },
                    }
                },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            extensions = {}
        }
    end
}
